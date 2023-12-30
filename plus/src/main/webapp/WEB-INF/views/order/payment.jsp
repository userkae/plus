<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">

function sendOk() {
	const f = document.paymentForm;
	
	if(! f.recipientName.value) {
		alert("먼저 배송지를 등록하세요..");
		return;
	}

	// 결제 API에서 응답 받을 파라미터
	let payMethod = "카드결제"; // 결제유형
	let cardName = "BC 카드";  // 카드 이름
	let authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.payment.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${orderUser.email}";  // 구매자 이메일
	let buyer_name = "${orderUser.userName}";  // 구매자 이름
	let buyer_tel = "${orderUser.tel}";   // 구매자 전화번호(필수)
	let buyer_addr = "${orderUser.addr1}" + " " + "${orderUser.addr2}";  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = "${orderUser.zip}"; // 구매자 우편번호
	
	// 결제 API로 결제 진행
	
	
	
	// 결제가 성공한 경우 ------------------------
	
	// 결제 방식, 카드번호, 승인번호, 결제 날짜
	f.payMethod.value = payMethod;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
	
	f.action = "${pageContext.request.contextPath}/order/paymentOk"
	f.submit();
}

function payOk(){
	const f = document.paymentForm;
	const regex = /^\d+$/;
	let count = f.count.value;
	let uMileage = f.uMileage.value;
	
	if(!regex.test(count)){
		alert("숫자만 입력하세요.");
		f.count.focus();
		return;
	}
	
	let count1 = f.count1.value;
	if(count > count1){
		alert("입력하신 인원수가 클래스의 최대 인원수를 초과하였습니다.");
		f.count.focus();
		return;
	}
	
	if(!regex.test(uMileage)){
		alert("숫자만 입력하세요.");
		f.uMileage.focus();
		return;
	}
	
	let totalMileage = f.totalMileage.value;
	if(uMileage > totalMileage){
		alert("입력하신 마일리지가 고객님께서 보유하고 계신 마일리지를 초과하였습니다.");
		f.uMileage.focus();
		return;
	}
	
	var pay = document.getElementById("pay").value;
	if(pay === ""){
		alert("'입력완료' 버튼을 클릭해주세요.");
		return;
	}
	
	if(!confirm("입력하신 정보들과 결제 금액이 올바른지 확인해주시기 바랍니다.")){
		return;
	}
	
	f.submit();
}

function checkPay(){
	const f = document.paymentForm;
	
	let total;
	let percent;
	percent = f.pay1.value * f.discountPercent.value / 100;
	total = f.pay1.value * f.count.value - f.discountMoney.value - f.uMileage.value - percent;
	document.getElementById("pay").value = total;
}

</script>


<style>
@import
	url("https://fonts.googleapis.com/css?family=Raleway:300,400,700");

#main {
	position: relative;
	width: 700px;
	height: 500px;
	margin: 10% auto;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	background-color: white;
}

#left {
	position: relative;
	background:
		url("${pageContext.request.contextPath}/resources/images/keyimage3.jpg");
	background-size: cover;
	background-position: center;
	height: calc(100% + 50px);
	width: 40%;
	top: -35px;
	left: -50px;
	padding: 10px 25px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	color: white;
	display: flex;
	flex-flow: column nowrap;
	justify-content: space-between;
}

#left #head {
	opacity: 0.95;
}

#right {
	position: absolute;
	width: calc(60% - 40px);
	height: 100%;
	top: 0;
	left: 40%;
	display: flex;
	flex-flow: column nowrap;
	padding-left: 20px;
}

#right form {
	display: flex;
	flex-flow: column nowrap;
	width: 100%;
}

#right form input, #right form select {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	border: none;
	border-bottom: 1.5px solid #ccc;
	padding: 5px;
	margin-top: 2.5px;
	position: relative;
}

#right form .form-field {
	display: flex;
	flex-flow: column nowrap;
	justify-content: center;
	margin-bottom: 12.5px;
}

#right form #date-val {
	display: flex;
	justify-content: space-between;
}

#right form #date-val select {
	width: 45%;
}

#right form button[type="button"] {
	background: linear-gradient(135deg, #4183d7 0%, #66cc99 100%);
	padding: 5px;
	border: none;
	border-radius: 50px;
	color: white;
	font-weight: 400;
	font-size: 12pt;
	margin-top: 10px;
}

#right form button[type="button"]:hover {
	background: transparent;
	box-shadow: 0 0 0 3px #4183d7;
	color: #4183d7;
}
</style>


<main class="wrapper main" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 100%; margin: 5% auto;">
				<div class="body-main">
					<main id="main" style="width: 1000px; height: 1000px;">
						<section id="left">
							<div id="head">
								<h1>${lesson.className}</h1>
								<p>${lesson.userName}</p>
							</div>
							<h3><fmt:formatNumber value="${dto.price}" pattern="#,###" />${lesson.price}원</h3>
						</section>
						<section id="right">
							<h1 class="text-center">payment</h1>
							<form action="${pageContext.request.contextPath}/order/insert" method="post" name="paymentForm">
								<div id="form-card" class="form-field">
									<label for="userName">예약자명</label>
									<input type="text" name="userName" id="userName" value="${user.userName}" readonly>
								</div>

								<div id="form-card" class="form-field">
									<label for="birth">생년월일</label>
									<input type="text" name="birth" id="birth" value="${user.birth}" readonly>
								</div>

								<div id="form-date" class="form-field">
									<label for="classDate">예약날짜</label>
									<input type="text" name="classDate" id="classDate" value="${classDate1}" readonly>
								</div>
								
								<div id="form-date" class="form-field">
									<label for="startTime">시작시간</label>
									<input type="text" name="startTime" id="startTime" value="${startTime}" readonly>
								</div>
								
								<div id="form-date" class="form-field">
									<label for="endTime">종료시간</label>
									<input type="text" name="endTime" id="endTime" value="${endTime}" readonly>
								</div>

								<div id="form-card" class="form-field">
									<label for="count">인원수</label>
									<input type="number" name="count" id="count" placeholder="인원수를 입력해주세요." min='1' max='${lesson.count1}' step='1' value="1" required>
								</div>

								<div id="form-sec-code" class="form-field">
									<label for="uMileage">적립금(사용)</label>
									<input type="number" name="uMileage" id="uMileage" placeholder="사용하실 적립금을 입력해주세요" min='0' max='${user.totalMileage}' step='1' value="0"> 
								</div>
								
								<div id="form-sec-code" class="form-field">
									<label for="mileage">적립금(적립)</label>
									<input type="number" name="mileage" id="mileage" value="${lesson.mileage}" readonly>
								</div>
								
								<div id="form-card" class="form-field">
									<label for="discountMoney">할인 금액</label>
									<input type="number" name="discountMoney" id="discountMoney" value="${empty lesson.discountMoney ? 0 : lesson.discountMoney}" readonly>
								</div>
								
								<div id="form-card" class="form-field">
									<label for="discountPercent">할인 퍼센트</label>
									<input type="number" name="discountPercent" id="discountPercent" value="${lesson.discountPercent != null ? lesson.discountPercent : 0}" readonly>
									<button type="button" style="width: 80px;" onclick="checkPay();">입력완료</button>
								</div>
								<input type="hidden" name="classNum" value="${lesson.classNum}">
								<input type="hidden" name="detailNum" value="${lesson.detailNum}">
								<input type="hidden" name="pay1" id="pay1" value="${lesson.price}">
								<input type="hidden" name="count1" value="${lesson.count1}">
								<input type="hidden" name="totalMileage" value="${user.totalMileage}">
								
								<div id="form-card" class="form-field">
									<label for="pay">결제 금액</label>
									<div>
										<input id="pay" class="pay" name="pay">
									</div>
								</div>
								<button type="button" onclick="payOk();">결제하기</button>
							</form>
						</section>
					</main>
				</div>
			</div>
		</div>
	</div>
</main>