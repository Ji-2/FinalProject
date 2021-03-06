<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>
<style>
.btn-outline-mute {
  color: #2CCE8D;
  border-color: #2CCE8D;
}

.btn-outline-mute:hover {
  color: #fff;
  background-color: #2CCE8D;
  border-color: #2CCE8D;
}
</style>
<script type="text/javascript">
var contextPath = "/farming";
$(function(){
	$('#out').click(function(){
		if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
		}
	});
});
</script>
    <section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="<c:url value='/index'/>">Home</a></li>
          <li class="breadcrumb-item"><a href="<c:url value='/expert/mypage/main'/>">마이페이지</a></li>
          <li class="breadcrumb-item active">탈퇴</li>
        </ol>
        <h1 class="hero-heading mb-0">전문가 탈퇴</h1>
        <p class="text-muted mb-5">Please check if you want to withdraw.</p>
        
        <div class="row" style="margin-left:340px;">
          <div class="col-lg-7 mb-5 mb-lg-0"> 
            <div class="text-block"> 
            <form name="frmOut" method="post" 
				action="<c:url value='/expert/mypage/out'/>" >


				<fieldset>	<legend>전문가 탈퇴</legend>
					<p class="p">전문가 탈퇴하시겠습니까?</p>
					<div class="mb-4">
		                <label class="form-label" for="email"> 이메일</label>
		                <input class="form-control" name="email" id="email" type="text" value="${email}" readonly="readonly">
		              </div>
					<div class="mb-4">
		                <label class="form-label" for="pwd"> 비밀번호</label>
		                <input class="form-control" name="pwd" id="pwd" type="password">
		              </div>
					<div class="row form-block flex-column flex-sm-row">
					<!-- btn btn-outline-muted -->
		            	<div class="col text-center text-sm-start"><a href="<c:url value='/expert/mypage/main'/>" value="취소" class="btn btn-outline-mute" id="prev">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</a></div>
		            	<div class="col text-center text-sm-end" id="submit"><input type="submit" value="    탈퇴    " class="btn btn-primary px-3"></div>
			         </div>
				</fieldset>	
			</form>
            </div>
          </div>
        </div>
      </div>
    </section>

<%@ include file="../../inc/bottom.jsp" %>