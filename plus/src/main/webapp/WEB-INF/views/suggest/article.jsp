<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">


.table-article img { max-width: 650px; }
.file-item { padding: 7px; margin-bottom: 3px; border: 1px solid #ced4da; color: #777777; }
</style>

<script type="text/javascript">
function deleteOk() {
    let query = 'num=${dto.sugNum}&${query}';
    let url = '${pageContext.request.contextPath}/suggest/delete?' + query;

    if(confirm('위 자료를 삭제 하시 겠습니까 ? ')) {
        location.href = url;
    }
}


</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
		    			
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				    <table class="table">
						<tr>
							<td align="left" width="50%">
								&nbsp;
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
				
					<div class="card mb-5 w-80 " style="margin:0 auto">
					    <div class="card-header text-center">
					    	<h3>
					    		<i class="fas fa-clipboard-list"></i> 문의사항
					    	</h3>
						</div>
						<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
							<table class="table">
								<thead>
									<tr>
										<td colspan="2" align="center">
										제목 : ${dto.subject}
										</td>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td width="50%" align="left">
											이름 : ${dto.userName}
										</td>
										<td width="50%" align="right">
											${dto.regDate}
										</td>
									</tr>
									
									<tr style="border-bottom:none;">
										<td colspan="2" valign="top" height="200">
											${dto.content}
										</td>
									</tr>
									
						
								</tbody>
							</table>
								
							<table class="table">
								<tr>
									<td width="50%" align="left">
															
						
							<c:choose>
							<c:when test="${sessionScope.member.userName==dto.userName}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/suggest/update?num=${dto.sugNum}&page=${page}';">수정</button>
							</c:when>			
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled>수정</button>
							</c:otherwise>
						</c:choose>
							
							
						
									
								    	
						    			<button type="button" class="btn btn-success" onclick="deleteOk();">삭제</button>
									</td>
								
									<td align="right">
										<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/suggest/list?${query}';">리스트</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>