<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="origin-trial"
	data-feature="EME Extension - Policy Check" data-expires="2018-11-26"
	content="Aob+++752GiUzm1RNSIkM9TINnQDxTlxz02v8hFJK/uGO2hmXnJqH8c/ZpI05b2nLsHDhGO3Ce2zXJUFQmO7jA4AAAB1eyJvcmlnaW4iOiJodHRwczovL25ldGZsaXguY29tOjQ0MyIsImZlYXR1cmUiOiJFbmNyeXB0ZWRNZWRpYUhkY3BQb2xpY3lDaGVjayIsImV4cGlyeSI6MTU0MzI0MzQyNCwiaXNTdWJkb21haW4iOnRydWV9">
<title>ITVING | 인터넷으로 아무거나 시청하세요</title>
<link rel="preload"
	href="https://codex.nflxext.com/%5E3.0.0/truthBundle/webui/0.0.1-shakti-js-v1b8c742f/js/js/bootstrap.js,common%7Cbootstrap.js/2/4P034m4a4o4E4B05464w4O070p004Q4r4h4y4p4I4d4x4k4A4f4e4H0b024L204s/bck/true/none"
	as="script">
<link rel="preload"
	href="https://codex.nflxext.com/%5E3.0.0/truthBundle/webui/0.0.1-shakti-js-v1b8c742f/js/js/signup%7Chome%7CourStory%7Cfuji%7CfujiFrameworkClient.js/2/4P034m4a4o4E4B05464w4O070p004Q4r4h4y4p4I4d4x4k4A4f4e4H0b024L204s/l/true/none"
	as="script">
<link type="text/css" rel="stylesheet"
	href="/personalization/cl2/freeform/WebsiteDetect?source=wwwhead&amp;fetchType=css&amp;modalView=nmLanding">
<script type="text/javascript">
	(function() {
		var request = new XMLHttpRequest();
		request
				.open(
						'GET',
						'/personalization/cl2/freeform/WebsiteDetect?source=wwwhead&fetchType=js&modalView=nmLanding',
						true);
		request.send();
		var request2 = new XMLHttpRequest();
		request2.open('GET',
				'/personalization/cl2/freeform/WebsiteScreen?source=wwwhead&fetchType=js'
						+ '&winw='
						+ window.outerWidth
						+ '&winh='
						+ window.outerHeight
						+ '&screenw='
						+ window.innerWidth
						+ '&screenh='
						+ window.innerHeight
						+ '&ratio='
						+ (window.devicePixelRatio ? window.devicePixelRatio
								: 'unsupported'), true);
		request2.send();
	})();
</script>
<meta
	content="영화 보기, 온라인 영화, 인터넷 영화, TV 시청, TV 온라인, 온라인 TV 프로그램, 인터넷 TV 프로그램,&nbsp;TV 프로그램 보기, 영화 스트리밍, 스트리밍 tv, 인스턴트 스트리밍, 온라인 시청, 인터넷 시청,&nbsp;영화, 영화 보기 대한민국, 온라인 TV 보기, 다운로드 불필요, 영화 풀 버전, 전체 영화"
	name="keywords">
<meta
	content="스마트 TV, 태블릿, 스마트폰, PC, 게임 콘솔 등 다양한 디바이스에서 영화와 TV 프로그램을 마음껏 즐기세요."
	name="description">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="apple-touch-icon"
	content="https://assets.nflxext.com/en_us/layout/ecweb/netflix-app-icon_152.jpg">
<link type="text/css" rel="stylesheet"
	href="https://codex.nflxext.com/%5E3.0.0/truthBundle/webui/0.0.1-shakti-css-v1b8c742f/css/css/less%7Ccore%7Cerror-page.less/1/8tDvL3ruHF9CIKw/none/true/none">
<link type="text/css" rel="stylesheet"
	href="https://codex.nflxext.com/%5E3.0.0/truthBundle/webui/0.0.1-shakti-css-v1b8c742f/css/css/less%7Cpages%7Chome%7CourStory%7Cfuji%7Cfuji.less/1/8tDvL3ruHF9CIKw/none/true/none">
<link type="text/css" rel="stylesheet"
	href="https://codex.nflxext.com/%5E3.0.0/truthBundle/webui/0.0.1-shakti-css-v1b8c742f/css/css/less%7Ccommon%7CkoreanLineBreak.less/1/8tDvL3ruHF9CIKw/none/true/none">
<link rel="shortcut icon"
	href="https://image.tving.com/theme/tving_new/img/logo/favicon.ico">
<link rel="apple-touch-icon"
	href="https://assets.nflxext.com/us/ffe/siteui/common/icons/nficon2016.png">

<script>
	window.netflix = window.netflix || {};
	netflix.notification.constants = {
		"pageName" : "nmLanding",
		"locale" : "ko-KR",
		"sessionLength" : 30,
		"uiMode" : "nonmember",
		"ownerToken" : "622DZZ2WRFEY5P263KIEDRHI7E",
		"accept-language" : "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7"
	};
</script>
<script>
	window.netflix = window.netflix || {};
	netflix.notification.specification.uiView = {
		"impression" : {
			"send" : "both",
			"overlapping" : true
		},
		"command" : {
			"send" : "both"
		},
		"search" : {
			"send" : "both"
		},
		"uma" : {
			"send" : "both"
		},
		"focus" : {
			"send" : "both"
		},
		"scdWizardStep" : {
			"send" : "both"
		},
		"navigationLevel" : {
			"send" : "both"
		},
		"presentation" : {
			"send" : "both"
		},
		"onrampSimilarsGroup" : {
			"send" : "both"
		}
	};
</script>
<script>
	window.netflix = window.netflix || {};
	netflix.notification.specification.uiAction = {
		"manageSubscriptions" : {
			"send" : "end"
		},
		"removeActivityHistory" : {
			"send" : "end"
		},
		"promoShareFacebook" : {
			"send" : "end"
		},
		"promoShareTwitter" : {
			"send" : "end"
		},
		"rateTitle" : {
			"send" : "end"
		},
		"addToPlaylist" : {
			"send" : "both"
		},
		"selectProfile" : {
			"send" : "end"
		},
		"addProfile" : {
			"send" : "end"
		},
		"trailerPlay" : {
			"send" : "both"
		},
		"startTrailerPlay" : {
			"send" : "both"
		},
		"onRamp" : {
			"send" : "both"
		},
		"submitUnsupportedCountryEmail" : {
			"send" : "both"
		},
		"iTunesPriceFetching" : {
			"send" : "both"
		},
		"iTunesPurchase" : {
			"send" : "both"
		},
		"iTunesRestore" : {
			"send" : "both"
		},
		"iTunesSubmitReceipt" : {
			"send" : "both"
		},
		"iTunesSubmitRestoredReceipt" : {
			"send" : "both"
		},
		"iTunesSignUpFallback" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseBegin" : {
			"send" : "both"
		},
		"iTunesTracerPurchasePostBridge" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseHandleReceipt" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseHasReceipt" : {
			"send" : "both"
		},
		"iTunesTracerPurchasePreFailure" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseFailure" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseCancel" : {
			"send" : "both"
		},
		"iTunesTracerPurchasePreFailureDevice" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseFailureDevice" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseMissingReceipt" : {
			"send" : "both"
		},
		"iTunesTracerPurchasePreSendReceipt" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseSendReceipt" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseMoneyballError" : {
			"send" : "both"
		},
		"iTunesTracerPurchaseSendReceiptEnd" : {
			"send" : "both"
		},
		"playStorePriceFetching" : {
			"send" : "both"
		},
		"playStorePurchase" : {
			"send" : "both"
		},
		"playStoreRestore" : {
			"send" : "both"
		},
		"playStoreSubmitReceipt" : {
			"send" : "both"
		},
		"playStoreSubmitRestoredReceipt" : {
			"send" : "both"
		},
		"playStoreFlowFallback" : {
			"send" : "both"
		},
		"playStoreSignUpFallback" : {
			"send" : "both"
		},
		"playStoreAndroidSignUp" : {
			"send" : "both"
		},
		"playStoreAndroidRetrySignUp" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseBegin" : {
			"send" : "both"
		},
		"playStoreTracerPurchasePostBridge" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseHandleReceipt" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseHasReceipt" : {
			"send" : "both"
		},
		"playStoreTracerPurchasePreFailure" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseFailure" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseCancel" : {
			"send" : "both"
		},
		"playStoreTracerPurchasePreFailureDevice" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseFailureDevice" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseMissingReceipt" : {
			"send" : "both"
		},
		"playStoreTracerPurchasePreSendReceipt" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseSendReceipt" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseMoneyballError" : {
			"send" : "both"
		},
		"playStoreTracerPurchaseSendReceiptEnd" : {
			"send" : "both"
		},
		"simplicitySubmit" : {
			"send" : "both"
		},
		"simplicityFlowEndpointTiming" : {
			"send" : "both"
		},
		"editPaymentSubmit" : {
			"send" : "both"
		},
		"processAsDebitChecked" : {
			"send" : "both"
		},
		"processAsDebitSubmit" : {
			"send" : "both"
		},
		"processAsDebitUrl" : {
			"send" : "both"
		},
		"processAsDebitRendered" : {
			"send" : "both"
		},
		"navigate" : {
			"send" : "both"
		},
		"submitOnrampResults" : {
			"send" : "both"
		}
	};
</script>
<script>
	window.netflix = window.netflix || {};
	netflix.notification.specification.search = {
		"focus" : {
			"send" : "both"
		}
	};
</script>
<script>
	window.netflix = window.netflix || {};
	netflix.notification.specification.uiQOE = {
		"appSession" : {
			"send" : "both"
		},
		"userSession" : {
			"send" : "both"
		},
		"uiStartup" : {
			"send" : "end"
		},
		"uiBrowseStartup" : {
			"send" : "end"
		},
		"uiModalViewChanged" : {
			"eventProperties" : {
				"value" : "modalView"
			},
			"send" : "start"
		},
		"uiModelessView" : {
			"send" : "both",
			"overlapping" : "true"
		},
		"partnerSession" : {
			"send" : "both",
			"overlapping" : false
		}
	};
</script>
<script>
	window.netflix = window.netflix || {};
	netflix.notification.specification.www = {
		"playbackPerformance" : {
			"send" : "both"
		},
		"playbackFeatureDetection" : {
			"send" : "end"
		},
		"playbackError" : {
			"send" : "end"
		},
		"windowOnError" : {
			"send" : "end"
		}
	};
</script>
<script>
	window.netflix = window.netflix || {};
	netflix.notification.specification.login = {
		"poll" : {
			"send" : "both"
		},
		"autofill" : {
			"send" : "both"
		}
	};
</script>
<meta property="og:description"
	content="스마트 TV, 태블릿, 스마트폰, PC, 게임 콘솔 등 다양한 디바이스에서 영화와 TV 프로그램을 마음껏 즐기세요.">
<meta property="al:ios:url"
	content="nflx://www.netflix.com/?locale=ko-KR">
<meta property="al:ios:app_store_id" content="363590051">
<meta property="al:ios:app_name" content="Netflix">
<meta property="al:android:url"
	content="nflx://www.netflix.com/?locale=ko-KR">
<meta property="al:android:package" content="com.netflix.mediaclient">
<meta property="al:android:app_name" content="Netflix">
<meta name="twitter:card" content="player">
<meta name="twitter:site" content="@netflix">
<script>
	/* Disable minification (remove `.min` from URL path) for more info */
</script>
</head>
<body>
	<div id="appMountPoint">
		<div class="basicLayout">
			<div class="netflix-sans-font-loaded">
				<div class="our-story-desktop-framework">
					<div>
						<div class="our-story-container our-story-extended-diacritics"
							dir="ltr">
							<div class="our-story-header-wrapper">
							
							<!-- 로고넣는 자리 -->
							<!-- <img onclick="javascript:location.href='<%=cp%>/itving/firstPage.do'" alt="" src="<%=cp%>/proj3/itving/logo3.png" width="300" height="20"/> -->
								<h1 style=" font: italic bold 3.0em/1em Georgia, serif ; color: red; padding-left: 30px; padding-top: 50px;" onclick="javascript:location.href='<%=cp%>/itving/firstPage.do'">ITVING</h1>
								<div class="our-story-header"
									data-uia-our-story="our-story-header">
									<a href="<%=cp %>/itving/login.do" class="authLinks redButton"
										data-uia="header-login-link">로그인</a>
								</div>
							</div>
							<div class="our-story-cards" data-uia-our-story="our-story-cards">
								<div class="our-story-card hero-card vlv"
									data-uia-our-story="hero_fuji" data-uia="our-story-card">
									<div class="our-story-card-background">
										<div class="concord-img-wrapper"
											data-uia="concord-img-wrapper" style="height: 854px;">
											<img class="concord-img vlv-creative"
												src="https://assets.nflxext.com/ffe/siteui/vlv3/3b48f428-24ed-4692-bb04-bc7771854131/fb5674c7-afc0-4c05-9f06-ef601019b114/KR-ko-20200302-popsignuptwoweeks-perspective_alpha_website_small.jpg"
												srcset="https://assets.nflxext.com/ffe/siteui/vlv3/3b48f428-24ed-4692-bb04-bc7771854131/fb5674c7-afc0-4c05-9f06-ef601019b114/KR-ko-20200302-popsignuptwoweeks-perspective_alpha_website_small.jpg 1000w, https://assets.nflxext.com/ffe/siteui/vlv3/3b48f428-24ed-4692-bb04-bc7771854131/fb5674c7-afc0-4c05-9f06-ef601019b114/KR-ko-20200302-popsignuptwoweeks-perspective_alpha_website_medium.jpg 1500w, https://assets.nflxext.com/ffe/siteui/vlv3/3b48f428-24ed-4692-bb04-bc7771854131/fb5674c7-afc0-4c05-9f06-ef601019b114/KR-ko-20200302-popsignuptwoweeks-perspective_alpha_website_large.jpg 1800w"
												alt="">
											<div class="concord-img-gradient"></div>
										</div>
									</div>
									<div class="our-story-card-text">
										<h1 id="" class="our-story-card-title" data-uia="hero-title">영상,
											 영화를 무제한으로.</h1>
										<h2 id="" class="our-story-card-subtitle"
											data-uia="our-story-card-subtitle">다양한 디바이스에서 시청하세요. 언제든
											해지하실 수 있습니다.</h2>
										<form class="cta-form email-form" data-uia="email-form"
											method="GET">
											<h3 class="email-form-title">시청할 준비가 되셨나요? 시작하려면 회원가입을 해주세요.</h3>
											<div class="email-form-lockup">
												<ul class="simpleForm structural ui-grid">
													<li data-uia="field-email+wrapper"
														class="nfFormSpace field-email"><div
															data-uia="field-email+container"
															class="nfInput nfInputResponsive">
															
														</div></li>
												</ul>
												<div class="our-story-cta-container cta-link-wrapper">
													<a
										href="<%=cp %>/itving/signUp.do" class="btn btn-red nmhp-cta nmhp-cta-extra-large btn-none btn-custom"
										data-uia="header-login-link">회원가입</a>
												</div>
											</div>
										</form>
									</div>
									<div class="center-pixel" style="position: absolute"></div>
								</div>
								<div class="our-story-card animation-card watchOnTv"
									data-uia-our-story="watchOnTv" data-uia="our-story-card">
									<div class="animation-card-container">
										<div class="our-story-card-text">
											<h1 id="" class="our-story-card-title"
												data-uia="animation-card-title">TV로 즐기세요.</h1>
											<h2 id="" class="our-story-card-subtitle"
												data-uia="our-story-card-subtitle">스마트 TV, PlayStation,
												Xbox, Chromecast, Apple TV, 블루레이 플레이어 등 다양한 디바이스에서 시청하세요.</h2>
										</div>
										<div class="our-story-card-img-container">
											<div class="our-story-card-animation-container">
												<img alt="" class="our-story-card-img"
													src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/tv.png"
													data-uia="our-story-card-img">
												<div class="our-story-card-animation">
													<video class="our-story-card-video" autoplay=""
														playsinline="" muted="" loop="">
													<source
														src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-tv-0819.m4v"
														type="video/mp4"></video>
													<div class="our-story-card-animation-text"></div>
												</div>
											</div>
										</div>
										<div class="center-pixel" style="position: absolute"></div>
									</div>
								</div>
								
								
								<div class="our-story-card faq-card" data-uia-our-story="faq"
									data-uia="our-story-card" id="faq">
									<div class="our-story-card-text">
										<h1 id="" class="our-story-card-title" data-uia="faq-title">자주
											묻는 질문</h1>
										<ul class="faq-list">
											<li class="faq-list-item" data-uia-our-story="faq-list-item"><button
													class="faq-question">
													아이티빙이란 무엇인가요?
													<svg id="thin-x" viewBox="0 0 26 26"
														class="svg-icon svg-icon-thin-x svg-closed"
														focusable="true">
													<path
														d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path></svg>
												</button>
												<div class="faq-answer closed">
													<span id="" data-uia="">아이티빙은 각종 수상 경력에 빛나는 TV 프로그램,
														영화, 애니메이션, 다큐멘터리 등 다양한 콘텐츠를 인터넷 연결이 가능한 수천 종의 디바이스에서 시청할 수
														있는 스트리밍 서비스입니다. <br>
													<br>저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼 즐길 수 있습니다.
														무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 TV 프로그램과 영화가 제공됩니다.
													</span>
												</div></li>
											<li class="faq-list-item" data-uia-our-story="faq-list-item"><button
													class="faq-question">
													아이티빙 요금은 얼마인가요?
													<svg id="thin-x" viewBox="0 0 26 26"
														class="svg-icon svg-icon-thin-x svg-closed"
														focusable="true">
													<path
														d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path></svg>
												</button>
												<div class="faq-answer closed">
													<span id="" data-uia="">스마트폰, 태블릿, 스마트 TV, 노트북, 스트리밍
														디바이스 등 다양한 디바이스에서 월정액 요금 하나로 아이티빙를 시청하세요. 멤버십 요금은 월
														9,500원부터 14,500원까지 다양합니다. 추가 비용이나 약정이 없습니다.</span>
												</div></li>
											<li class="faq-list-item" data-uia-our-story="faq-list-item"><button
													class="faq-question">
													어디에서 시청할 수 있나요?
													<svg id="thin-x" viewBox="0 0 26 26"
														class="svg-icon svg-icon-thin-x svg-closed"
														focusable="true">
													<path
														d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path></svg>
												</button>
												<div class="faq-answer closed">
													<span id="" data-uia="">다양한 디바이스에서 언제 어디서나 시청할 수
														있습니다. 아이티빙 계정으로 로그인하면 PC에서 netflix.com을 통해 바로 시청할 수 있으며,
														인터넷이 연결되어 있고 아이티빙 앱을 지원하는 디바이스(스마트 TV, 스마트폰, 태블릿, 스트리밍 미디어
														플레이어, 게임 콘솔 등)에서도 언제든지 시청할 수 있습니다. <br>
													<br>iOS, Android, Windows 10용 앱에서는 좋아하는 프로그램을 저장할 수도
														있습니다. 저장 기능을 이용해 이동 중이나 인터넷에 연결할 수 없는 곳에서도 시청하세요. 아이티빙은
														어디서든 함께니까요.
													</span>
												</div></li>
											<li class="faq-list-item" data-uia-our-story="faq-list-item"><button
													class="faq-question">
													멤버십을 해지하려면 어떻게 하나요?
													<svg id="thin-x" viewBox="0 0 26 26"
														class="svg-icon svg-icon-thin-x svg-closed"
														focusable="true">
													<path
														d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path></svg>
												</button>
												<div class="faq-answer closed">
													<span id="" data-uia="">아이티빙은 부담 없이 간편합니다. 성가신 계약도,
														약정도 없으니까요. 멤버십 해지도 온라인에서 클릭 두 번이면 완료할 수 있습니다. 해지 수수료도 없으니
														원할 때 언제든 계정을 시작하거나 종료하세요.</span>
												</div></li>
											<li class="faq-list-item" data-uia-our-story="faq-list-item"><button
													class="faq-question">
													아이티빙에서 어떤 콘텐츠를 시청할 수 있나요?
													<svg id="thin-x" viewBox="0 0 26 26"
														class="svg-icon svg-icon-thin-x svg-closed"
														focusable="true">
													<path
														d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path></svg>
												</button>
												<div class="faq-answer closed">
													<span id="" data-uia="">아이티빙은 장편 영화, 다큐멘터리, TV 프로그램,
														애니메이션, 각종 상을 수상한 아이티빙 오리지널 등 수많은 콘텐츠를 확보하고 있습니다. 마음에 드는
														콘텐츠를 원하는 시간에 원하는 만큼 시청하세요. 30일 무료 이용으로 아이티빙의 무한한 콘텐츠 세상을
														만나보세요.</span>
												</div></li>
											<li class="faq-list-item" data-uia-our-story="faq-list-item"><button
													class="faq-question">
													무료 이용에 관해 자세히 알 수 있을까요?
													<svg id="thin-x" viewBox="0 0 26 26"
														class="svg-icon svg-icon-thin-x svg-closed"
														focusable="true">
													<path
														d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path></svg>
												</button>
												<div class="faq-answer closed">
													<span id="" data-uia="">아이티빙을 30일 동안 무료로 이용해 보세요.
														마음에 드는 경우 계속 이용하시면 됩니다. 별도로 해지하지 않는 한, 멤버십이 자동으로 유지됩니다. 무료
														이용 기간이 끝나기 전에 멤버십을 해지하면 요금이 청구되지 않습니다. 복잡한 계약, 약정, 해지 수수료가
														없습니다. 언제든 온라인으로 해지하세요.</span>
												</div></li>
										</ul>
									</div>
									<div class="center-pixel" style="position: absolute"></div>
								</div>
								<div
									class="our-story-card card-contents footer-card our-story-card-no-border"
									style="position: relative" data-uia-our-story="footer"
									data-uia="our-story-card">
									<div class="site-footer-wrapper centered dark">
										<div class="footer-divider"></div>
										<div class="site-footer">
											<p class="footer-country">ITVING 대한민국</p>
											<div class="copy-text">
												<div class="copy-text-block">아이티빙서비시스코리아 유한회사
													통신판매업신고번호: 제2018-서울종로-0426호 전화번호:</div>
												<div class="copy-text-block">대표: 레지널드 숀 톰프슨</div>
												<div class="copy-text-block">이메일 주소: korea@netflix.com</div>
												<div class="copy-text-block">주소: 대한민국 서울특별시 종로구 우정국로
													26, 센트로폴리스 A동 20층 우편번호 03161</div>
												<div class="copy-text-block">클라우드 호스팅: Amazon Web
													Services Inc.</div>
												<div id="" class="copy-text-block" data-uia="">
													<a
														href="http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018300016930200431&amp;pageUnit=10&amp;searchCnd=bup_nm&amp;searchKrwd=%EB%84%B7%ED%94%8C%EB%A6%AD%EC%8A%A4&amp;pageIndex=1">공정거래위원회
														웹사이트 링크</a>
												</div>
											</div>
										</div>
									</div>
									<div class="center-pixel" style="position: absolute"></div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>