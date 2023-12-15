<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>

<script type="text/javascript">
function check() {
    const f = document.boardForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return false;
    }

	str = f.content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/bbs/${mode}";
    
    return true;
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container pt-5" style="width:80%; margin:5% auto;">
				<div class="body-main">
					<div class="card mb-5 w-80" style="margin:0 auto">
			        	<div class="card-header text-center">
			            	<h3>
			                	<i class="bi bi-app"></i> 커뮤니티
				            </h3>
				        </div>
		
						<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
							<table class="table mt-5 write-form">
								<tr>
									<td class="bg-light col-sm-2" scope="row">제 목</td>
									<td>
										<input type="text" name="subject" class="form-control" value="${dto.subject}">
									</td>
								</tr>
			        
								<tr>
									<td class="bg-light col-sm-2" scope="row">작성자명</td>
			 						<td>
										<p class="form-control-plaintext">${sessionScope.member.userName}</p>
									</td>
								</tr>
			
								<tr>
									<td class="bg-light col-sm-2" scope="row">내 용</td>
									<td>
										<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;">${dto.content}</textarea>
									</td>
								</tr>
							</table>
				
							<table class="table table-borderless">
			 					<tr>
									<td class="text-center">
										<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
										<button type="reset" class="btn btn-success">다시입력</button>
										<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/bbs/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
										<c:if test="${mode=='update'}">
											<input type="hidden" name="num" value="${dto.num}">
											<input type="hidden" name="page" value="${page}">
										</c:if>
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



<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
