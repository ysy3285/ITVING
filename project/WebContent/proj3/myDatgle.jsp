<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" style=""
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<title>TVING｜마이티빙</title>
<meta name="Author" content="CJ ENM">
<meta name="description" content="마이티빙">

<!-- naver web master tool -->
<meta name="naver-site-verification"
	content="812a99b3ebc03f59de55c39007c877263955564c">


<!-- facebook -->
<meta property="fb:app_id" content="167597706623778">
<meta property="og:site_name" content="www.tving.com">
<meta property="og:title" content="TVING｜마이티빙">
<meta property="og:description" content="마이티빙">
<meta property="og:url" content="https://www.tving.com">
<meta property="og:image"
	content="https://image.tving.com/public_v6/portal/img/common/tving_log.jpg">

<meta property="og:type" content="video.other">
<meta property="og:video:type" content="application/x-shockwave-flash">
<meta property="og:video:url" content="/">
<meta property="og:video:width" content="1280">
<meta property="og:video:height" content="720">




<!-- twitter -->
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="TVING｜마이티빙">
<meta name="twitter:description" content="마이티빙">
<meta name="twitter:image"
	content="https://image.tving.com/public_v6/portal/img/common/tving_log.jpg">

<!-- mobile web alert -->
<link rel="“alternate”" href="“http://m.tving.com”">
<link rel="shortcut icon"
	href="https://image.tving.com/theme/tving_new/img/logo/favicon.ico"
	type="image/x-icon">







<link rel="stylesheet"
	href="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.css?v=108">
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/typography.css?v=108">
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/app.css?v=108">




<!--[if lt IE 9]>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/ie9/html5shiv.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/ie9/selectivizr.js?v=108"></script>
<![endif]-->

<script type="text/javascript" async=""
	src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=AW-931058540&amp;l=dataLayer&amp;cx=c"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
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



<script type="text/javascript">
	/*에디터에 아래 셋팅시 에러*/

	try {
		/*방송POD-BILL 결제연동 필요(창꺼지고 리플레쉬):박상조님*/
		document.domain = 'tving.com';
	} catch (e) {
	}

	var ctx = '';
	var cacheVersion = '108';
	var imageDomain = 'https://image.tving.com';
	var imageOriginDomain = 'https://image.tving.com';
	var publicDomain = 'https://image.tving.com';
	var serverDomain = 'https://www.tving.com';

	var user_yn = true;
	var user_adult_yn = true;
	var user_adult_confirm = true;
	var user_certified = true;
	var user_certtype = 'A3';

	var loginUrl = 'https://user.tving.com/pc/user/login.tving';
	var logoutUrl = 'https://user.tving.com/pc/user/doLogout.tving';

	var infraUserDomain = 'https://user.tving.com';
	var infraBillDomain = '//bill.tving.com';
	var userRegistUrl = 'https://user.tving.com/pc/user/regist.tving';
	var userCjMbrshYn = 'true';
	var v5Path = 'https://image.tving.com/public_v6';

	var global = {
		user_yn : user_yn,
		user_no : '129610346',
		cj_one_user_no : '9990000987181',

		user_id : 'ysy9528',
		user_nickname : '융스타',

		user_certtype : 'A3',
		user_fb_token : '',
		user_tw_token : '',
		media_code : '',
		menu_code : '',
		category_code : '',
		smr_station_no : '',
		smr_category_code : '',
		v5Path : 'v5Path',
		isEnableCache : false,
		tvingChatRoom : 'TVING',
		olang : 'dsE54QmzZbP1ke3ZS1GSHQ==',
		body :

		null

	};
</script>

<!-- Google Tag Manager dataLayer for global header -->
<script>
	var gaTvingToken = $.cookie('_tving_token') == null ? '' : $
			.cookie('_tving_token');
	var gaValue = '';
	var userId = 'ysy9528';
	var userType = '10';
	var legalBirthday = '19950208';
	var gender = 'F';
	var resLoginType = 'U';
	var resCjMbrshYn = 'U';
	var resLoginYn = 'Y';
	var resSite = 'TVING'; // ê³ ì 

	var resUserTypeJson = $.cookie('GA360_USERTYPE_JSON') == null ? '' : JSON
			.parse($.cookie('GA360_USERTYPE_JSON'));

	var gdm009 = resUserTypeJson['dm009_usertype'] == null ? 'U'
			: resUserTypeJson['dm009_usertype']; //dm009:ê³ ê°ì í(ë©í°) - A,B,C,AD,BD,CD,D,N,U
	var gdm013 = resUserTypeJson['dm013_resIsPaid'] == null ? 'U'
			: resUserTypeJson['dm013_resIsPaid']; //dm013:ì ë£/ë¬´ë£ êµ¬ë¶ - ì ë£(P), ë¬´ë£(F), ë¹ë¡ê·¸ì¸(U)
	var gdm016 = resUserTypeJson['dm016_TL_FYMD'] == null ? ''
			: resUserTypeJson['dm016_TL_FYMD']; //dm016:í°ë¹ë¬´ì í ìµì´ê°ìì¼ - YYMMDD
	var gdm017 = resUserTypeJson['dm017_TL_CYMD'] == null ? ''
			: resUserTypeJson['dm017_TL_CYMD']; //dm017:í°ë¹ë¬´ì í ìµì¢í´ì§ì¼ - YYMMDD
	var gdm018 = resUserTypeJson['dm018_LP_FYMD'] == null ? ''
			: resUserTypeJson['dm018_LP_FYMD']; //dm018:ë¬´ì ííë¬ì¤ ìµì´êµ¬ë§¤ì¼ - YYMMDD
	var gdm019 = resUserTypeJson['dm019_paycnt'] == null ? ''
			: resUserTypeJson['dm019_paycnt']; //dm019:ìíêµ¬ë§¤ - ì ê¸° ê²°ì ì°¨ì(ë©í°)
	var gdm020 = resUserTypeJson['dm020_LP_CYMD'] == null ? ''
			: resUserTypeJson['dm020_LP_CYMD']; //dm020:ë¬´ì ííë¬ì¤ ìµì¢í´ì§ì¼ - YYMMDD
	var gdm021 = resUserTypeJson['dm021_MP_FYMD'] == null ? ''
			: resUserTypeJson['dm021_MP_FYMD']; //dm021:ë¬´ë¹íë¦¬ë¯¸ì ìµì´êµ¬ë§¤ì¼ - YYMMDD
	var gdm022 = resUserTypeJson['dm022_MP_CYMD'] == null ? ''
			: resUserTypeJson['dm022_MP_CYMD']; //dm022:ë¬´ë¹íë¦¬ë¯¸ì ìµì¢í´ì§ì¼ - YYMMDD

	var resIsPaid = (gdm013 != null) ? gdm013 : "U";

	if ($.cookie('_ga')) {
		var gaArray = $.cookie('_ga').split('.');
		gaValue = gaArray[2] + '.' + gaArray[3];
	}
	if (userType == '10' || userType == '30' || userType == '40') {
		if (userCjMbrshYn == 'true') {
			resLoginType = 'CJ ONE';
		} else if (userCjMbrshYn == 'false') {
			resLoginType = 'TVING';
		}
	} else if (userType == '91') {
		resLoginType = 'FACEBOOK'; // facebook
	} else if (userType == '92') {
		resLoginType = 'TWITTER'; // twitter
	}

	//dm005
	var ageRange = 'U';
	if (userId) {
		var d = new Date();
		var year = d.getFullYear();
		//var age2 = moment().format('YYYY') - moment(legalBirthday, "YYYYMMDD").format('YYYY');
		if (legalBirthday.length > 4) {
			var age = Number(year) - Number(legalBirthday.substr(0, 4));
			switch (true) {
			case (0 <= age && age <= 19):
				ageRange = 'A';
				break;
			case (20 <= age && age <= 29):
				ageRange = 'B';
				break;
			case (30 <= age && age <= 39):
				ageRange = 'C';
				break;
			case (40 <= age && age <= 49):
				ageRange = 'D';
				break;
			case (50 <= age && age <= 59):
				ageRange = 'E';
				break;
			case (60 <= age):
				ageRange = 'F';
				break;
			default:
				ageRange = 'N';
				break;
			}
		} else {
			ageRange = 'N';
		}
	}
	//dm007
	var genderRange = 'C';
	if (userId) {
		switch (gender) {
		case 'M':
			genderRange = 'A';
			break;
		case 'F':
			genderRange = 'B';
			break;
		default:
			genderRange = 'N';
			break;
		}
	}

	//dm009
	var userPayType = $.cookie('USER_PAY_TYPE') || 'U';

	//dm016, dm017, dm018
	var gaCurrentRecurpayDate = '';
	var gaCurrentYear = '';
	var gaCurrentMonth = '';
	var gaCurrentDay = '';
	if ($.cookie('CURRENT_RECURPAY_DATE')) {
		gaCurrentRecurpayDate = $.cookie('CURRENT_RECURPAY_DATE').replace(
				/"/gi, '');
		if (gaCurrentRecurpayDate) {
			gaCurrentYear = gaCurrentRecurpayDate.substr(0, 4);
			gaCurrentMonth = gaCurrentRecurpayDate.substr(4, 2);
			gaCurrentDay = gaCurrentRecurpayDate.substr(6, 2);
		}
	}

	if (userCjMbrshYn == 'true') {
		resCjMbrshYn = 'O';
	} else if (userCjMbrshYn == 'false') {
		resCjMbrshYn = 'X';
	} else {
		// ë¹ë¡ê·¸ì¸ì
		resAge = "U";
		resSex = "C";
		resLoginYn = 'N'
		resIsPaid = 'U';
	}

	dataLayer = [ {
		'dm001' : gaTvingToken,
		'dm002' : resCjMbrshYn,
		'dm003' : resLoginYn,
		'dm004' : resLoginType,
		'dm005' : ageRange,
		'dm007' : genderRange,
		'dm009' : gdm009,
		'dm011' : 'TVING',
		'dm012' : 'PC WEB' //MO WEB
		,
		'dm013' : resIsPaid,
		'dm014' : 'TVING',
		'dm015' : gaValue,
		'dm016' : gdm016,
		'dm017' : gdm017,
		'dm018' : gdm018,
		'dm019' : gdm019,
		'dm020' : gdm020,
		'dm021' : gdm021,
		'dm022' : gdm022
	} ];

	//console.log(dataLayer);
</script>
<!-- End Google Tag Manager Data Layer -->

<!-- Google Analytics -->
<script>
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
	ga('set', 'userId', gaTvingToken);
	ga('set', 'dimension1', gaTvingToken);
	ga('set', 'dimension2', resCjMbrshYn);
	ga('set', 'dimension3', resLoginYn);
	ga('set', 'dimension4', resLoginType);
	ga('set', 'dimension5', ageRange);
	ga('set', 'dimension7', genderRange);
	ga('set', 'dimension9', userPayType);
	ga('set', 'dimension11', 'TVING');
	ga('set', 'dimension12', 'PC WEB');
	ga('set', 'dimension13', resIsPaid);
	ga('set', 'dimension14', 'TVING');
	ga('set', 'dimension15', gaValue);
	ga('set', 'dimension16', gdm016);
	ga('set', 'dimension17', gdm017);
	ga('set', 'dimension18', gdm018);
	ga('set', 'dimension19', gdm019);
	ga('set', 'dimension20', gdm020);
	ga('set', 'dimension21', gdm021);
	ga('set', 'dimension22', gdm022);
</script>

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
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'AW-702011905');
</script>

<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/chatbot.css">
<link rel="stylesheet" type="text/css"
	href="https://image.tving.com/public_v6/portal/css/jquery.scrollbar.css?v=108">
<style>
.chatbot-box-wrap .scroll-element.scroll-x {
	display: none !important;
}
</style>

<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/702011905/?random=1590022540315&amp;cv=9&amp;fst=1590022540315&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;eid=376635471&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=6&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oa5e1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.tving.com%2Fmy%2Fmain&amp;ref=https%3A%2F%2Fwww.tving.com%2Fmy%2Fuser%2FconfirmPassword.do%3FreturnUrl%3D%2Fmy%2Fuser%2FmodifyProfile.do&amp;tiba=TVING%EF%BD%9C%EB%A7%88%EC%9D%B4%ED%8B%B0%EB%B9%99&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
<style id="vuescroll-silde-mode-style" type="text/css">
@
-webkit-keyframes loading-rotate {to { -webkit-transform:rotate(1turn);
	transform: rotate(1turn);
}

}
@
keyframes loading-rotate {to { -webkit-transform:rotate(1turn);
	transform: rotate(1turn);
}

}
@
-webkit-keyframes loading-wipe { 0% {
	stroke-dasharray: 1, 200;
	stroke-dashoffset: 0;
}

50%
{
stroke-dasharray










:





 





90,
150;
stroke-dashoffset










:





 





-40
px










;
}
to {
	stroke-dasharray: 90, 150;
	stroke-dashoffset: -120px;
}

}
@
keyframes loading-wipe { 0% {
	stroke-dasharray: 1, 200;
	stroke-dashoffset: 0;
}

50%
{
stroke-dasharray










:





 





90,
150;
stroke-dashoffset










:





 





-40
px










;
}
to {
	stroke-dasharray: 90, 150;
	stroke-dashoffset: -120px;
}

}
.__vuescroll .__refresh, .__vuescroll .__load {
	position: absolute;
	width: 100%;
	color: black;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 16px;
}

.__vuescroll .__refresh svg, .__vuescroll .__load svg {
	margin-right: 10px;
	width: 25px;
	height: 25px;
	vertical-align: sub;
}

.__vuescroll .__refresh svg.active, .__vuescroll .__load svg.active {
	transition: all 0.2s;
}

.__vuescroll .__refresh svg.active.deactive, .__vuescroll .__load svg.active.deactive
	{
	transform: rotateZ(180deg);
}

.__vuescroll .__refresh svg path, .__vuescroll .__refresh svg rect,
	.__vuescroll .__load svg path, .__vuescroll .__load svg rect {
	fill: #20a0ff;
}

.__vuescroll .__refresh svg.start, .__vuescroll .__load svg.start {
	stroke: #343640;
	stroke-width: 4;
	stroke-linecap: round;
	-webkit-animation: loading-rotate 2s linear infinite;
	animation: loading-rotate 2s linear infinite;
}

.__vuescroll .__refresh svg.start .bg-path, .__vuescroll .__load svg.start .bg-path
	{
	stroke: #f2f2f2;
	fill: none;
}

.__vuescroll .__refresh svg.start .active-path, .__vuescroll .__load svg.start .active-path
	{
	stroke: #20a0ff;
	fill: none;
	stroke-dasharray: 90, 150;
	stroke-dashoffset: 0;
	-webkit-animation: loading-wipe 1.5s ease-in-out infinite;
	animation: loading-wipe 1.5s ease-in-out infinite;
}
</style>
<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/931058540/?random=1590022540626&amp;cv=9&amp;fst=1590022540626&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=6&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oa5e1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.tving.com%2Fmy%2Fmain&amp;ref=https%3A%2F%2Fwww.tving.com%2Fmy%2Fuser%2FconfirmPassword.do%3FreturnUrl%3D%2Fmy%2Fuser%2FmodifyProfile.do&amp;tiba=TVING%EF%BD%9C%EB%A7%88%EC%9D%B4%ED%8B%B0%EB%B9%99&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
<script type="text/javascript">

			function logout(){
		
				f = document.myForm;
		
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
</head>
<body data-n-head="">

	<script type="text/javascript"
		src="https://image.tving.com/public_v6/portal/js/my/page.mytving.common.js?v=108"></script>
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/lib/jquery/jquery.history.js?v=108"></script>




	<div id="layer-share" class="layer-wrapper" style="display: none;">
		<div class="layer-share-list">
			<a href="javascript:void(0);" class="share-facebook fb">facebook</a>
			<a href="javascript:void(0);" class="share-twitter tw">twitter</a>
		</div>
	</div>

	<div id="wrap" class="page-mytving">
		<div id="skipNavigationWrap">
			<a href="#gnbSearch">검색 바로가기</a> <a href="#container">본문 바로가기</a>
		</div>


		<!--[s] header -->
		<header id="header" class="page-my-main">
		<form action="" method="post" name="myForm">
			<div id="top-gnb">
				<div class="top-wrap">
					<nav id="topUtil" class="top-util">
					<ul>

						<!-- 퍼블리싱 미적용코드S -->
						<li class="login_member"><a href="<%=cp%>/itving/myPage.do"><font
								color="pink">${sessionScope.customInfo.name }</font> 님 환영합니다.</a>

							<div class="gnb-hover-menu"
								style="margin-left: -50px; visibility: visible; display: none;">
								<a href="<%=cp%>/itving/myPage.do">마이아이티빙</a> <a
									href="javascript:logout();">로그아웃</a>
							</div></li>
						<!-- 퍼블리싱 미적용코드E -->


						<li class="more_info"><a href="<%=cp%>/itving/pass.do"
							data-nethru_clcode="A000010">이용권</a>
							<div class="gnb-hover-menu"
								style="display: none; margin-left: -50px; visibility: visible;">
								<a href="<%=cp%>/itving/pass.do" data-nethru_clcode="A000010">이용권</a>
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
					<a href="<%=cp%>/itving/videoList.do?category=게임">게임</a>
				</h2>

				<h2>
					<a href="<%=cp%>/itving/videoList.do?category=드라마">드라마</a>
				</h2>

				<h2>
					<a href="<%=cp%>/itving/videoList.do?category=예능">예능</a>
				</h2>

				<h2>
					<a href="<%=cp%>/itving/videoList.do?category=스포츠">스포츠</a>
				</h2>

				<h2>
					<a href="<%=cp%>/itving/videoList.do?category=영화">영화</a>
				</h2>

				<h2>
					<a href="<%=cp%>/itving/boardlist.do" data-sub="#gnbMusic">커뮤니티</a>
				</h2>

				<c:if test="${sessionScope.customInfo.id == 'admin' }">
					<h2>
						<a href="<%=cp%>/itving/videoUpload.do">영상 업로드</a>
					</h2>
				</c:if> </nav>

			</div>
		</div>
		</header>
		<!--[e] header -->

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
				var requestUri = "/my/main";
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
					logout('http%3A%2F%2Fwww.tving.com%2Fmain.do');
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
									var requestUri = "/my/main";
									if (((requestUri.indexOf('player') == -1) || (requestUri
											.indexOf('pick') >= 0))
											&& (requestUri.indexOf('/main.do') == -1)) {
										var $onDom = $("#header .gnb-sub a[href='"
												+ "/my/main" + "']");

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
		<div id="contents-wrap" class="inner-favorite container">



			<script type="text/javascript">
				var global = {

					user_no : '129610346',
					user_id : 'ysy9528',

					user_fb_token : '',
					user_tw_token : ''
				};
			</script>

			<div class="section-mytving-top">
				<div class="inner-wrap">
					<div class="mytving-top-left">
						<h2>마이티빙</h2>
						<strong class="mytving-id" id="NICKNAME">
							${sessionScope.customInfo.name } <span>님</span>
						</strong>
						<div class="mytving-ticket">
							<p>${rank }</p>

						</div>

					</div>
					<div class="mytving-top-right">
						<a href="<%=cp%>/itving/pwCheck.do" title="회원정보수정"
							class="myinfo-modify">회원정보 수정</a> <small>|</small> <a
							href="<%=cp%>/itving/customDelete.do" title="회원탈퇴"
							class="myinfo-modify">회원 탈퇴</a>
					</div>
				</div>
			</div>

			<script type="text/javascript"
				src="https://image.tving.com/public_v6/portal/js/my/page.mytving.personal.js?v=108"></script>
			<script type="text/javascript">
				$(function() {
					myTvingPersonal.getBillInfo();
					myTvingPersonal.getTicketInfo();
					myTvingPersonal.changeTvingMode('');
					myTvingPersonal.changeDisplayMenu();

					setTimeout(scriptjs, 1);
					commonScript.dataEvent();
				});
			</script>

			<!-- [style] -->
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/portal/js/style/page.style.common.js?v=108"></script>
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/portal/js/style/cj_gallery.js?v=108"></script>
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/portal/js/common/style_common.js?v=108"></script>
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/static/common.flash.feedplayer-1.1.js?v=108"></script>
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/static/common.player.logger-1.0.js?playerType=W0100?v=108"></script>
			<!-- for html5 player -->
			<link rel="stylesheet"
				href="https://image.tving.com/public_v6/portal/html5_player/new/css/tving.player-ui.css?v=108">
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/portal/html5_player/new/js/tving.player.js?v=108"></script>
			<script type="text/javascript"
				src="https://image.tving.com/public_v6/portal/html5_player/new/js/tving.player-ui.js?v=108"></script>



			<div class="sub-contents-wrap inner-wrap">


				<div class="tab_type01">
					<ul>
						<li><a href="<%=cp%>/itving/myPage.do">찜</a></li>
						<small>|</small>
						<li><a href="<%=cp%>/itving/myBoard.do">내 글 보기</a></li>
						<small>|</small>
						<li><a href="<%=cp%>/itving/myBoard.do" class="on">내 댓글
								보기</a></li>
					</ul>
				</div>

				<div class="tab-second-block cb">

					<div id="EXCD0185">
						<section class="lists">
						<h2 class="section-title">내 댓글 보기</h2>
						<table class="tbl-list normal">
							<br />

							<thead>
								<tr>
									<th scope="col" style="font-size: 12pt;">번호</th>
									<th scope="col" class="" style="font-size: 12pt;"
										align="center">댓글</th>
									<th scope="col" style="font-size: 12pt;">&nbsp;</th>
									<th scope="col" style="font-size: 12pt;">작성일</th>
								</tr>
							</thead>
							<tbody id="contents-list">
								<c:forEach var="dto" items="${dglists }">
									<tr>
										<td style="font-size: 10pt;"><span>${dto.dat_num }</span></td>
										<td style="font-size: 10pt;" align="center">${dto.content }</td>
										<td class="title" style="font-size: 10pt;" align="right">
											<a class="bold"
											href="${articleURL }&re_num=${dto.dat_renum }">원 글 보기</a>
										<td style="font-size: 10pt;">${dto.dat_date }</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div id="contents-paging" class="paging">
							<c:if test="${ dataCount!=0}">
						${pageIndexList }			
						</c:if>
							<c:if test="${ dataCount==0}">
						등록된 게시물이 없습니다.
						</c:if>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>

		<article class="guid-knowledge">
		<h5>
			<span class="ico-announce">!</span> 알아두세요!
		</h5>
		<div class="guid-text">
			<p>
				<span class="bull">•</span> 종료된 콘텐츠는 노출되지 않습니다.
			</p>

		</div>
		</article>

		<div id="div_more" style="display: none;">
			<a href="javascript:" class="btn-data-more" id="moreList"><span>더보기</span></a>
		</div>
	</div>

	</div>

	<script id="mytvingFavoriteList_P_Template"
		type="text/x-handlebars-template">
					{{#each list}}
						<li data-page-no="{{pageNo}}">
						    <a href="{{linkUrl}}">
						        <div class="thumb">
						            <img src="{{imageUrl}}" height="272" alt="{{title}}" onerror="onErrorVerticalImage(this)" class="image-cover">
						            <input type="checkbox" id="{{id}}" class="check-basic" value="{{programCode}}">
									<label for="{{id}}" class="check-basic-label">Check</label>
						        </div>
						        <div class="caption">
						        	{{#if isAdult}}
						    			<span class="adult19"><img src="{{publicDomain}}/public_v6/portal/css/img/adult19.png"></span>
						    		{{/if}}
						        	{{~title~}}
						       	</div>
						    </a>
						</li>
					{{/each}}
</script>
	<script id="mytvingFavoriteList_M_Template"
		type="text/x-handlebars-template">
					{{#each list}}
						<li data-page-no="{{pageNo}}">
						    <a href="{{linkUrl}}">
						        <div class="thumb">
									{{{movieTaggingHtml}}}
						            <img src="{{imageUrl}}" height="272" alt="{{title}}" onerror="onErrorVerticalImage(this)" class="image-cover">
						            <input type="checkbox" id="{{id}}" class="check-basic" value="{{movieCode}}">
									<label for="{{id}}" class="check-basic-label">Check</label>
						        </div>
						        <div class="caption">
						        	{{~title~}}
						       	</div>
						    </a>
						</li>
					{{/each}}					
</script>
	<script id="mytvingFavoriteList_L_Template"
		type="text/x-handlebars-template">
	{{#each list}}
		<li data-page-no="{{pageNo}}" class="{{landscapeCss}}">
		    <a href="{{linkUrl}}">
		        <div class="thumb">
					<span class="music-playlist-item__image-list">{{clipCount}}</span>
					<svg class="blur-ie">
						<def><filter id="blur"><feGaussianBlur stdDeviation="100"></feGaussianBlur></filter></def>
						<image href="{{imgUrl}}" width="180" height="180" filter="url(#blur)" />
					</svg>
					<img src="{{imgUrl}}" alt="{{playlistName}}" class="image-cover" onError="onErrorHorizontalImage(this)"/>
				{{#if imgAuto}}
					<span class="image-cover-landscape">
						<img src="{{imgUrl}}" alt="{{playlistName}}" onError="onErrorHorizontalImage(this)" />
					</span>
				{{/if}}
					<input type="checkbox" id={{recommendId}} class="check-basic" value="{{playlistId}}">
					<label for="{{recommendId}}" class="check-basic-label">Check</label>
		        </div>
		        <div class="caption">
		        	{{playlistName}}
		       	</div>
		    </a>
		</li>
	{{/each}}
</script>
	<!--[e] contents -->
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/portal/js/my/page.mytving.favorite.js?v=108"></script>
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/jarvis.music-1.0.js?v=108"></script>
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/static/ofi.min.js?v=108"></script>
	<script type="text/javascript"
		src="https://image.tving.com/public_v6/portal/js/music/page.music.common.js?v=108"></script>

	<script type="text/javascript">
		$(function() {
			var tab = ("") ? "" : "program";
			var subTabType = "";
			subTabType = getParameter(location.hash.split('#').pop(), 'id')
					|| '';
			if (subTabType != '') {
				tab = subTabType;
			}
			myTvingFavorite.init(tab);
		});

		function continuePlay() {
			StyleCommon.continuePlay();
		}
	</script>
	</main>






	<!--[s] footer -->
	<footer id="footer">

	<div class="inner-wrap">
		<dl class="footer-notice">
			<dt>공지사항</dt>
			<dd>[안내] 지금 아이티빙 가입 시 1개월 무료</dd>
		</dl>
	</div>
	<!--[e] footer -->
</body>
</html>