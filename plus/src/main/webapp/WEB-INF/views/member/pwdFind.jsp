﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.btn-confirm {
	background-color: #007BFF;
	border: none;
	color: white;
}
						
.btn-cancel {
	background-color: #6C757D;
	border: none;
	color: white;
}
						
.btn-confirm:hover {
	background-color: #0056b3;
}
						
.btn-cancel:hover {
	background-color: #5a6268;
}
.anno{
	margin-top: 20px;
	font-weight: 900;
	font-size: 19px;
}
.anno1{
	font-weight: 400;
	font-size: 18px;
	padding-bottom: 0px;
	color: #8c8c8c;
}
input::placeholder {
  color: #d2d2d2;
  font-size: 18px;
}
.find{
	border: 1px solid #ced4da;
	border-radius: 5px;
	width: 400px;
}
.find:focus{
	border-color: #3BE0CB;
	outline: none;
}
.box{
	width: 500px;
	height: 441px;
	padding: 40px 20px 40px 45px;
	margin: 0 auto;
}
.send{
	width: 400px;
	background: #1DD1AD;
	padding: 5px;
	border: none;
}
.cancel{
	width: 400px;
	background: #FF5A5A;
	padding: 5px;
	border: none;
}

</style>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.userId.value.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/pwdFind";
	f.submit();
}
</script>


<main class="wrapper" style="margin:5% auto; width:80%;">
	<div id="layoutSidenav_content">
	 	<div class="container-fluid px-5">
			<div class="body-container">	
				<div class="row justify-content-md-center">
		            <div class="col-md-7 pt-5">
		            <h2 class="text-center fw-bold pe-3">패스워드 찾기</h2>
		                <div class="border my-5 box">
		                    <form name="pwdForm" method="post" class="row g-3">
		                        
				                <div class="d-grid">
									<span class="form-control-plaintext anno pb-1">가입 아이디를 입력해주세요.</span>
				                </div>
		                        
		                        <div class="d-grid mt-0">
		                            <input type="text" name="userId" class="p-3 find" placeholder="아이디를 입력해주세요.">
		                        </div>
		                     
		                        
		                        <div class="d-grid">
									<p class="form-control-plaintext anno1 pt-0 mt-4" style="font-size:19px;">가입하신 아이디를 입력해주시면 <br>이메일로 고객님의 임시 패스워드를 보내드립니다.</p>
				                </div>
				                
		                        <div class="d-grid">
			                        <button type="button" class="btn btn-outline-success send text-light fs-5" style="height:60px" onclick="sendOk()">
			                            이메일 전송하기&nbsp;<i class="bi bi-send"></i>
			                        </button>
		                		</div>
		                	</form>
							<hr class="mb-3" style="width: 400px">
		                    <div class="col-12">
		                        <p class="text-center mb-0">
		                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none ms-5 me-3">회원가입</a>
		                        	<span class="border-end border-Secondary border-2  me-4 ms-4"></span>
		                        	<a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none me-5 pe-5 ms-3">아이디 찾기</a>
		                        </p>
		                    </div>
                   
			                <div class="d-grid">
								<p class="form-control-plaintext text-center py-3">${message}</p>
			                </div>
						</div>
		        	</div>
		        </div>
			</div>
		</div>
	</div>
</main>