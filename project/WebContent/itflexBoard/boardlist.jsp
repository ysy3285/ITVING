<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" style=""
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=AW-931058540&amp;l=dataLayer&amp;cx=c"></script>
<script type="text/javascript" async=""
	src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
<script type="text/javascript">

			function logout(){
		
				f = document.myForm2;
		
				var returnValue = window.confirm("정말로 로그아웃 하시겠습니까?");

				if(returnValue == true){
					alert("로그아웃 완료!");
					f.action = "<%=cp%>/itving/logout_ok.do";
					f.submit();
				}

			}
		</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>ITVING｜커뮤니티 게시판</title>
<meta name="Author" content="CJ ENM">
<meta name="description" content="고객센터">

<!-- naver web master tool -->
<meta name="naver-site-verification"
	content="812a99b3ebc03f59de55c39007c877263955564c">

<link rel="“alternate”" href="“http://m.tving.com”">
<link rel="shortcut icon"
	href="https://image.tving.com/theme/tving_new/img/logo/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.css?v=108">
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/typography.css?v=108">


<link rel="stylesheet"
	href="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.css?v=108">
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/typography.css?v=108">
<link rel="stylesheet" href="<%=cp %>/proj3/css/app.css?after" type="text/css">

<script async=""
	src="https://www.googletagmanager.com/gtm.js?id=GTM-K9Q8F7B"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery-1.12.3.min.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.cookie.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.easing.1.3.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.scrollbar.min.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/momentjs/moment.min.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/momentjs/moment.lang.ko.js?v=108"></script>

<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.core-1.0.js?apiKey=1e7952d0917d6aab1f0293a063697610&amp;v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.media-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.operator-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.community-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.my-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.infra-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.smr-1.0.js?v=108"></script>

<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/common.util-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/json2/json2.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/user-agent/ua_parser.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/user-agent/ua-parser.min.js?v=108"></script>

<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/clientjs/client.min.js?v=108"></script>

<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/script.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/common/page.common.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/common/nethru_script.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/marpple/partial.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/common/cja_common.js?v=108"></script>

<!-- End Google Tag Manager Data Layer -->
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/common/page.base.js?v=108"></script>

<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/common.ad-1.0.js?v=108"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/common.mi-1.0.js?v=108"></script>

<!-- template 용 handlebars.js (v4.1.2) 추가 -->
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/handlebars/handlebars.js?v=108"></script>
<!-- bxslider version up ( 2019-07-11 ) -->

<script
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.js?v=108"></script>

<!-- 퍼블리싱 modernizr version 2.8.3 -->
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/modernizr/modernizr.min.js?v=108"></script>
<!-- 4.2.2 masonry -->
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/masonry/masonry.pkgd.min.js?v=108"></script>

<!-- recommend log -->
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/common.recommend.log.js?v=108"></script>

<!-- Global site tag (gtag.js) - Google Ads: 702011905 -->
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=AW-702011905"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'AW-702011905');
    
</script>
<script type="text/javascript">
			$(function() {
				if (user_yn) {
					//Recommend.init();
					//$('#gnbRecommend_login .main-contents02').show();
				}

				//김제민님 요청사항
				var gnbEl = $("#gnb, #top-gnb, .sub-gnb");
				var prevLeftNum = 0;
				$(window).scroll(function() {
					var x = -$(this).scrollLeft();
					if (prevLeftNum !== x) {
						prevLeftNum = x;
						gnbEl.css({
							left : x
						});
					}
				});

				// gnb 서브메뉴 on클래스 적용
				var requestUri = "/live/home";
				var $target = $("#header .gnb-sub a[href='" + requestUri + "']");

				if (requestUri.indexOf("pick") > -1) { //클립 top, 최신 gnb 서브메뉴 on클래스 적용
					if (requestUri.indexOf("top") > -1) {
						$target = $("#header .gnb-sub a[href='/pick/player/top/top']");
					}

					if (requestUri.indexOf("new") > -1) {
						$target = $("#header .gnb-sub a[href='/pick/player/new/new']");
					}
				}

				if (requestUri.indexOf("smr") > -1) { //클립 채널관 gnb 서브메뉴 on클래스 적용
					$target = $("#header .gnb-sub a[href='/pick/channel/main/main']");
				}

				if (requestUri.indexOf("/movieList") > -1
						|| requestUri.indexOf("/vod/recommend/") > -1) { //무비 리스트 전체보기(신규페이지) 예외처리
					var requestUriArray = requestUri.split("/");
					requestUri = "/" + requestUriArray[1] + "/"
							+ requestUriArray[2];

					$target = $("#header .gnb-sub a[href='" + requestUri + "']");
				}

				$target.addClass("on");
				$target.closest("div").show();
				$target.closest("div").find("ul").css('opacity', 1);

				$('#login-btn, #login-btn2').click(function(e) {
					pd(e);
					goLoginPage();
				});

				$('#logout-btn').click(function(e) {
					pd(e);
					logout('');
				});

				$(".gnb-hover-menu").each(function() {
					$(this).css("marginLeft", -($(this).outerWidth() / 2.2));
					$(this).css({
						"display" : "none",
						"visibility" : "visible"
					});
				});

				//검색관련
				$(".gnb-util li").on("mouseover", function() {
					$(this).find(".gnb-hover-menu").filter(":hidden").fadeIn();
				});
				$(".gnb-util li").on("mouseleave", function() {
					$(this).children(".gnb-hover-menu").fadeOut();
				});

				//로그인,이용권라인관련
				$(".top-util li").on("mouseover", function() {
					$(this).find(".gnb-hover-menu").filter(":hidden").fadeIn();
				});
				$(".top-util li").on("mouseleave", function() {
					$(this).children(".gnb-hover-menu").fadeOut();
				});

				var isOver = false;
				var overTarget;
				var isBx = false;

				var $curMenu = $("#gnbMenu").find(".on"); //페이지 처음 그릴시  on 메뉴 저장(픽클 예외케이스 때문에 필요.)

				$("#gnbMenu a").on("mouseover", function(e) {
					e.preventDefault();

					isOver = true;
					overTarget = $(this);

					/*  $(".gnb-sub > div").hide();
					 $(".gnb-sub > div").find("ul").css("opacity", 0);
					 $("#gnbMenu a").removeClass("on"); */

					//1depth 메뉴에서만 오버시 잔상유지되는거 없애고 다시 하이라이트
					$("#gnbMenu").find("a").removeClass("on");
					$curMenu.addClass("on");
					$(this).addClass("on");



					var gnbSub = $(this).data("sub");
					if (gnbSub == '#gnbRecommend_login') {
						$(".sub-gnb").css('background', 'rgba(20,20,20,0.95)');
						if (!isBx) {
						}
					} else {
						$(".sub-gnb").css('background', '');
					}
				});

				$(".u-search a").on("click", function() {
					$(this).parent().addClass("on");
					return false;
				});

				$(".gnb-sub").on("mouseover", function() {
					isOver = true;
				});

				// 메인 매뉴 오버아웃
				$("#gnbMenu").on("mouseleave", function(e) {
					e.preventDefault();
					mainMenuMouseLeaveEventHandler();
				});
				$(".gnb-sub").on("mouseleave", function(e) {
					e.preventDefault();
					mainMenuMouseLeaveEventHandler();
					if (!$('#gnbRecommend_login').is(':visible')) {
						$(".sub-gnb").css('background', '');
					}
				});

				/**
				 * 검색
				 **/
				$("#btnSearch")
						.on(
								"click",
								function(e) {
									/** 레이어 닫기 **/
									$("body")
											.click(
													function(e) {
														if ($(
																".gnb-search-area")
																.is(":visible")
																&& $(e.target)
																		.parents(
																				"#gnbSearch").length == 0) {
															$(
																	".gnb-search-list")
																	.hide();
															$("#gnbSearch")
																	.hide();
															$(
																	'.gnb-search-area')
																	.hide();
															$(".u-search")
																	.removeClass(
																			"on");
														}
													});

									if ($("#usearch").hasClass("u-search on")) {
										var searchText = Search
												.removeHtmlTag($(
														Search.config.obj)
														.val());
										Search.submit(searchText);
										return false;
									} else {
										$('.u-search').addClass("on");

										Search
												.recommandKeyword(function(data) {
													var idx = Math
															.floor(data.length
																	* Math
																			.random());
													$(Search.config.obj)
															.val(
																	data[idx].content.banner_title);
												});

										$('#gnbSearch').show();
										return false;
									}

								});

				/**
				 * 메인 메뉴 마우스 아웃시 애니메이션 적용 및 초기화
				 **/
				function mainMenuMouseLeaveEventHandler() {
					isOver = false;
					var _this = overTarget;
					var dur = 200;

					if (!_this)
						return;

					setTimeout(
							function() {
								if (!isOver) {
									var requestUri = "/live/home";
									if (((requestUri.indexOf('player') == -1) || (requestUri
											.indexOf('pick') >= 0))
											&& (requestUri.indexOf('/main.do') == -1)) {
										var $onDom = $("#header .gnb-sub a[href='"
												+ "/live/home" + "']");

										if (requestUri.indexOf("smr") != -1) {
											$onDom = $("#header .gnb-sub a[href='/pick/channel/main/main']");
										}

										if (requestUri.indexOf("/movieList") > -1
												|| requestUri
														.indexOf("/vod/recommend/") > -1) {
											var requestUriArray = requestUri
													.split("/");
											requestUri = "/"
													+ requestUriArray[1] + "/"
													+ requestUriArray[2];

											$onDom = $("#header .gnb-sub a[href='"
													+ requestUri + "']");
										}

										var divId = $onDom.closest("div").attr(
												"id");

										if (requestUri.indexOf('/kids/') > -1) { //하위메뉴가 없을경우 여기 예외 추가 하위메뉴가 생기면 제거.
											divId = 'gnbKids';
										}

										$("#gnbMenu").find("a").removeClass(
												"on");
										$curMenu.addClass("on");//어디에도 속하지 못하는 URL 예외 케이스 방어 추가(대부분 픽클케이스) , 1depth 메뉴 하이라이트 유지
										$("#gnbMenu").find(
												"a[data-sub='#" + divId + "']")
												.addClass("on");

										$("#gnbMenu a")
												.each(
														function(index, data) {
															if ($(this)
																	.hasClass(
																			"on")) {
																var $this = $(this);
																$(
																		".gnb-sub > div")
																		.hide();
																$(
																		".gnb-sub > div")
																		.find(
																				"ul")
																		.css(
																				"opacity",
																				0);
																$("#gnbMenu a")
																		.removeClass(
																				"on");
																$(this)
																		.addClass(
																				"on");

																$(
																		$(this)
																				.data(
																						"sub"))
																		.stop(
																				true,
																				true);
																$(
																		$(this)
																				.data(
																						"sub"))
																		.find(
																				"ul")
																		.stop(
																				true,
																				true);

																$(".gnb-sub")
																		.show();
																$(
																		$(this)
																				.data(
																						"sub"))
																		.show();
																$(
																		$(this)
																				.data(
																						"sub"))
																		.find(
																				"ul")
																		.css(
																				'opacity',
																				1);
															}

														});
									} else {
										$(_this.data("sub")).find("ul")
												.animate({
													opacity : 0
												}, 200);
										$(_this.data("sub")).slideUp(
												"fast",
												function() {
													$(".gnb-sub").hide();
													$("#gnbMenu a")
															.removeClass("on");
												});
									}
								}
							}, dur);
				}

				$('#tv-mode-btn')
						.click(
								function(e) {
									e.preventDefault();

									var path = '';

									if ('') {
										if (confirm('헬로tv구매 콘텐츠는 TV모드를 제공하지 않습니다.\n라이브채널 TV모드로 이동하시겠습니까?')) {
											location.href = '/tv/player/main';
										}

										return;
									}

									if (location.href.indexOf('pick/') != -1) {
										alert("TV모드를 제공하지 않습니다. ");
										return;
									}

									if (global.body == null) {
										if (/^C/.test(global.media_code)) {
											alert("방송 중이 아닐때는 TV모드를 제공하지 않습니다. ")
											return;
										}
									}

									if (global && global.media_code) {

										if (global.smr_category_code) {

											if (/^S/
													.test(global.smr_category_code)) {
												if (typeof getFlashObject != 'undefined') {
													if (typeof getFlashObject("tving-player") != 'undefined') {
														getFlashObject(
																"tving-player")
																.flashCall(
																		"pause",
																		null);
													}
												}
												path = getSmrPlayerPath(
														global.smr_category_code,
														global.media_code, 'tv');
											}

											if (/^P/
													.test(global.smr_category_code)) {
												path = getSmrPlayerPath(
														global.smr_category_code,
														global.media_code, 'tv');
											}

										} else {
											if (/^E/.test(global.media_code)) {
												if (global.body.episode.drm_yn == 'Y') {
												} else {
													if (typeof getFlashObject != 'undefined') {
														if (typeof getFlashObject("tving-player") != 'undefined') {
															getFlashObject(
																	"tving-player")
																	.flashCall(
																			"pause",
																			null);
														}
													}
												}
											}

											if (/^C/.test(global.media_code)) {
												//if (global.media_code == 'C04601' || global.media_code == 'C07381' || global.media_code == 'C07382') {
												if (pageBaseController.parameters.common_params.channel_drm_code
														.indexOf(global.media_code) >= 0) {
												} else {
													if (typeof getFlashObject != 'undefined') {
														if (typeof getFlashObject("tving-player") != 'undefined') {
															getFlashObject(
																	"tving-player")
																	.flashCall(
																			"pause",
																			null);
														}
													}
												}
											}

											if (/^M/.test(global.media_code)) {
												if (global.body.movie.drm_yn == 'Y') {
												} else {
													if (typeof getFlashObject != 'undefined') {
														if (typeof getFlashObject("tving-player") != 'undefined') {
															getFlashObject(
																	"tving-player")
																	.flashCall(
																			"pause",
																			null);
														}
													}
												}
											}

											path = getPlayerPath(
													global.media_code, 'tv');
										}

									} else {
										path = serverDomain + '/tv/player/main';
									}

									location.href = path;
								});

				Search.init('normal', '');
			});
		</script>

<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/931058540/?random=1590042160414&amp;cv=9&amp;fst=1590042160414&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oa5e1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.tving.com%2Ffaq%2Fmain.do&amp;tiba=TVING%EF%BD%9C%EA%B3%A0%EA%B0%9D%EC%84%BC%ED%84%B0&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/702011905/?random=1590042160424&amp;cv=9&amp;fst=1590042160424&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;eid=376635470&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oa5e1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.tving.com%2Ffaq%2Fmain.do&amp;tiba=TVING%EF%BD%9C%EA%B3%A0%EA%B0%9D%EC%84%BC%ED%84%B0&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
</head>
<body data-n-head="">

	<div id="layer-share" class="layer-wrapper" style="display: none;">
		<div class="layer-share-list"></div>
	</div>

	<div id="wrap" class="page-customer">
		<div id="skipNavigationWrap">
			<a href="">검색 바로가기</a> <a href="">본문 바로가기</a>
		</div>


		<script type="text/javascript"
			src="https://nsso.cjone.com/findCookieSecured.jsp?cjssoq=KkR0FYyQYXnhb9LCtNx%2FbWwEPBUYw4CBlfK0Or74yxCt8cg57qKkpURXjSzldbfqqenghY4TjoEY7Svmsp66R3pjb2xYRDZubHRubVBLcUFSRW5ra010MnNXRGlidUpvNzBJNjMzaHZyWnYram10algrQkdpQmw4M0xiS21rZmg%3D"></script>
		
		
		<script type="text/javascript">

			function logout(){
		
				f = document.myForm2;
		
				var returnValue = window.confirm("정말로 로그아웃 하시겠습니까?");

				if(returnValue == true){
					alert("로그아웃 완료!");
					f.action = "<%=cp%>/itving/logout_ok.do";
					f.submit();
				}

			}
		</script>
		
		<script type="text/javascript">
function nomal() {
	alert("이용권을 구매해주세요!");
	return;
}
</script>
<script type="text/javascript">
function rank() {
	alert("무비 프리미엄 이용권만 접속 가능합니다!");
	return;
}
</script>

		<!--[s] header -->
		<header id="header" class="page-faq-main.do">
		<form action="" method="post" name="myForm2">
			<div id="top-gnb">
				<div class="top-wrap">
					<nav id="topUtil" class="top-util">
						<ul>
						<c:choose>
							<c:when test="${empty sessionScope.customInfo.id }">
								<li><a href="<%=cp%>/itving/login.do">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li class="more_info"><a href="<%=cp%>/itving/myPage.do"><font color="pink">${sessionScope.customInfo.name }</font> 님 환영합니다.</a>	
								<div class="gnb-hover-menu"
									style="display: none; margin-left: -50px; visibility: visible;">
									<a href="<%=cp%>/itving/myPage.do" data-nethru_clcode="A000011">마이아이티빙</a>		
								<a href="javascript:logout();" data-nethru_clcode="A000012">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
							<li class="more_info"><a href="<%=cp%>/itving/pass.do"
								data-nethru_clcode="A000010">이용권</a></li>
						</ul>
					</nav>
				</div>
			</div>
			</form>

		<div id="gnb">
			<div class="inner-wrap">
				<h1>
					<img onclick="javascript:location.href='<%=cp%>/itving/main.do'"
						alt="" src="<%=cp%>/proj3/itving/logo2.jpg" width="300"
						height="20" />
				</h1>
				<nav id="gnbMenu" class="gnb-menu">

					<h2>
						<a href="<%=cp %>/itving/videoList.do?category=게임">게임</a>
					</h2>

					<h2>
						<a href="<%=cp %>/itving/videoList.do?category=드라마">드라마</a>
					</h2>

					<h2>
						<a href="<%=cp %>/itving/videoList.do?category=예능">예능</a>
					</h2>

					<h2>
						<a href="<%=cp %>/itving/videoList.do?category=스포츠">스포츠</a>
					</h2>
					
					<h2>
						<a href="<%=cp %>/itving/videoList.do?category=영화">영화</a>
					</h2>
					
					<h2>
						<a href="<%=cp%>/itving/boardlist.do" data-sub="#gnbMusic" class="">커뮤니티</a>
					</h2>

					<c:if test="${sessionScope.customInfo.id == 'admin' }">
					<h2>
						<a href="<%=cp %>/itving/videoUpload.do">영상 업로드</a>
					</h2>
					</c:if>
					
				</nav>

			</div>
		</div>
		<div class="sub-gnb">
			<div class="inner-wrap"></div>
		</div>



		</header>

		<!--[e] header -->


		<!-- v5 로 이관 (user.tving.com) 과 충돌 -->
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/static/common.search-1.0.js?v=108"></script>
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/billing/js/infra.billing.pc.js?v=108"></script>
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/static/lib/jquery/jquery.placeholders.min.js?v=108"></script>
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/static/common.recommend-1.0.js?v=108"></script>
		<main> <!--[s] contents -->
		<div class=" container" id="contents-wrap">
			<div class="sub-contents-wrap inner-wrap">




				<div class="title-group">
					<!-- 게시판 상단바 -->
					<h3 class="large" align="center">
						<b>ITVING 커뮤니티 게시판</b>
					</h3>
				</div>
				<!-- 게시판 카테고리 -->
				<div class="tab_type01 normal">
					<ul id="helpdesk_sub_menu">
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do';">전체</a></li>
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do?category=game&c_pageNum=1';">게임</a></li>
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do?category=drama&c_pageNum=1 ';"
							class="">드라마</a></li>
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do?category=entertainment&c_pageNum=1 ';">예능</a></li>
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do?category=sports&c_pageNum=1 ';"
							class="">스포츠</a></li>
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do?category=movie&c_pageNum=1 ';"
							class="">영화</a></li>
						<li><a
							href="javascript:location.href='<%=cp%>/itving/boardlist.do?category=etc&c_pageNum=1 ';"
							class="">기타</a></li>

					</ul>
				</div>

				<form action="" method="post" name="searchForm">
					<div class="faq-search-box">
						<div class="form-box tmg0">

							<div class="customer-list-box">

								<input type="text" id="  " style="width: 270px"
									name="searchValue"> <input type="button"
									style="border: 20pt; font-size: 12pt; font-family: '돋움'; font-weight: 800; background-color: #191919; color: white; padding-top: 5pt; padding-bottom: 5pt; padding-left: 8pt; padding-right: 8pt;"
									value="검색" onclick="sendIt();"> <input type="hidden"
									value="subject" name="searchKey">

							</div>
							<!-- 게시판 질문 중간 부분 -->
							<div class="faq-search-key">
								<strong style="font-size: 12pt; color: red;">[&nbsp;공지사항&nbsp;]
								</strong>
								<c:forEach var="rvdto" items="${note_list }">
									<a class="bold" href="${articleURL }&re_num=${rvdto.re_num }"
										style="font-size: 11pt; color: white;"> &nbsp;
										*&nbsp;${rvdto.subject }</a>
								</c:forEach>
							</div>
						</div>
					</div>

				</form>

				<script type="text/javascript">
	
	function sendIt(){
		var f = document.searchForm;
	
		f.action ="<%=cp%>/itving/boardlist.do";
						f.submit();
					}
				</script>


				<!--[s] contents -->


				<br />
				<br />


				<script type="text/javascript">
					$(function() {
						$('#helpdesk_sub_menu').find('.auth-check').click(
								function(e) {
									pd(e);
									var returnUrl = location.protocol + '//'
											+ location.host
											+ $(this).attr('href');
									userLoginCheck(null, returnUrl);
								});
					})

					function createIt() {

						alert("로그인 후 이용해주세요!!!")
						return;

					}
				</script>

				<div class="customer-list-box">
					<table class="tbl-list normal">
						<div class="btn-area ar">

							<input type="button" value=" 글올리기 " align=right
								class="btn-box board"
								onclick="javascript:location.href='<%=cp%>/itving/boardcreated.do'" />

						</div>
						<br />
						<caption>공지 사항 목록</caption>
						<colgroup>
							<col style="width: 100px;">
							<col style="width: 800px">
							<col style="width: 100px;">
							<col style="width: 100px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" style="font-size: 12pt;">번호</th>
								<th scope="col" class="" style="font-size: 12pt;" align="center">제목</th>
								<th scope="col" style="font-size: 12pt;">작성자</th>
								<th scope="col" style="font-size: 12pt;">작성일</th>
								<th scope="col" style="font-size: 12pt;">조회수</th>
							</tr>
						</thead>
						<tbody id="contents-list">
							<c:choose>
					<c:when test="${empty category }">
					<c:forEach var="rdto" items="${lists }">
					<tr>
						<td style="font-size:10pt;"> <span>${rdto.re_num }</span></td>
						<td class="title" style="font-size:10pt;" align="center" ><a class="bold" href="${articleURL }&re_num=${rdto.re_num }">
						[&nbsp;
						<c:if test="${rdto.category=='game'}">게임</c:if> 
						<c:if test="${rdto.category=='drama'}">드라마</c:if>
						<c:if test="${rdto.category=='etc'}">기타</c:if> 
						<c:if test="${rdto.category=='sports'}">스포츠</c:if>
						<c:if test="${rdto.category=='entertainment'}">예능</c:if>
						<c:if test="${rdto.category=='movie'}">영화</c:if>
						<c:if test="${rdto.category=='notice'}">공지</c:if> 
						&nbsp;]
						&nbsp;&nbsp; ${rdto.subject }</a> 
						<c:if test="${rdto.dat_count >0 }">(${rdto.dat_count })</c:if>
						<c:if test="${rdto.fileName !=null }"><img src="" align="top" width="18" height="18"/></c:if></td>
						<td style="font-size:10pt;">${rdto.re_id }</td>
						<td style="font-size:10pt;">${rdto.cdate }</td>
						<td style="font-size:10pt;">${rdto.hitCount }</td>
					</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="cate_rdto" items="${cate_list }">
					<tr>
						<td style="font-size:10pt;"> <span>${cate_rdto.re_num }</span></td>
						<td class="title" style="font-size:10pt;" align="center" >
						<a class="bold" href="${articleURL }&re_num=${cate_rdto.re_num }">
						[&nbsp;
						<c:if test="${cate_rdto.category=='game'}">게임</c:if> 
						<c:if test="${cate_rdto.category=='drama'}">드라마</c:if>
						<c:if test="${cate_rdto.category=='etc'}">기타</c:if> 
						<c:if test="${cate_rdto.category=='sports'}">스포츠</c:if>
						<c:if test="${cate_rdto.category=='entertainment'}">예능</c:if>
						<c:if test="${cate_rdto.category=='movie'}">영화</c:if>
						<c:if test="${cate_rdto.category=='notice'}">공지</c:if> 
						&nbsp;]
						&nbsp;&nbsp; ${cate_rdto.subject }</a> 
						<c:if test="${cate_rdto.dat_count >0 }">(${cate_rdto.dat_count })</c:if>
						<c:if test="${cate_rdto.fileName !=null }"><img src="" align="top" width="18" height="18"/></c:if></td>
						<td style="font-size:10pt;">${cate_rdto.re_id }</td>
						<td style="font-size:10pt;">${cate_rdto.cdate }</td>
						<td style="font-size:10pt;">${cate_rdto.hitCount }</td>
					</tr>
					</c:forEach>
					</c:otherwise>		
				</c:choose>
							<%-- <c:if test="${cate_list !=null }">
					<c:forEach var="cate_rdto" items="${cate_list }">
					<tr>
						<td style="font-size:10pt;"> <span>${cate_rdto.re_num }</span></td>
						<td class="title" style="font-size:10pt;" align="center" ><a class="bold" href="${articleURL }&re_num=${cate_rdto.re_num }">[&nbsp;${cate_rdto.category}&nbsp;]&nbsp;&nbsp; ${cate_rdto.subject }</a> (${cate_rdto.dat_count })</td>
						<td style="font-size:10pt;">${cate_rdto.cdate }</td>
						<td style="font-size:10pt;">${cate_rdto.hitCount }</td>
					</tr>
					</c:forEach>
					</c:if> --%>

						</tbody>
					</table>

					<div id="contents-paging" class="paging">
						<c:choose>
							<c:when test="${empty category }">

								<c:if test="${ dataCount!=0}">
									${pageIndexList }			
								</c:if>
								<c:if test="${ dataCount==0}">
									등록된 게시물이 없습니다.
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${ categoryCount!=0}">
									${c_pageIndexList }			
								</c:if>
								<c:if test="${ categoryCount==0}">
									등록된 게시물이 없습니다.
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/lib/jquery/jquery.history.js?v=108"></script>
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/portal/js/helpdesk/page.helpdesk.faq.js?v=108"></script>
	</main>



	<!-- 하단부분 -->


	<div class="page-top-box" style="display: none;">
		<a href="javascript:void(0);"
			onclick="$(document).scrollTop(0);return;">위로</a>
	</div>

	<!--[s] footer -->
	<footer id="footer"> <section class="footer-top">
	<div class="inner-wrap">
		<dl class="footer-notice">
			<div class="footer-select-box">
				<div class="footer-select"></div>
			</div>
		</dl>
	</div>
	</section> <section class="footer-contents">
	<div class="inner-wrap">
		<nav class="footer-util"> </nav>
	</div>
	</section></footer>
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/page/footer.js?v=108"></script>
	<script>
	initFooter($('#footer'), 'https://image.tving.com');
</script>
	<!--[e] footer -->

	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/common.chat-1.0.js?v=108"></script>
	</div>


</body>
</html>

