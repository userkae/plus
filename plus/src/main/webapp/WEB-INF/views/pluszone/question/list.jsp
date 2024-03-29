<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>
<script type="text/javascript">
function questionOk() {
	const f = document.questionForm;
	
	f.action = "${pageContext.request.contextPath}/pluszone/question/questionOk";
    f.submit();
}
</script>


<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
		<div class="row justify-content-center">
			<div class="col-8">
				<h5 class="pb-2 fw-bold fs-2 pb-4 border-dark border-3 border-bottom">
					<i class="bi bi-book me-2"></i> 플러스 질문지
				</h5>
				<div class="border bg-white mt-4 py-2">
					<form name="questionForm" method="post">
						<c:forEach var="dto" items="${list}" varStatus="status">
							<div class="px-4 py-2">
								 <div class="row border-bottom border-dark border-3 mb-2">
									<div class="col-12 p-2">
										<span class="fw-semibold text-black fs-5"><i class="bi bi-pencil-square me-2"></i>${status.count}. ${dto.subject}</span>
									</div>
								</div>
								<c:forEach var="vo" items="${sublist}">
									<c:if test="${dto.num==vo.num}">
										<div class="form-check form-check-inline mt-3">
											<input class="form-check-input" type="checkbox" name="pluszoneNums" value="${vo.pluszoneNum}">
									  		<label class="form-check-label">${vo.content}</label>
										</div>
									</c:if>
								</c:forEach>
							</div>	
						</c:forEach>
						
						<div class="col-12 mx-2 text-end px-4 mb-4">
							<button type="button" class="btn btn-outline-success"><span class="fw-semibold text-dark" onclick="questionOk();">등록하기 <i class="bi bi-check-lg"></i></span></button>
							<button type="button" class="btn btn-outline-danger"><span class="fw-semibold text-dark" onclick="location.href='${pageContext.request.contextPath}/';">취소하기 <i class="bi bi-x-lg"></i></span></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</main>