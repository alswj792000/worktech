<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>메일 상세보기</title>

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">

	<style>
		.mailSR-info {
			font-size: 14px;
			color: gray;
			/* 	vertical-align: middle; */
		}

		.thispage,
		.thispage b {
			color: #007bff;
		}

		.table td,
		.table th {
			padding: .25rem;
			vertical-align: middle;
		}

		.table-striped tbody tr:nth-of-type(odd) {
			background-color: rgba(0, 0, 0, 0);
		}

		.table-hover tbody tr:hover {
			background-color: rgba(0, 0, 0, .075)
		}

		.table td:nth-child(1) {
			width: 4%;
		}

		.table td:nth-child(2) {
			width: 8%;
		}

		.table td:nth-child(3) {
			width: 18%;
		}

		.table td:nth-child(4) {
			width: 50%;
		}

		.table td:nth-child(5) {
			text-align: right;
		}

		.table td:nth-child(6) {
			width: 12%;
			text-align: right;
		}

		.mailbox-name a {
			margin-left: 20px;
			text-decoration: none;
		}

		td {
			height: 35px;
		}

		.pagination {
			margin-top: 10px;
			margin-bottom: 10px;
		}

		.mailNo-hidden {
			display: none;
			width: 0px;
		}

		.mailbox-read-message {
			min-height: 400px;
		}

		.mailbox-read-info {
			border-bottom: 1px solid rgba(0, 0, 0, 0.125);
			padding: 10px;
		}

		.mailbox-read-info h3 {
			font-size: 20px;
			margin: 0;
		}

		.mailbox-read-info h5 {
			margin: 0;
			padding: 5px 0 0;
		}

		.mailbox-read-info {
			border-bottom: 1px solid rgba(0, 0, 0, .125);
			padding: 10px
		}

		.mailbox-read-info h3 {
			font-size: 20px;
			margin: 0
		}

		.mailbox-read-info h5 {
			margin: 0;
			padding: 5px 0 0
		}

		.mailbox-read-time {
			color: #999;
			font-size: 13px
		}

		.mailbox-read-message {
			padding: 10px
		}

		.mailbox-attachments {
			padding-left: 0;
			list-style: none
		}

		.mailbox-attachments li {
			border: 1px solid #eee;
			float: left;
			margin-bottom: 10px;
			margin-right: 10px;
			width: 200px
		}

		.mailbox-attachment-name {
			color: #666;
			font-weight: 700
		}

		.mailbox-attachment-icon,
		.mailbox-attachment-info,
		.mailbox-attachment-size {
			display: block
		}

		.mailbox-attachment-info {
			background-color: #f8f9fa;
			padding: 10px
		}

		.mailbox-attachment-size {
			color: #999;
			font-size: 12px
		}
	</style>
</head>

<body>
	<jsp:include page="../common/headerUser.jsp"></jsp:include>
	<div class="main-content">
		<!-- Content Header (Page header) -->
		<section class="section">
			<div class="section-header">
				<h1>메일읽기</h1>
				<div class="section-header-breadcrumb"></div>
			</div>
			<div class="section-header-breadcrumb"></div>
		</section>
	</div>
	<div class="section-body">

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<!-- 사이드 바 -->
					<c:import url="mailSidebar.jsp" />
					<div class="col-md-9">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h3 class="card-title">${mail.etitle }</h3>

								<div class="card-tools">
									<div></div>
								</div>
							</div>
							<div class="card-body p-0">
								<div class="mailbox-read-info">

									<h6>보낸 사람 : &lt;${mail.senderName }&gt;
										${mail.mNo}@worktech.com</h6>
									<h6>
										&nbsp;받는 사람 :
										<c:if test="${mail.receiverName != null }">&lt;${mail.receiverName }&gt;</c:if>
										${mail.receiveEmp} <span class="mailbox-read-time float-right">
											<fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${mail.sDate }" />
										</span>
									</h6>
								</div>
								<div class="mailbox-controls with-border text-center">
									<div class="btn-group">
										<input type="hidden">
									</div>
								</div>
								<!-- 이메일 내용 -->
								<div class="mailbox-read-message">${mail.econtent}</div>

							</div>
							<div class="card-footer bg-white">
								<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
									<c:forEach var="mF" items="${mail.mailFileList }">
										<c:if test="${mF.mFileNo != 0}">
											<li><span class="mailbox-attachment-icon"><i
														class="far fa-file-pdf"></i></span>
													<div class="mailbox-attachment-info">
														<a href="resources/mailUploadFiles/${mF.mChangeName}" 
														download="${mF.mOriginalName }"
														class="mailbox-attachment-name"><i
															class="fas fa-paperclip"></i> ${mF.mOriginalName }</a> <span
															class="mailbox-attachment-size clearfix mt-1"> 
															<a href="resources/mailUploadFiles/${mF.mChangeName}" 
																download="${mF.mOriginalName }"
															class="btn btn-default btn-sm float-right"><i
																class="fas fa-cloud-download-alt"></i></a>
														</span>
													</div></li>
											</c:if>
										</c:forEach>
									</ul>
												<div class="mailbox-attachment-info">
													<a href="${contextPath }/resources/mailUploadFiles/${mF.mChangeName}" download="${mF.mOriginalName }" class="mailbox-attachment-name">
														<i class="fas fa-paperclip"></i>
														${mF.mOriginalName }
													</a> 
													<span class="mailbox-attachment-size clearfix mt-1">
														<a href="${contextPath }/resources/mailUploadFiles/${mF.mChangeName}" download="${mF.mOriginalName }" class="btn btn-default btn-sm float-right">
															<i class="fas fa-cloud-download-alt"></i>
														</a>
													</span>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>

							</div>
							<div class="card-footer">
								<div class="float-right">
									<input type="hidden">
								</div>
								<button onclick="location.href='javascript:history.back();'" type="reset"
									class="btn btn-default">뒤로가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>

</html>
