package com.gr.farming.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@RequestMapping("/qnaMain")
	public String qnaMain() {
		return "qna/qnaMain";
	}
}
