<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.comment .photo {
		    text-align: center;
		    margin-right: 55px;
		}
		
		.comment .commentDate{
			color: grey;
			font-size: 15px;
		}
		
		.list_content{
			font-size: 20px;
		}
		
		.detail{
			width: 75%;
		}
		.cBtns{
			margin: 10px 5px;
			height: 20px;
			float: right;
		}
		.commentBtn{
			margin: 10px 5px;
			background: none;
    		border: 0;
		}
		.commentBtn:hover{
			cursor: pointer;
			font-weight: bold;
		}	
		textarea#hcontent {
		    padding: 15px;
		    font-size: 15px;
		    width: 85%;
		}
		.paging {
		    text-align: center;
		}
		.buisness{
			margin-left:100px; 
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('.replyComment').click(function(){
				const _this = $(this);
				alert(_this);
				
			});
		});
	</script>
</head>
<body>
	<div class="comment_list">
		<ol>
		<c:forEach var="hotelComments" items="${hotelComments }">
		<c:if test="${not empty hotelComments.mid }">
		<div class="comment">
				<div class="photo">
						<li>
							<%-- <c:if test="${empty member.mphoto || empty buisness.bphoto}"> --%>
								<img width="100px;" alt="기본프로필사진(해녀)" src="${conPath }/img/defaultMphoto.png">
								<br>
							<%-- </c:if>
							<c:if test="${not empty member.mphoto }">
								${member.mphoto}<br>
							</c:if>
							<c:if test="${not empty business.bphoto }">
								${business.bphoto }<br>
							</c:if> --%>
							${hotelComments.mid }
							${hotelComments.bid }
						</li>
				</div>
				<div class="content detail">
				<li class="commentDate">
					<fmt:formatDate value="${hotelComments.hcrdate }" pattern="yyyy-MM-dd"/>
					${buisness }
				</li>
				<li class="list_content hcontent${hotelComments.hcommentno }">
					${hotelComments.hcontent }
				</li>
				<li class="cBtns">
					<c:if test="${not empty member || not empty bid }">
						<button class="commentBtn replyComment" id="reply${hotelComments.hcommentno }">
							답글
						</button>
					</c:if>
					<c:if test="${not empty member.mid and hotelComments.mid eq member.mid || not empty bid and hotelComments.bid eq bid || not empty admin}">
						<button class="commentBtn modifyComment" id="${hotelComments.hcommentno }">
							수정
						</button>
						<button class="commentBtn deleteComment" onclick="location.href='deleteComment.do?hname=${hotelVo.hname }&hcommentno=${hotelComments.hcommentno }'">
							삭제
						</button>
					</c:if>
				</li>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty hotelComments.bid  }">
			<div class="comment buisness">
				<div class="photo">
						<li>
							<%-- <c:if test="${empty member.mphoto || empty buisness.bphoto}"> --%>
								<img width="100px;" alt="기본프로필사진(해녀)" src="${conPath }/img/defaultMphoto.png">
								<br>
							<%-- </c:if>
							<c:if test="${not empty member.mphoto }">
								${member.mphoto}<br>
							</c:if>
							<c:if test="${not empty business.bphoto }">
								${business.bphoto }<br>
							</c:if> --%>
							${hotelComments.mid }
							${hotelComments.bid }
						</li>
				</div>
				<div class="content detail">
				<li class="commentDate">
					<fmt:formatDate value="${hotelComments.hcrdate }" pattern="yyyy-MM-dd"/>
					${buisness }
				</li>
				<li class="list_content hcontent${hotelComments.hcommentno }">
					${hotelComments.hcontent }
				</li>
				<li class="cBtns">
					<c:if test="${not empty member || not empty bid }">
						<button class="commentBtn replyComment" id="reply${hotelComments.hcommentno }">
							답글
						</button>
					</c:if>
					<c:if test="${not empty member.mid and hotelComments.mid eq member.mid || not empty bid and hotelComments.bid eq bid || not empty admin}">
						<button class="commentBtn modifyComment" id="${hotelComments.hcommentno }">
							수정
						</button>
						<button class="commentBtn deleteComment" onclick="location.href='deleteComment.do?hname=${hotelVo.hname }&hcommentno=${hotelComments.hcommentno }'">
							삭제
						</button>
					</c:if>
				</li>
				</div>
			</div>
		</c:if>
		</c:forEach>
		</ol>
	</div>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
		[ <a
				href="${conPath}/hotel/detail.do?hname=${param.hname }&pageNum=${paging.currentPage}&lname=${param.lname}&mid=${member.mid }&CpageNum=${paging.startPage-1}">이전</a> ]
				<%-- href="${conPath }/hotel/detail.do?CpageNum=${paging.startPage-1}">이전</a> ] --%>
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath}/hotel/detail.do?hname=${param.hname }&pageNum=${paging.currentPage}&lname=${param.lname}&mid=${member.mid }&CpageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath}/hotel/detail.do?hname=${param.hname }&pageNum=${paging.currentPage}&lname=${param.lname}&mid=${member.mid }&CpageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>