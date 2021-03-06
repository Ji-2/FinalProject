package com.gr.farming.request.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.farming.category.model.CategoryService;
import com.gr.farming.category.model.CategoryVO;
import com.gr.farming.common.ConstUtil;
import com.gr.farming.common.FieldSearchVO;
import com.gr.farming.common.FileUploadUtil;
import com.gr.farming.common.PaginationInfo;
import com.gr.farming.common.SearchVO2;
import com.gr.farming.field.model.FieldDetailVO;
import com.gr.farming.findExp.model.ExpertInfoVO;
import com.gr.farming.findExp.model.FindExpService;
import com.gr.farming.member.model.MemberService;
import com.gr.farming.request.model.FinalRequestVO;
import com.gr.farming.request.model.RequestDesignVO;
import com.gr.farming.request.model.RequestDevelopVO;
import com.gr.farming.request.model.RequestQnaVO;
import com.gr.farming.request.model.RequestService;
import com.gr.farming.request.model.RequestVO;

@Controller
@RequestMapping("/request")
public class RequestController {

	private static final Logger logger
		= LoggerFactory.getLogger(RequestController.class);
	
	private final RequestService requestService;
	private final CategoryService categoryService;
	private final FindExpService findExpService;
	private final MemberService memService;
	private final FileUploadUtil fileUploadUtil;

	@Autowired
	public RequestController(RequestService requestService, CategoryService categoryService,
			FindExpService findExpService, MemberService memService, FileUploadUtil fileUploadUtil) {
		this.requestService = requestService;
		this.categoryService = categoryService;
		this.findExpService = findExpService;
		this.memService = memService;
		this.fileUploadUtil = fileUploadUtil;
	}

	@RequestMapping("/request")
	public void request(@RequestParam int categoryNo, Model model) {
		logger.info("????????? ?????? ???????????? ????????????, ???????????? categoryNo={}", categoryNo);

		CategoryVO categoryVo=categoryService.selectByNo(categoryNo);
		String detail=categoryVo.getDetail();
		
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("detail", detail);
		
	}
	
	@GetMapping("/requestWrite")
	public String request_get(@RequestParam int categoryNo,
			@RequestParam(defaultValue="0") int expertNo, Model model) {
		
		logger.info("????????? ?????? ???????????? ????????????, ???????????? categoryNo={}", categoryNo);
		CategoryVO categoryVo=categoryService.selectByNo(categoryNo);

		String main=categoryVo.getMain();
		String detail=categoryVo.getDetail();
		logger.info("detail={}",detail);
		
		List<Map<String, Object>> qList=requestService.selectQuestion(categoryNo);
		logger.info("????????? ?????? ?????? ??????, qList.size={}", qList.size());
		
		List<RequestQnaVO> aList=requestService.selectRequestQna(categoryNo);
		
		model.addAttribute("qList", qList);
		model.addAttribute("aList", aList);
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("main", main);
		model.addAttribute("expertNo", expertNo);
		model.addAttribute("detail", detail);
		
		return "request/request_1";
	}
	
	@PostMapping("/requestWrite/develop")
	public String requestDevelop_post(@ModelAttribute RequestDevelopVO vo, 
			@ModelAttribute RequestVO requestVo, Model model) {
		
		logger.info("????????? ?????? ???????????? ??????");
		logger.info("????????? ?????? ???????????? vo={}", vo);
		
		int cnt=requestService.insertRequestDevelop(vo);
		logger.info("????????? ?????? ?????? cnt={}", cnt);
		
		requestVo.setRequestDevelopNo(vo.getRequestdevelopNo());
		cnt=requestService.insertRequest(requestVo);
		logger.info("????????? ?????? requestVo={}", requestVo);
		logger.info("??????????????? ?????? ?????? cnt={}", cnt);
		
		String msg="????????? ????????? ??????", url="request/request_develop";
		if(cnt>0) {
			msg="????????? ????????? ?????????????????????.";
			url="/request/request_success";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@PostMapping("/requestWrite/design")
	public String requestDesign_post(@ModelAttribute RequestDesignVO vo, 
			@ModelAttribute RequestVO requestVo, Model model) {
		logger.info("????????? ?????? ???????????? ??????, ???????????? vo={}", vo);
		
		int cnt=requestService.insertRequestDesign(vo);
		logger.info("??????????????? ?????? ?????? cnt={}", cnt);
		
		requestVo.setRequestDesignNo(vo.getRequestDesignNo());
		cnt=requestService.insertRequest(requestVo);
		logger.info("????????? ?????? requestVo={}", requestVo);
		logger.info("??????????????? ?????? ?????? cnt={}", cnt);
		
		String msg="????????? ????????? ??????", url="request/request_design";
		if(cnt>0) {
			msg="????????? ????????? ?????????????????????.";
			url="/request/request_success";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/request_success")
	public String request_success() {
		logger.info("????????? ?????? ?????? ??????");
		return "request/request_success";
	}
	
	@RequestMapping("/requestByClient")
	public String requestByClient(@ModelAttribute FieldSearchVO fieldSearchVo
			, HttpSession session, Model model) {
		
		int expertNo=(int) session.getAttribute("userNo");
		ExpertInfoVO expInfoVo=findExpService.selectExpInfo(expertNo);
		if(expInfoVo==null) {
			model.addAttribute("msg", "??????????????? ?????? ???????????????.");
			model.addAttribute("url", "/expert/addExp/addExp");
			return "common/message";
		}
		
		fieldSearchVo.setUserNo(expertNo);
		logger.info("?????? ?????? ????????? - ???????????? fieldSearchVo={}", fieldSearchVo);
		
		List<Map<String, Object>> sendList=requestService.selectFinalRequest(expertNo);
		
		String detail=fieldSearchVo.getDetail();
		if(detail==null || detail.isEmpty()) {
			fieldSearchVo.setDetail("");
		}
		
		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(fieldSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2] fieldSearchVo??? ???????????? ????????? ??? ??????
		fieldSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		fieldSearchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("??? ?????? ??? fieldSearchVo={}", fieldSearchVo);
		
		ExpertInfoVO infoVo=findExpService.selectExpInfo(expertNo);
		List<FieldDetailVO> fieldList=findExpService.selectFieldDetail(expertNo);
		
		List<Map<String, Object>> list=null;
		int cNo=infoVo.getCategoryNo();
		if(cNo<15) {
			list=requestService.selectRequestList1(fieldSearchVo);
		}else if(cNo>=15) {
			list=requestService.selectRequestList2(fieldSearchVo);
		}
		
		logger.info("?????? ?????? ?????? ?????? list={}", list);
		logger.info("?????? ?????? ?????? ?????? detail={}, list.size={}", fieldSearchVo.getDetail(),list.size());
		
		int totalRecord=requestService.selectTotalRecord(fieldSearchVo);
		logger.info("?????? ?????? ?????? ?????? ??? - totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("sendList", sendList);
		model.addAttribute("fieldList", fieldList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "request/requestByClient";
	}
	
	@GetMapping("/finalRequest")
	public String sendFinalRequest(@RequestParam(defaultValue="0") int requestNo,
			 HttpSession session, Model model) {
		int expertNo=(int) session.getAttribute("userNo");
		
		logger.info("?????? ????????? ?????????, ???????????? requestNo={} ", requestNo);
		
		RequestVO vo=requestService.selectReceivedRequest(requestNo);
		logger.info("?????? ???????????? - vo={}", vo);
		
		int developNo=vo.getRequestDevelopNo();
		int designNo=vo.getRequestDesignNo();
		vo.setExpertNo(expertNo);
		Map<String, Object> map=null;
		if(developNo!=0) {
			map=requestService.selectRequestDetail1(vo);
		}else if(designNo!=0) {
			map=requestService.selectRequestDetail2(vo);
		}
		logger.info("?????? ???????????? ?????? - map={}", map);
		List<Map<String, Object>> qList=requestService.selectQuestion(vo.getCategoryNo());
		
		model.addAttribute("developNo", developNo);
		model.addAttribute("designNo", designNo);
		model.addAttribute("map", map);
		model.addAttribute("qList", qList);
		
		return "/request/finalRequest";
		
	}
	
	@PostMapping("/finalRequest")
	public String sendFinalRequest(@ModelAttribute FinalRequestVO vo,
			HttpServletRequest request, HttpSession session,Model model) {
		
		int expertNo=(int) session.getAttribute("userNo");
		vo.setExpertNo(expertNo);
		logger.info("?????? ????????? ????????? - ???????????? ?????? ????????????, vo={}", vo);
		
		//?????? ????????? ??????
		String fileName="", originName="";
		long fileSize=0;
		int pathFlag=ConstUtil.UPLOAD_REQUSET_FLAG;
		try {
			List<Map<String, Object>> fileList 
				= fileUploadUtil.fileUpload(request, pathFlag);
			for(int i=0;i<fileList.size();i++) {
				 Map<String, Object> map=fileList.get(i);
				 
				 fileName=(String) map.get("fileName");
				 originName=(String) map.get("originalFileName");
				 fileSize=(long) map.get("fileSize");				 
			}
			
			logger.info("?????? ????????? ??????, fileName={}", fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//2
		vo.setFilename(fileName);
		vo.setOriginalFilename(originName);
		vo.setFilesize(fileSize);
		
		int cnt=requestService.insertFinalRequest(vo);
		String msg="????????????????????? ??????", url="/";
		if(cnt>0) {
			msg="?????????????????? ?????????????????????.";
			url="/request/requestByClient";
		}
		
		requestService.updateMatchA(vo.getRequestNo());
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/myRequest")
	public String myRequest(HttpSession session, Model model) {
		
		logger.info("???????????? ??????");
		
		int memberNo=(int) session.getAttribute("userNo");
		
		List<Map<String, Object>> list=requestService.selectMyRequestAll(memberNo);
		logger.info("?????? ?????? list={}", list);
		logger.info("?????? ?????? list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "request/MyRequest";
	}
	
	@RequestMapping("/requestByExpert")
	public String requestByExpert(@RequestParam(defaultValue="0") int requestNo, 
			@ModelAttribute SearchVO2 searchVo, HttpSession session, Model model) {
		
		logger.info("?????? ?????? ?????? ?????? ?????????, ???????????? searchVo={}", searchVo);
		int memberNo=(int) session.getAttribute("userNo");
		searchVo.setMemNo(memberNo);
		
		
		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2] fieldSearchVo??? ???????????? ????????? ??? ??????
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("??? ?????? ??? SearchVo={}", searchVo);
		
		List<Map<String, Object>> list=requestService.selectFinalDetail(requestNo);
		logger.info("???????????? ?????? list.size={}", list.size());
		
		RequestVO vo=requestService.selectReceivedRequest(requestNo);
		logger.info("?????? ???????????? - vo={}", vo);
		
		int developNo=vo.getRequestDevelopNo();
		int designNo=vo.getRequestDesignNo();
		
		Map<String, Object> myRequest=requestService.selectMyRequestDetail(requestNo);
		List<Map<String, Object>> qList=requestService.selectQuestion(vo.getCategoryNo());
		
		int totalRecord=requestService.selectTotalRecord2(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("?????? ?????? ?????? ?????? ??? - totalRecord={}", totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("qList", qList);
		model.addAttribute("map", myRequest);
		model.addAttribute("developNo", developNo);
		model.addAttribute("designNo", designNo);
		
		return "request/requestByExpert";
	}
	
	
}













