<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">


<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
});
</script>
<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
					<div>
						<ul class="tabs">
							<li id="tab-all" data-category="all">전체 이벤트</li>
							<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
							<li id="tab-ended" data-category="ended">종료된 이벤트</li>
							<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
						</ul>
					</div>
					
					<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">
									총 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}개</font> (${page}/${total_page} 페이지)
								</td>
								<td align="right">
									&nbsp;
								</td>
							</tr>
						</table>
							
							<div class="card mb-5 w-80 text-center" style="margin:0 auto">
				            	<div class="card-header">
				                	<h3>
				                      <i class="fa-regular fa-calendar"></i> 이벤트 관리 
					                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';" title="새로고침" style="float:right;">
					                    	<i class="fa-solid fa-arrow-rotate-left"></i>
					                    </button>
					                </h3>
					             </div>

								<table class="table table-border table-list">
									<thead>
										<tr>
											<th width="60">번호</th>
											<th>제목</th>
											<th width="150">이벤트 시작일</th>
											<th width="170">이벤트 종료일</th>
											<th width="80">&nbsp;</th>
										</tr>
									</thead>
								 
								 	<tbody>
										<c:forEach var="dto" items="${list}" varStatus="status">
											<tr> 
												<td>${dataCount - (page-1) * size - status.index}</td>
												<td class="left">
													<a href="${articleUrl}&eventNum=${dto.eventNum}">${dto.subject}</a>
												</td>
												<td>${dto.startDate}</td>
												<td>${dto.endDate}</td>
												<td>&nbsp;</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								 
								<div class="page-navigation">
									${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
								</div>
								
								<table class="table">
									<tr>
										<td align="center">
											<form name="searchForm" action="${pageContext.request.contextPath}/admin/eventManage/${category}/list" method="post" style="width:300px; margin-left:100px">
												<div class="input-group mb-3">
													<select name="schType" class="form-select">
														<option value="all" ${schType=="all"?"selected":""}>모두</option>
														<option value="startDate" ${schType=="startDate"?"selected":""}>시작일</option>
														<option value="endDate" ${schType=="endDate"?"selected":""}>종료일</option>
													</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-outline-secondary" onclick="searchList()">
													검색
												</button>
												</div>
											</form>
										</td>
										<td align="right" width="120">
											<button type="button" class="btn btn-success mb-3" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/write';">이벤트<br>등록</button>
										</td>
									</tr>
								</table>
							</div>    
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
