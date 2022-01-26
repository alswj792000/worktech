<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mail-icon {
		width: 20px;
	}
	
	.writeMail{
		margin: 15px;
		text-align: center;
	}
	.mailBtn {
		width: 45%;
	}
</style>
</head>
<body>
	<div class="col-md-3">
		<div class="card">
			<div class="writeMail">
				<a href="send.mail" class="btn btn-primary mailBtn">메일 쓰기</a>
				<a href="send.mail" class="btn btn-primary mailBtn">내게 쓰기</a>
			</div>
			<div class="card-body p-0">
				<ul class="nav nav-pills flex-column">
					<li class="nav-item">
						<a href="alllist.mail" class="nav-link">
							<i class="fas fa-envelope mail-icon"></i> 전체 메일함
							<c:if test="${count != 0 && count ne null}">
								<span class="badge bg-primary float-right"> ${count} </span>
							</c:if>
						</a>
					</li>
					<li class="nav-item active">
						<a href="receivelist.mail" class="nav-link receivelist">
							<i class="far fa-envelope-open mail-icon"></i> 받은메일함 
						</a>
					</li>
					<li class="nav-item">
						<a id="sendlist-li" href="sendlist.mail" class="nav-link sendlist">
							<i class="far fa-paper-plane mail-icon"></i> 보낸메일함 
						</a>
					</li>
					<li class="nav-item">
						<a id="sendlist-li" href="checkReadTime.mail" class="nav-link sendlist">
							<i class="far fa-paper-plane mail-icon"></i> 수신확인 
						</a>
					</li>
					<li class="nav-item">
						<a href="templist.mail" class="nav-link templist">
							<i class="far fa-file-alt mail-icon"></i> 임시보관함 
						</a>
					</li>
					<li class="nav-item">
						<a href="favoriteslist.mail" class="nav-link favoriteslist">
							<i class="far fa-star favorites mail-icon"></i> 즐겨찾기 
						</a>
					</li>
					<li class="nav-item">
						<a href="deletelist.mail" class="deletelist nav-link">
							<i class="far fa-trash-alt mail-icon"></i> 휴지통 
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>