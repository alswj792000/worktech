<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>보낸 메일함</title>

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
	<!-- icheck bootstrap -->
	<link rel="stylesheet" href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
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

		.mailbox-controls {
			padding: 5px
		}

		.mailbox-controls.with-border {
			border-bottom: 1px solid rgba(0, 0, 0, .125)
		}

		.table-responsive {
			overflow: auto
		}

		.table-responsive>.table tr td,
		.table-responsive>.mailbox-messages>.table {
			margin: 0
		}
		
		.searchArea{
			width: 280px !important;
			align-self: flex-end !important;
		}
	</style>
</head>

<body>
	<jsp:include page="../common/headerUser.jsp"></jsp:include>

	<!-- Content Wrapper. Contains page content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>보낸 메일함</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item">메일</div>
	            	<div class="breadcrumb-item">보낸 메일함</div>
				</div>
			</div>

		</section>
		<!-- Main content -->
		<div class="section-body">
			<div class="row">
				<!-- 사이드 바 -->
				<c:import url="mailSidebar.jsp" />
				<div class="col-md-9">
					<div class="card card-primary card-outline">
						<div class="card-header searchArea">
							<div class="card-tools">
								<div class="input-group input-group-sm">
									<input type="text" class="form-control" id="searchValue" value="${searchValue }"
										placeholder="메일 검색">
									<div class="input-group-append">
										<div onclick="searchMail();" class="btn btn-primary">
											<i class="fas fa-search"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body p-0">
							<div class="mailbox-controls">
								<button type="button" class="btn btn-default btn-sm checkbox-toggle">
									<i class="far fa-square"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm deleteMailBtn">
										<i class="far fa-trash-alt"></i>
									</button>
								</div>
								<button type="button" onclick="location.href='sendlist.mail'"
									class="btn btn-default btn-sm">
									<i class="fas fa-sync-alt"></i>
								</button>
								<div class="float-right">
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="table-responsive mailbox-messages">
								<form id="allManage" method="post">
									<!-- value에 반환할 페이지 넣기 -->
									<input type="hidden" value="sendlist" name="command">
									<table class="table table-hover table-striped">
										<c:forEach var="mi" items="${list }" varStatus="idCount">
											<c:forEach var="mF" items="${mi.mailFileList}">
												<c:if test="${mF.mlStatus == 'Y'}">
													<c:set var="attachment" value="on" />
												</c:if>
												<c:if test="${mF.mlStatus != 'Y'}">
													<c:set var="attachment" value="off" />
												</c:if>
											</c:forEach>
											<c:forEach var="mSR" items="${mi.mailSRList }">
												<c:if test="${empty mSR.RDate }">
													<c:set var="read" value="n" />
												</c:if>
												<c:if test="${not empty mSR.RDate }">
													<c:set var="read" value="y" />
												</c:if>
												<c:if test="${mSR.favorites eq null || mSR.favorites eq 'N' }">
													<c:set var="star" value="n" />
												</c:if>
												<c:if test="${mSR.favorites eq 'Y' }">
													<c:set var="star" value="y" />
												</c:if>
											</c:forEach>
											<c:url var="mdetail" value="readmail.mail">
												<c:param name="mId" value="${ mi.mailNo }" />
												<c:param name="page" value="${ pi.currentPage }" />
											</c:url>
											<tr>
												<td>
													<div class="icheck-primary">
														<input type="checkbox" value="${mi.mailNo }" name="check"
															id="check${idCount.count }">
														<label for="check${idCount.count }"></label>
													</div>
												</td>
												<td class="mailbox-star">
													<c:if test="${star == 'n'}">
														<a href="#">
															<i class="far fa-star text-warning"></i>
														</a>
													</c:if>
													<c:if test="${star  == 'y'}">
														<a href="#">
															<i class="fas fa-star text-warning"></i>
														</a>
													</c:if>
													<c:if test="${read == 'y' }">
														<i id="readmail"
															class="far fa-envelope-open text-primary"></i>
													</c:if>
													<c:if test="${read != 'y' }">
														<i id="readmail" class="fas fa-envelope text-primary"></i>
													</c:if>
													<c:if test="${attachment == 'on' }">
														<i class="fas fa-paperclip"></i>
													</c:if>
												</td>
												<%-- 														${mi.mailSRList.get(0).sRStatus } --%>
												<td class="mailbox-name"><a href=#>${mi.receiveEmp }</a></td>
												<td onclick="location.href='${mdetail}'" style="cursor: pointer;"
													class="mailbox-subject">
													${mi.etitle }</td>
												<td class="mailNo-hidden">${mi.mailNo }</td>

												<c:set var="d" value="<%=new java.util.Date()%>" />
												<!-- 날짜 연산 -->
												<fmt:formatDate value="${d }" var="sysdate" pattern="yyyyMMdd" />
												<fmt:formatDate value="${mi.sDate }" pattern="yyyyMMdd"
													var="compDate" />
												<!-- 시간 연산 -->
												<fmt:formatDate value="${d }" var="currentTime" pattern="HHmm" />
												<fmt:formatDate value="${mi.sDate }" pattern="HHmm"
													var="compTime" />
												<c:set var="ago" value="${(currentTime - compTime) / 60 }" />
												<!-- Integer로 바꾸기 -->
												<fmt:parseNumber var="fmtNumber" value="${ago }"
													integerOnly="true" />
												<c:if test="${sysdate eq compDate }">
													<c:if test="${ fmtNumber <= 0}">
														<td class="mailbox-date">
															<span class="mailSR-info">
																<fmt:formatDate value="${d }" var="currentMinutues"
																	pattern="HHmm" />
																<fmt:formatDate value="${mi.sDate }" pattern="HHmm"
																	var="compMinutes" />
																[${currentMinutues - compMinutes }분 전]
															</span>
															<fmt:formatDate pattern="HH:mm" value="${mi.sDate }" />
														</td>
													</c:if>
													<c:if test="${ fmtNumber > 0}">
														<fmt:parseNumber var="fmtHoursAgo"
															value="${(currentTime - compTime) / 60 }"
															integerOnly="true" />
														<td class="mailbox-date"><span
																class="mailSR-info">[${fmtHoursAgo}시간 전]</span>
															<fmt:formatDate pattern="HH:mm" value="${mi.sDate }" />
														</td>
													</c:if>
												</c:if>
												<!-- 오늘 날짜가 아닐 때 -->
												<c:if test="${sysdate ne compDate }">
													<td class="mailbox-date">
														<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
															value="${mi.sDate }" />
													</td>
												</c:if>
											</tr>
										</c:forEach>
									</table>
								</form>
							</div>
						</div>
						<div class="card-footer p-0" style="height: 51px;">
							<div class="pagination justify-content-center">
								<div class="btn-group" style="border-radius: 0px;">
									<!-- 이전버튼 비활성화 -->
									<c:if test="${pi.currentPage <= 1 }">
										<button type="button" class="btn btn-default btn-sm"
											style="border-radius: 0px;">
											<i class="fas fa-chevron-left" style="color: lightgrey"></i>
										</button>
									</c:if>
									<!-- 이전버튼 -->
									<c:if test="${ pi.currentPage > 1 }">
										<c:if test="${ searchValue ne null}">
											<c:url value="search.mail" var="searchBack">
												<c:param name="searchValue" value="${ searchValue}" />
												<c:param name="command" value="sendmaillist" />
												<c:param name="page" value="${pi.currentPage - 1 }" />
											</c:url>
											<a href="${searchBack }">
												<button type="button" class="btn btn-default btn-sm "
													style="border-radius: 0px;">
													<i class="fas fa-chevron-left"></i>
												</button>
											</a>
										</c:if>
										<c:if test="${ searchValue eq null}">
											<c:url var="before" value="sendlist.mail">
												<c:param name="page" value="${ pi.currentPage - 1 }" />
											</c:url>
											<a href="${before }">
												<button type="button" class="btn btn-default btn-sm "
													style="border-radius: 0px;">
													<i class="fas fa-chevron-left"></i>
												</button>
											</a>
										</c:if>
									</c:if>
									<!-- 숫자 버튼 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<button type="button" class="btn btn-default btn-sm"
												style="border-radius: 0px;">
												<b>${p }</b>
											</button>
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:if test="${searchValue ne null }">
												<c:url value="search.mail" var="searchPagination">
													<c:param name="searchValue" value="${ searchValue}" />
													<c:param name="command" value="sendlist" />
													<c:param name="page" value="${ p }" />
												</c:url>
												<a href="${ searchPagination }">
													<button type="button" class="btn btn-default btn-sm"
														style="border-radius: 0px;">${p }</button>
												</a>
											</c:if>
											<c:if test="${searchValue eq null }">
												<c:url var="pagination" value="sendlist.mail">
													<c:param name="page" value="${ p }" />
												</c:url>
												<a href="${ pagination }">
													<button type="button" class="btn btn-default btn-sm"
														style="border-radius: 0px;">${p }</button>
												</a>
											</c:if>
										</c:if>
									</c:forEach>
									<!-- 다음 버튼 비활성화 -->
									<c:if test="${pi.currentPage >= pi.maxPage }">
										<button type="button" class="btn btn-default btn-sm"
											style="border-radius: 0px;">
											<i class="fas fa-chevron-right" style="color: lightgrey"></i>
										</button>
									</c:if>
									<!-- 다음 -->
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:if test="${searchValue ne null }">
											<c:url var="searchNext" value="search.mail">
												<c:param name="page" value="${ pi.currentPage + 1 }" />
												<c:param name="searchValue" value="${ searchValue}" />
												<c:param name="command" value="sendmaillist" />
											</c:url>
											<a href="${searchNext }">
												<button type="button" class="btn btn-default btn-sm"
													style="border-radius: 0px;">
													<i class="fas fa-chevron-right"></i>
												</button>
											</a>
										</c:if>
										<c:if test="${searchValue eq null }">
											<c:url var="next" value="sendlist.mail">
												<c:param name="page" value="${ pi.currentPage + 1 }" />
											</c:url>
											<a href="${next }">
												<button type="button" class="btn btn-default btn-sm"
													style="border-radius: 0px;">
													<i class="fas fa-chevron-right"></i>
												</button>
											</a>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- ./wrapper -->

	
	<script>
		$(function () {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(
				function () {
					var clicks = $(this).data('clicks')
					if (clicks) {
						//Uncheck all checkboxes
						$('.mailbox-messages input[type=\'checkbox\']')
							.prop('checked', false)
						$('.checkbox-toggle .far.fa-check-square')
							.removeClass('fa-check-square').addClass(
								'fa-square')
					} else {
						//Check all checkboxes
						$('.mailbox-messages input[type=\'checkbox\']')
							.prop('checked', true)
						$('.checkbox-toggle .far.fa-square').removeClass(
							'fa-square').addClass('fa-check-square')
					}
					$(this).data('clicks', !clicks)
				});

			//Handle starring for font awesome
			$('.mailbox-star').click(function (e) {
				e.preventDefault()
				//detect type
				var $this = $(this).find('a > i')
				var fa = $this.hasClass('fa-star')
				var mailNo = $(this).parent().find('.mailNo-hidden').text();
				updateFavorites(mailNo);

				//Switch states
				if (fa) {
					$this.toggleClass('far')
					$this.toggleClass('fas')
				}
			});

			$('.deleteMailBtn').click(function () {

				var check = document.getElementsByName('check');
				console.log(check.length);
				var count = 0;
				for (i = 0; i < check.length; i++) {
					if (check[i].checked) {
						count++;
					}
				}
				if (count == 0) {
					alert("선택된 항목이 없습니다.");
				} else {
					var bool = confirm('정말 삭제하시겠습니까?');
					if (bool) {
						$('#allManage').attr('action', 'deletemail.mail');
						$('#allManage').submit();
					}
				}
			});
		});

		function searchMail() {
			var searchValue = $('#searchValue').val();
			var command = 'sendmaillist';

			location.href = "search.mail?searchValue=" + searchValue +
				"&command=" + command;
		}
		
		function updateFavorites(mailNo) {
			$.ajax({
				url : "updateFavorites.mail",
				data : {
					mailNo : mailNo
				},
				success : function(data) {
					console.log(data);
				}
			});
		}
	</script>
</body>

</html>
