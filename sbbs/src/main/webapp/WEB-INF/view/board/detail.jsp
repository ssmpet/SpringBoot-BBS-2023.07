<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newline", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		td { text-align: center;}
		.disabled-link { pointer-events: none;}
	</style>
</head>
<body>

	<%@ include file="../common/top.jspf" %>
	<div class="container" style="margin-top: 80px; margin-bottom:50px;">
    	<div class="row">
			<%@ include file="../common/aside.jspf" %>
			<!-- ======================== main ==============================  -->
			<div class="col-sm-9">
				 <h3><strong>게시글 상세 조회</strong>
                    <span style="font-size: 0.6em;">
                        <a href="/sbbs/board/list?p=${currentBoardPage}&f=${field}&q=${query}" class="ms-5""><i class="fas fa-list-ul"></i> 목록</a>
                    <%-- 본인만 수정 가능 --%>
                    <c:if test="${sessUid eq board.uid}">
                    	<a href="/sbbs/board/update/${board.bid}?&f=${field}&q=${query}" class="ms-3"><i class="far fa-edit"></i> 수정</a>
                        <a href="/sbbs/board/delete/${board.bid}?&f=${field}&q=${query}" class="ms-3"><i class="fas fa-trash-alt"></i> 삭제</a>
                    </c:if>
                    <c:if test="${sessUid ne board.uid}">
                    	<a href="#" class="ms-3 disabled-link"><i class="far fa-edit"></i> 수정</a>
                    	<a href="#" class="ms-3 disabled-link"><i class="fas fa-trash-alt"></i> 삭제</a>
                    </c:if>
                    </span>
                </h3>
				<hr>
				<div class="row">
                    <div class="col-8">
                        <h5>${board.title}</h5>
                        <h6>글번호 : ${board.bid} | ${fn:replace(board.modTime, 'T', ' ')}</h6>
                        <h6>첨부파일 : 
                    <c:forEach var="file" items="${fileList}">
                    	<a href="/sbbs/file/download/${file}" class="me-2" download>${file}</a>  
                    </c:forEach> 
                        </h6>
                    </div>
                    <div class="col-4 text-end">
                        <h5>${board.uname}</h5>
                        <h6>조회 ${board.viewCount}&nbsp;&nbsp;댓글 ${board.replyCount}</h6>
                    </div>

                    <div class="col-12"><hr></div>
                    <div class="col-12">
                        ${fn:replace(board.content, newline, '<br>')}
                    </div>

                    <div class="col-12"><hr></div>
                    <div class="col-12">
                <c:forEach var="reply" items="${replyList}">
                	<c:if test="${reply.isMine eq 0}">
                        <div class="d-flex flex-row mt-1">
                            <div class="card bg-light text-dark w-75">
                                <div class="card-body">
                                    ${reply.uname}&nbsp;&nbsp;${fn:replace(reply.regTime, 'T', ' ')}<br>    <!-- uname, regTime-->
                                    ${reply.comment}  <!-- content -->
                                </div>
                            </div>
                        </div>
                	</c:if>
                	<c:if test="${reply.isMine eq 1}">
                        <div class="d-flex flex-row-reverse mt-1">
                            <div class="card w-75">
                                <div class="card-body text-end">
                                	${reply.uname}&nbsp;&nbsp;${fn:replace(reply.regTime, 'T', ' ')}<br>
                                    ${reply.comment}  <!-- content -->
                                </div>
                            </div>
                        </div>
                	</c:if>
                </c:forEach>
                        <form class="form-inline" action="/sbbs/reply/write" method="post">
                            <input type="hidden" name="bid" value="${board.bid}">
                            <input type="hidden" name="uid" value="${board.uid}">
                            <input type="hidden" name="f" value="${field}">
                            <input type="hidden" name="q" value="${query}">
                            <table class="table table-borderless mt-2">
                                <tr class="d-flex">
                                    <td class="col-1 text-end">
                                        <label for="content" class="col-form-label mt-4">댓글</label>
                                    </td>
                                    <td class="col-9">
                                        <textarea class="form-control" name="comment" rows="3"></textarea>
                                    </td>
                                    <td class="col-2">
                                        <button type="submit" class="btn btn-primary mt-4">등록</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
               </div>
			
			</div>
			<!-- ======================== main ==============================  -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
	
</body>
</html>