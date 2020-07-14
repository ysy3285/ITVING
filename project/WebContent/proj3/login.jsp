<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.gstatic.com/recaptcha/releases/JPZ52lNx97aD96bjM7KaA0bo/recaptcha__ko.js"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v4/portal/js/common/wl6.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>ITVING | 언제 어디서나 아이티빙</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--link rel="icon" type="image/x-icon" href="/favicon.ico" /-->
<link rel="shortcut icon"
	href="https://image.tving.com/theme/tving_new/img/logo/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.css?v=13">
<!-- base href="./" / -->
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/typography.css?v=13">
<!-- link rel="stylesheet" type="text/css" href="/public_v6/portal/css/typography.css?v=13" -->
<link rel="stylesheet"
	href="https://image.tving.com/public_v6/portal/app.css?v=13">

<script async=""
	src="https://www.googletagmanager.com/gtm.js?id=GTM-K9Q8F7B"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery-1.12.3.min.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.cookie.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.easing.1.3.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/jquery/jquery.scrollbar.min.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/momentjs/moment.min.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/momentjs/moment.lang.ko.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.core-1.0.js?apiKey=1e7952d0917d6aab1f0293a063697610&amp;v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.media-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.operator-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.community-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.my-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.infra-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/jarvis.smr-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/common.util-1.0.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/json2/json2.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/user-agent/ua_parser.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/user-agent/ua-parser.min.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/clientjs/client.min.js?v=13"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/ie9/html5shiv.js?v=13"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/ie9/selectivizr.js?v=13"></script>
<![endif]-->
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/script.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/common/page.common.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/portal/js/common/nethru_script.js?v=13"></script>
<script type="text/javascript"
	src="https://image.tving.com/public_v6/static/lib/marpple/partial.js?v=13"></script>

<!-- script type="text/javascript" src="https://image.tving.com/public_v4/static/lib/jquery/jquery.bxslider.js?v=13"></script -->
<!-- DataStory -->
<!--script type="text/javascript" src="https://image.tving.com/public_v4/portal/js/common/wl6.js"></script-->

<script type="text/javascript">
	var service = {};

	var ctx = 'http://www.tving.com';
	var cacheVersion = '13';
	var imageDomain = 'http://image.tving.com';
	var imageOriginDomain = '';
	var publicDomain = 'http://www.tving.com';
	var serverDomain = 'http://www.tving.com';

	var user_yn = false;
	var user_adult_yn = '';
	var user_adult_confirm = '';

	var loginUrl = 'http://user.tving.com/pc/user/login.tving';
	var logoutUrl = 'http://user.tving.com/pc/user/doLogout.tving';

	var global = {
		user_no : '',
		user_id : '',
		user_nickname : '',
		user_fb_token : '',
		user_tw_token : '',
		media_code : '',
		body : null
	};

	service.constants = {
		"imageOrigin" : "//image.tving.com",
		"tving" : "http://www.tving.com",
		"bill" : "http://bill.tving.com",
		"userHttps" : "https://user.tving.com",
		"tvingHttp" : "http://www.tving.com",
		"image" : "http://image.tving.com",
		"api" : "http://api.tving.com",
		"imageHttps" : "https://image-origin.tving.com",
		"tvingHttps" : "https://www.tving.com",
		"billHttps" : "https://bill.tving.com",
		"apiHttps" : "http://api.tving.com",
		"imageHttp" : "http://image.tving.com",
		"userHttp" : "http://user.tving.com",
		"billHttp" : "http://bill.tving.com",
		"apiHttp" : "http://api.tving.com",
		"user" : "http://user.tving.com",
		"version" : "13"
	};
	document.domain = "tving.com";
</script>

<script type="text/javascript" src="/public_v4/infra/user/js/user.js"></script>
<!-- Google Analytics -->
<!-- Google Dimension -->
<script>
	var isApp = false;
	var oVisitor = {
		USER_AGENT : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',
		DEVICE : 'etc',
		OS : '',
		IP : '1.234.209.30'
	};
	var cjMbrshYn = '';
	var custTyp = '';
	var age = '';
	var sex = '';
	var currentHost = location.href;
	var resCjMbrshYn = 'U';
	var resUserId = $.cookie('_tving_token') == null ? '' : $
			.cookie('_tving_token');
	var resLoginYn = 'Y';
	var resLoginType = 'U'; // 회원 유형
	var resSite = 'TVING'; // 고정
	var resChannelType = ""; // 채널 유형
	var resChildSite = "TVING"; // TVING, TVN, OTVN ...
	var resCID = $.cookie('_ga') == null ? '' : $.cookie('_ga'); // CID 명(_ga 쿠키)
	var resAge = "N";
	var resSex = "N";
	var resUserTypeJson = $.cookie('GA360_USERTYPE_JSON') == null ? '' : JSON
			.parse($.cookie('GA360_USERTYPE_JSON'));

	var gdm009 = resUserTypeJson['dm009_usertype'] == null ? 'U'
			: resUserTypeJson['dm009_usertype']; //dm009:고객유형(멀티) - A,B,C,AD,BD,CD,D,N,U
	var gdm013 = resUserTypeJson['dm013_resIsPaid'] == null ? 'U'
			: resUserTypeJson['dm013_resIsPaid']; //dm013:유료/무료 구분 - 유료(P), 무료(F), 비로그인(U)
	var gdm016 = resUserTypeJson['dm016_TL_FYMD'] == null ? ''
			: resUserTypeJson['dm016_TL_FYMD']; //dm016:티빙무제한 최초가입일 - YYMMDD
	var gdm017 = resUserTypeJson['dm017_TL_CYMD'] == null ? ''
			: resUserTypeJson['dm017_TL_CYMD']; //dm017:티빙무제한 최종해지일 - YYMMDD
	var gdm018 = resUserTypeJson['dm018_LP_FYMD'] == null ? ''
			: resUserTypeJson['dm018_LP_FYMD']; //dm018:무제한플러스 최초구매일 - YYMMDD
	var gdm019 = resUserTypeJson['dm019_paycnt'] == null ? ''
			: resUserTypeJson['dm019_paycnt']; //dm019:상품구매 - 정기 결제차수(멀티)
	var gdm020 = resUserTypeJson['dm020_LP_CYMD'] == null ? ''
			: resUserTypeJson['dm020_LP_CYMD']; //dm020:무제한플러스 최종해지일 - YYMMDD
	var gdm021 = resUserTypeJson['dm021_MP_FYMD'] == null ? ''
			: resUserTypeJson['dm021_MP_FYMD']; //dm021:무비프리미엄 최초구매일 - YYMMDD
	var gdm022 = resUserTypeJson['dm022_MP_CYMD'] == null ? ''
			: resUserTypeJson['dm022_MP_CYMD']; //dm022:무비프리미엄 최종해지일 - YYMMDD

	var resIsPaid = (gdm013 != null) ? gdm013 : "U";

	if (custTyp == '10' || custTyp == '30' || custTyp == '40') {
		if (cjMbrshYn == 'Y') {
			resLoginType = 'CJ ONE';
		} else if (cjMbrshYn == 'N') {
			resLoginType = 'TVING';
		}
		// 40 : Test 계정
	} else if (custTyp == '91') {
		resLoginType = 'FACEBOOK'; // facebook
	} else if (custTyp == '92') {
		resLoginType = 'TWITTER'; // twitter
	}

	if (isApp) {
		resChannelType = 'APP';
		// TODO : TABLET, AOS TV 구분 필요
		/* if(oVisitor.OS == "android" || oVisitor.OS == "ios") {
			resChannelType = 'APP';
		}
		else if(oVisitor.OS == 'tablet'){
			resChannelType = 'TABLET';
		} 
		else if(oVisitor.OS == 'atv'){
			resChannelType = 'AOS TV';
		} */
	} else {
		if (currentHost.indexOf('/pc/') != -1) {
			resChannelType = 'PC WEB';
		} else if (currentHost.indexOf('/pc/') == -1) {
			resChannelType = 'MO WEB';
		}
	}

	if (resCID != "") {
		// _ga = GA1.2.958498282.1528764948;
		var cid = resCID.split(".");
		resCID = cid[2] + "." + cid[3]; // 고유사용자 식별값 + "." + 사용자가 웹사이트에처음 방문한 때의 타임스탬프
	}

	if (age != null && age != "") {
		age = parseInt(moment().format('YYYY'))
				- parseInt(moment(age, 'YYYYMMDD').format('YYYY'));
		if (age >= 0 && age <= 19) {
			resAge = 'A';
		} else if (age >= 20 && age <= 29) {
			resAge = 'B';
		} else if (age >= 30 && age <= 39) {
			resAge = 'C';
		} else if (age >= 40 && age <= 49) {
			resAge = 'D';
		} else if (age >= 50 && age <= 59) {
			resAge = 'E';
		} else if (age >= 60) {
			resAge = 'F';
		} else {
			resAge = 'N';
		}
	}

	if (sex != null && sex != "") {
		if (sex == 'M') {
			resSex = 'A';
		} else if (sex == 'F') {
			resSex = 'B';
		} else {
			resSex = 'N';
		}
	}

	if (cjMbrshYn == 'Y') {
		resCjMbrshYn = 'O';
	} else if (cjMbrshYn == 'N') {
		resCjMbrshYn = 'X';
	} else {
		// 비로그인시
		resAge = "U";
		resSex = "C";
		resLoginYn = 'N'
		resIsPaid = 'U';
	}

	// GA DATA for GoogleTagmanager 
	dataLayer = [ {
		'dm001' : resUserId // 고객_고유번호(_tving_token)
		,
		'dm002' : resCjMbrshYn // 고객_통합회원여부(O / X / U : 비로그인)
		,
		'dm003' : resLoginYn // 고객_로그인여부(Y : 로그인 / N : 비로그인)
		,
		'dm004' : resLoginType // 고객_회원유형(CJ ONE / TVING / FACEBOOK / TWITTER / U)
		,
		'dm005' : resAge // 고객_연령(A:10대이하, B:20대, C:30대, D:40대, E:50대, F:60대이상, N:알수없음, U:비로그인)
		,
		'dm007' : resSex // 고객_성별(A:남자, B:여자, C:비로그인, N:알수없음)
		,
		'dm009' : gdm009 // 고객유형(멀티) - A,B,C,AD,BD,CD,D,N,U
		,
		'dm011' : resSite // 사이트명(TVING으로 고정, 영문대문자 표기)
		,
		'dm012' : resChannelType // 채널 유형(PC WEB / MO WEB / APP / TABLET / AOS TV)
		,
		'dm013' : resIsPaid // 유무료_회원여부(P:유료, F:무료, U:비로그인)
		,
		'dm014' : resChildSite // 하위 사이트명(TVING / TVN / OGN …)
		,
		'dm015' : resCID // CID 명(515627205.1526369222 / …  _ga쿠키값)
		,
		'dm016' : gdm016 // 티빙무제한 최초가입일 - YYMMDD
		,
		'dm017' : gdm017 // 티빙무제한 최종해지일 - YYMMDD
		,
		'dm018' : gdm018 // 무제한플러스 최초구매일 - YYMMDD
		,
		'dm019' : gdm019 // 상품구매 - 정기 결제차수(멀티)
		,
		'dm020' : gdm020 // 무제한플러스 최종해지일 - YYMMDD
		,
		'dm021' : gdm021 // 무비프리미엄 최초구매일 - YYMMDD
		,
		'dm022' : gdm022
	// 무비프리미엄 최종해지일 - YYMMDD
	} ];

	// GA DATA for APP
	var ga_data = {};
	ga_data.dm001 = resUserId;
	ga_data.dm002 = resCjMbrshYn;
	ga_data.dm003 = resLoginYn;
	ga_data.dm004 = resLoginType;
	ga_data.dm005 = resAge;
	ga_data.dm007 = resSex;
	ga_data.dm009 = gdm009;
	ga_data.dm011 = resSite;
	ga_data.dm012 = resChannelType;
	ga_data.dm013 = resIsPaid;
	ga_data.dm014 = resChildSite;
	ga_data.dm015 = resCID;
	ga_data.dm016 = gdm016;
	ga_data.dm017 = gdm017;
	ga_data.dm018 = gdm018;
	ga_data.dm019 = gdm019;
	ga_data.dm020 = gdm020;
	ga_data.dm021 = gdm021;
	ga_data.dm022 = gdm022;
	//add 20181205 url 정보 확인
	ga_data.title = document.location.href;

	function WEB_PAGEVIEW() {
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-118660069-1', 'auto');
		ga('set', 'userId', resUserId); //UserID 설정
		ga('set', 'dimension1', resUserId); //고객_고유번호
		ga('set', 'dimension2', resCjMbrshYn); //고객_통합회원여부
		ga('set', 'dimension3', resLoginYn); //고객_로그인여부
		ga('set', 'dimension4', resLoginType); //고객_회원유형
		ga('set', 'dimension5', resAge); //고객_연령
		ga('set', 'dimension7', resSex); //고객_성별
		ga('set', 'dimension9', gdm009); //고객유형(멀티) - A,B,C,AD,BD,CD,D,N,U
		ga('set', 'dimension11', resSite); //사이트명
		ga('set', 'dimension12', resChannelType); //채널 유형
		ga('set', 'dimension13', resIsPaid); //유무료_회원여부
		ga('set', 'dimension14', resChildSite); //하위 사이트명
		ga('set', 'dimension15', resCID); //CID 명
		ga('set', 'dimension16', gdm016); //티빙무제한 최초가입일 - YYMMDD
		ga('set', 'dimension17', gdm017); //티빙무제한 최종해지일 - YYMMDD
		ga('set', 'dimension18', gdm018); //무제한플러스 최초구매일 - YYMMDD
		ga('set', 'dimension19', gdm019); //상품구매 - 정기 결제차수(멀티)
		ga('set', 'dimension20', gdm020); //무제한플러스 최종해지일 - YYMMDD
		ga('set', 'dimension21', gdm021); //무비프리미엄 최초구매일 - YYMMDD
		ga('set', 'dimension22', gdm022); //무비프리미엄 최종해지일 - YYMMDD
	}

	var versionCompare = function(left, right) {
		if (typeof left + typeof right != 'stringstring')
			return false;

		var a = left.split('.'), b = right.split('.'), i = 0, len = Math.max(
				a.length, b.length);

		for (; i < len; i++) {
			if ((a[i] && !b[i] && parseInt(a[i]) > 0)
					|| (parseInt(a[i]) > parseInt(b[i]))) {
				return 1;
			} else if ((b[i] && !a[i] && parseInt(b[i]) > 0)
					|| (parseInt(a[i]) < parseInt(b[i]))) {
				return -1;
			}
		}

		return 0;
	}

	function doRequest(url) {
		if (url != null && url != '') {
			var iframe = document.createElement("IFRAME");
			iframe.setAttribute("src", url);
			iframe.setAttribute("id", "gaRequest");
			//document.documentElement.appendChild(iframe);
			document.getElementByTagName("body")[0].appendChild(iframe);
		}
		var gaRequest = document.getElementById("gaRequest");
		if (gaRequest !== null && gaRequest.getAttribute('id') === 'gaRequest') {
			iframe.parentNode.removeChild(iframe);
			iframe = null;
		}
	}

	function SEND_GADATA_TO_APP() {
		if (isApp) {
			// TODO : 추후 상용적용 예정, ios 는 버전에 따라 호출구분. 5.4.5 이상이면 처리. add 20181031
			var resAppVersion = isNaN(parseFloat('')) ? '0' : '';
			if (oVisitor.OS == "android") {
				window.Android.GA_DATA(JSON.stringify(ga_data));
			} else if (oVisitor.OS == "ios"
					&& versionCompare(resAppVersion, '5.4.5') > 0) {
				//add 20181107 page load delay
				if (document.addEventListener) {
					// For all major browsers, except IE 8 and earlier
					document.addEventListener("DOMContentLoaded", function() {
						var iFrameURL = "iOS://"
								+ encodeURIComponent(JSON.stringify(ga_data));
						doRequest(iFrameURL);
					});
				} else {
					// For IE 8 and earlier versions
					window.attachEvent("onload", function() {
						var iFrameURL = "iOS://"
								+ encodeURIComponent(JSON.stringify(ga_data));
						doRequest(iFrameURL);
					});
				}

				/*
				setTimeout(function() {
				    window.location = "iOS://" + JSON.stringify(ga_data);
				}, 3000);
				 */
			}
		}
	}

	function APP_PAGEVIEW() {
		ga_data.type = 'P' // 페이지뷰 : 'P', 이벤트 : 'E'
		SEND_GADATA_TO_APP();
	}

	// TODO : 추후 신영화님에게 전달받은 GA 이벤트 대상 항목 실행히 아래 function 실행하여 APP에 이벤트 전달
	function APP_EVENT() {
		ga_data.type = 'E' // 페이지뷰 : 'P', 이벤트 : 'E'
		// TODO : 빌링파트에서 아래 3개 파라미터확인 필요!!!
		ga_data.category = ''; // 카테고리명(전자상거래 이벤트일 경우 Ecommerce)
		ga_data.action = ''; // 액션명 (전자상거래 이벤트일 경우 해당 이벤트 단계명 ex) Click, Detail ...)
		ga_data.label = ''; // 라벨명
		SEND_GADATA_TO_APP()
	}
</script>
<!-- End Google Dimension -->
<script>
	if (isApp) {
		APP_PAGEVIEW();
	} else {
		WEB_PAGEVIEW();
	}
</script>
<!-- End Google Analytics -->

<!-- Google Tag Manager -->
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-K9Q8F7B');
</script>
<!-- End Google Tag Manager -->
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/jquery.scrollbar.css?v=13">
<style rel="stylesheet" type="text/css">
.chatbot-box-wrap .scroll-element.scroll-x {
	display: none !important;
}
</style>
<!-- Google reCaptcha -->
<script src="https://www.google.com/recaptcha/api.js" async="" defer=""></script>
<script
	src="https://waiting.tving.com:443/ts.wseq?opcode=5101&amp;nfid=0&amp;prefix=NetFunnel.gRtype=5101;&amp;sid=service_1&amp;aid=act_01&amp;js=yes&amp;1589953199530"></script>
</head>
<body>
	<!--[s] header -->
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/portal/js/common/page.base.js?v=13"></script>
	<!-- script type="text/javascript" src="https://image.tving.com/public_v6/static/common.ad-1.0.js?v=13"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/common.mi-1.0.js?v=13"></script -->
	<!-- template 용 handlebars.js (v4.1.2) 추가 -->
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/lib/handlebars/handlebars.js?v=13"></script>
	<!-- bxslider version up ( 2019-07-11 ) -->
	<script
		src="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.js?v=13"></script>
	<!-- 퍼블리싱 modernizr version 2.8.3 -->
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/lib/modernizr/modernizr.min.js?v=13"></script>
	<!-- 4.2.2 masonry -->
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/lib/masonry/masonry.pkgd.min.js?v=13"></script>

	<div id="wrap" class="page-membership">
		<header id="header" class="page-membership-login">
		<div id="top-gnb">
			<div class="top-wrap">
				<nav id="topUtil" class="top-util">
				<ul>
					<li><a href="<%=cp%>/itving/login.do">로그인</a></li>
					<li class="more_info"><a
						href="javascript:login();">이용권</a>
						</li>
				</ul>
				</nav>
			</div>
		</div>

		<script type="text/javascript">
		
			function login(){
				alert("로그인을 해주세요");
				return;
			}
		
		</script>

		<div id="gnb">
			<div class="inner-wrap">
				<h1><img onclick="javascript:location.href='<%=cp%>/itving/firstPage.do'" alt="" src="<%=cp%>/proj3/itving/logo2.jpg" width="300" height="20"/></h1>
				<nav id="gnbMenu" class="gnb-menu">
				<h2>
					<a href="javascript:login();" data-sub="#gnbChannel" data-nethru_clcode="A000002"
						class="nuxt-link-exact-active">게임</a>
				</h2>
				<h2>
					<a href="javascript:login();" data-sub="#gnbProgram" data-nethru_clcode="A000003">드라마</a>
				</h2>
				<h2>
					<a href="javascript:login();" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">예능</a>
				</h2>
				<h2>
					<a href="javascript:login();" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">스포츠</a>
				</h2>
				<h2>
					<a href="javascript:login();" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">영화</a>
				</h2>
				<h2>
					<a href="javascript:login();" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">커뮤니티</a>
				</h2>

				</nav>
			</div>
		</div>

		<script type="text/javascript">
			var Deploy = {
				year : new Date().getFullYear(),
				month : new Date().getMonth() + 1,
				day : new Date().getDate(),
				hour : new Date().getHours(),
				min : new Date().getMinutes(),
				checkDeployDate : function(targetDate) {
					var monthString = this.month < 10 ? '0'
							+ this.month.toString() : this.month.toString();
					var dayString = this.day < 10 ? '0' + this.day.toString()
							: this.day.toString();
					var hourString = this.hour < 10 ? '0'
							+ this.hour.toString() : this.hour.toString();
					var minString = this.min < 10 ? '0' + this.min.toString()
							: this.min.toString();
					var now = parseInt(this.year.toString() + monthString
							+ dayString + hourString + minString);
					return targetDate <= now;
				}
			}
		</script> 
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/static/common.search-1.0.js?v=13"></script>
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/billing/js/infra.billing.pc.js?v=13"></script>
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/static/lib/jquery/jquery.placeholders.min.js?v=13"></script>
		<script type="text/javascript"
			src="https://image.tving.com/public_v6/static/common.recommend-1.0.js?v=13"></script>

		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
		<script type="text/javascript">
			if (!wcs_add)
				var wcs_add = {};
			wcs_add["wa"] = "s_1b6ae80a204f";
			if (!_nasa)
				var _nasa = {};
			wcs.inflow("tving.com");
			wcs_do(_nasa);
		</script> <!--[e] header --> <!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-K9Q8F7B"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) --> <!--[s] contents --> <main>

		<script type="text/javascript">
		
			function sendIt(){
			
				var f = document.myForm;
				
				if(!f.id.value){
					alert("아이디를 입력하세요");
					f.id.focus();
					return;
				}

				if(!f.pwd.value){
					alert("비밀번호를 입력하세요");
					f.pwd.focus();
					return;
				}
				
				f.action = "<%=cp%>/itving/login_ok.do";
				f.submit();
			}
		</script>

		<form action="" method="post" name="myForm">

			<div class="inner-login-tving container">
				<div class="sub-contents-wrap inner-wrap">
					<div class="title-group">
						<h3>로그인</h3>
					</div>
					<section class="membership-login-box">
					<div class="membership-login-form">

						<div id="login01" class="tab-contents-login">
							<div class="login-form">
								<div class="input-delete">
									<label for="a"><input type="text" id="a" placeholder="아이디" autocomplete="off" name="id"></label>
								</div>
								<div class="input-delete">
									<label for="b"><input type="password" placeholder="비밀번호" autocomplete="off" id="b" name="pwd"></label>
								</div>
								<a href="javascript:sendIt();" id="doLoginBtn">로그인</a>
							</div>
							<div class="login-lnk cb">
								<div class="fr other">
									<a href="<%=cp%>/itving/signUp.do">회원가입</a> 
									<a href="<%=cp%>/itving/findId.do">아이디 찾기</a> 
									<a href="<%=cp%>/itving/findPwd.do">비밀번호 찾기</a>
								</div>
							</div>
						</div>
							<c:if test="${message != null }">
								<div align="center">
										<div colspan="2" align="center"><font color="red"><b>${message }</b></font></div>
								</div>
							</c:if>
						<div class="login-banner">
							<a href=""></a>
						</div>
					</div>
					</section>
				</div>
			</div>

		</form>

		</main> <!--[e] contents --> <!--[s] footer --> <!--[s] footer --> 
		<footer id="footer"> <section class="footer-top">
		<div class="inner-wrap">
			<dl class="footer-notice">
				<dt>공지사항</dt>       
 				<dd>[안내] 지금 아이티빙 가입 시 1개월 무료</dd>
			</dl>
		</div>
		</section>
	</div>
</body>
</html>