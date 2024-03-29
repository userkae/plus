<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style> 
.numb{
	text-color: #3c3c3c;
}
.subj{
	text-colot: #3c3c3c;
}
.main-board {
	border: 1px solid #dee2e6;
	padding: 20px 16px;
	background: #e9ecef;
}
.accord-body{
	background: #f4f5f7;
	font-size: 19px;
}
</style>
<c:choose>
	<c:when test="${list.size() > 0}">
		<div class="accordion accordion-flush mt-1" id="accordionFlush">
			<div class="d-flex flex-row main-board fw-bold">
				<div class="col-2">Category</div>
				<div class="col-7">FAQ Title</div>
			</div>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="accordion-item" style="border: none;">
					<h2 class="accordion-header border" id="flush-heading-${status.index}">
						<button class="accordion-button fw-bold bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
							<div class="col-2 numb">[${dto.faqName}]</div>
							<div class="col-7 subj">Q.&nbsp;${dto.subject}</div>
						</button>
					</h2>
					<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush">
						<div class="accordion-body border accord-body fw-bolder text-white pt-4 pb-5">
							<div class="d-flex flex-row p-2 answer text-black-50">
								<div class="col-md-auto  ">A.</div>
								<div class="mx-2 col ">${dto.content}</div>
							</div>
						</div>
					</div>
				</div>		
			</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		<div class="text-center border-bottom">
			<h5 class="mt-5 mb-5"> 등록된 FAQ가 없습니다.</h5>
		</div>
	</c:otherwise>
</c:choose>