<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main class="wrapper" style="margin:0 auto; width:80%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; padding-top:5%">
				<div class="body-main">
					<c:if test="${not empty list}">
					    <div class="accordion" id="accordionFlush">
					        <h3 class="mb-3 p-2" style="border-bottom:2px solid #32B0E4;">
						    	<i class="fas fa-clipboard-list"  ></i> 서비스 이용 약관
						    </h3>
					        <c:forEach var="dto" items="${list}" varStatus="status">
					            <div class="accordion-item mt-3">
					                <h2 class="accordion-header" id="flush-heading-${status.index}">
					                    <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
					                        <div class="col-7 subj">Q.&nbsp;${dto.subject}</div>
					                    </button>
					                </h2>
					                <div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush">
					                    <div class="accordion-body">
					                        <div class="p-2 answer">
					                            A.&nbsp;${dto.content}
					                        </div>
					                    </div>
					                </div>
					            </div>
				        </c:forEach>
				    	</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</main>