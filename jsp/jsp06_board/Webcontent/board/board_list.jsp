<%@page import="com.lec.board.vo.PageInfo"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.lec.board.vo.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int curPage = pageInfo.getPage();
	int totalPage = pageInfo.getTotalPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	ArrayList<BoardBean> boardList = (ArrayList<BoardBean>) request.getAttribute("boardList");

	String field = "";
	String query = ""; // boardList?f=board_name&q=홍길동
			
	if(request.getParameter("f") != null) field = request.getParameter("f"); else field = "board_name";
	if(request.getParameter("q") != null) query = URLEncoder.encode(request.getParameter("q"), "utf-8");
%>
<!-- boardList는 request 메모리영역에 있지만  페이지 관련 정보는 Servelet메모리 영역에 있기 때문에 표현식을 이용해서 가져와야 한다.-->
<c:set var="curPage" value="<%= curPage %>"/>
<c:set var="totalPage" value="<%= totalPage %>"/>
<c:set var="startPage" value="<%= startPage %>"/>
<c:set var="endPage" value="<%= endPage %>"/>
<c:set var="p" value="<%= curPage %>"/>
<c:set var="f" value="<%= field %>"/>
<c:set var="q" value="<%= query %>"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container mt-sm-5" align="center">
	
		<div class="jumbotron">
			<h3>게시글목록보기</h3>
			<c:if test="${ boardList.isEmpty() }">
				<h4><p class="bg-danger text-white">등록된 게시글이 존재하지 않습니다!!</p></h4>
			</c:if>
		</div>
	
		<form action="boardList.bo" class="form-line">
			<div class="input-group">
				<select name="f" id="" class="form-control col-sm-2 mr-wm-2">
					<option ${ (param.f == "board_name") ? "selected" : "" } value="board_name">작성자</option>
					<option ${ (param.f == "board_subject") ? "selected" : "" } value="board_subject">제목</option>
				</select>
				<input type="text" name="q" value="${ param.q }" class="form-control col-sm-8 mr-sm-2" placeholder="검색어를 입력하세요..."/>
				<button type="submit" class="btn btn-primary col-sm-1 mr-sm-2">검색</button>
				<a href="boardWriteForm.bo?p=${p}&f=${f}&q=${q}" class="btn btn-success col-sm-1">글쓰기</a>
			</div>
		</form>
		<br class="mt-sm-5" />
		
		<table class="table table-bordered table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>파일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.getBoard_num()}</td>
					<td>
						<c:if test="${board.getBoard_re_lev() !=0 }" >
							┗
							<c:forEach var="i" begin="1" end="${board.getBoard_re_lev()}">
								━
							</c:forEach>
							[RE]
						</c:if>
						<a href="boardDetail.bo?board_num=${board.getBoard_num()}&p=${p}&f=${f}&q=${q}">${board.getBoard_subject()}</a>
						<span class="badge badge-danger ml-sm-3">${board.getBoard_readcount()}</span>
					</td>
					<td>${board.getBoard_name()}</td>
					<td>${board.getBoard_date()}</td>
							
					<td>
						<c:if test="${!empty board.getBoard_file()}">
							<a href="download.bo?board_num=${board.getBoard_num()}&p=${p}&f=${f}&q=${q}&fn=${board.getBoard_file()}" 
							   class="btn btn-success"><i class="fas fa-file-download">   ${board.getBoard_file()}</i>
							</a>
						</c:if>
					</td>

					<td align="center"><a href="boardDeleteForm.bo?board_num=${board.getBoard_num()}&p=${p}&f=${f}&q=${q}" class="btn btn-danger">
						<i class="fas fa-trash-alt"></i></a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<br />
	
	<!-- 페이지처리 -->
	<div class="container" align="center">
		<ul class="pagination justify-content-center">
			
			<c:if test="${startPage != 1}">
				<li class="page-item"><a href="boardList.bo?p=1" class="page-link"><i class="fas fa-fast-backward"></i></a></li>
				<li class="page-item"><a href="boardList.bo?p=${startPage-1}" class="page-link"><i class="fas fa-backward"></i></a></li>
			</c:if>
			
			<c:forEach var="page_num" begin="${startPage}" end="${endPage}">
				<li class="page-item"><a href="boardList.bo?p=${page_num}" class="page-link">${page_num}</a></li>
			</c:forEach>

			<c:if test="${endPage < totalPage}">
				<li class="page-item"><a href="boardList.bo?p=${endPage+1}" class="page-link"><i class="fas fa-forward"></i></a></li>
				<li class="page-item"><a href="boardList.bo?p=${totalPage}" class="page-link"><i class="fas fa-fast-forward"></i></a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>

















