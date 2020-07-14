<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko"><head>
    <title>아이티빙 | 이용권구매</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="stylesheet" type="text/css" href="<%=cp %>/proj3/css/billing.css">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-K9Q8F7B"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" src="https://image.tving.com/public_v4/portal/js/common/wl6.js"></script><script type="text/javascript" src="/public/js/common/jquery-1.11.0.js"></script>
<script type="text/javascript" src="/public/js/common/jquery.cookie-1.4.0.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/beta.fix.js"></script>
<script type="text/javascript" src="/public_v4/static/lib/momentjs/moment.min.js"></script>
<script type="text/javascript" src="/public_v4/static/lib/momentjs/moment.lang.ko.js"></script>
<script type="text/javascript" src="/pc/bill/js/jquery.autotab-1.1b.js"></script>
<script type="text/javascript" src="/pc/bill/js/billing.js?v=150629"></script>
<script type="text/javascript" src="/public/js/bill/paymentMobile.js"></script>
<script type="text/javascript" src="/public/js/json2.js"></script>
<script type="text/javascript">
	(function() {
			var nl = document.createElement('script'); nl.type = 'text/javascript';
			nl.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'image.tving.com/public_v4/portal/js/common/wl6.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(nl, s);
			var done = false;

			nl.onload = nl.onreadystatechange = function() {

    		if ( !done && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") ) {

        		done = true;

        		_n_sid = "tving_web";    //pc 웹 : tving_web , Mobile웹: tving_mweb, MobileApp : tving_app과 같은 형태로 지정  

        		_n_uid_cookie = "_tving_token";

        		n_logging();

        		nl.onload = nl.onreadystatechange = null;
		    }
	
		}
	})();



	
var userAgent = navigator.userAgent;
if( userAgent.indexOf("Chrome/") > -1){
	var agentIdx = userAgent.indexOf("Chrome/") + "Chrome/".length;

	if(userAgent.substring(agentIdx,agentIdx+2) > 79){
		var token1 = $.cookie('_tving_token');
		var time = new Date();
		time.setDate(time.getDate()-1);
		document.cookie = "_tving_token='';expires="+ time.toGMTString() + ";"; 
	
		if (document.location.protocol == 'https:') {
			document.cookie = '_tving_token=' + encodeURIComponent($.cookie('_tving_token')) + '; SameSite=None; Secure';
			var token2 = $.cookie('_tving_token');
			if ( (token1 || "" ) != "" && token1 != token2 ) {
				if ( document.URL.indexOf("pc/bill/upSellingNotice") > -1 ) {
			    	document.location.href = document.referrer;
				}
				else {
			    	document.location.reload();
				}
			}
		}
	}
}


	
</script>

<!-- Global site tag (gtag.js) - Google AdWords: 931058540 구글전환스크립트삽입 -->
<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-931058540"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-931058540');
</script>


<script type="text/javascript">

    var requestUri = '/pc/bill/recurpay_page.tving';
    var http_url_tving = 'http://www.tving.com';
    var https_url_tving = http_url_tving.replace('http://','https://');
    var http_url_local = 'http://bill.tving.com';
    var https_url_local = http_url_local.replace('http://','https://');

            var user_yn = true;
    
    /**
     * 브라우저별 사이즈를 조정한다.
     */
    function resizePopup( nWidth, nHeight ) {

        var thisX = parseInt( nWidth );
        var thisY = parseInt( nHeight );
        var maxThisX = screen.width - 50;
        var maxThisY = screen.height - 50;
        var marginY = 0;
        var marginX = 16;

        var userAgent = navigator.userAgent;
        // Opera 에서는 ResizeTo 함수가 동작하지 않음
        if ( userAgent.indexOf( "Opera" ) > -1 ) {
            return false;
        }

        if ( userAgent.indexOf( "MSIE 6" ) > -1 )
            marginY = 72; // IE 6.x
        else if ( userAgent.indexOf( "MSIE 7" ) > -1 )
            marginY = 72; // IE 7.x
        else if ( userAgent.indexOf( "MSIE 8" ) > -1 )
            marginY = 72; // IE 8.x
        else if ( userAgent.indexOf( "MSIE 9" ) > -1 || userAgent.indexOf("MSIE 10") > -1 )
            marginY = 65; // IE 9.x
        else if ( userAgent.indexOf( "Firefox" ) > -1 )
            marginY = 70; // FF
        else if ( userAgent.indexOf( "Netscape" ) > -1 )
            marginY = -2; // Netscape
        else if ( userAgent.indexOf( "Chrome" ) > -1 )
            marginY = 64; // Chrome
        else if ( userAgent.indexOf( "Safari" ) > -1 )
            marginY = 20; // Safari

        if ( thisX > maxThisX ) {
            thisX = maxThisX;
        }

        if ( userAgent.indexOf("MSIE 6") > -1 ) {
            marginX = -8;
        }

        if ( thisY > maxThisY - marginY ) {
            thisX += 19;
            thisY = maxThisY - marginY;
        }

        var moveY = 0;
        var moveX = (maxThisX - (thisX + marginX))/2;
        if(thisY <= maxThisY){
            moveY = (maxThisY-(thisY + marginY))/2;
        }

        try {
            window.moveTo( moveX, moveY );
        } catch (e) { }

        setTimeout(function(){
            $( "#div.wrap" ).width(thisX + marginX);
            $( "#div.wrap" ).height(thisY + marginX);
            window.resizeTo( thisX + marginX, thisY + marginY );
        },100);
    }

</script>

<!-- Google Analytics -->
<!-- Google Dimension -->
<script>
	var isApp = false;
	var oVisitor = {USER_AGENT : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',DEVICE : 'etc',OS : '',IP : '1.234.209.30'};
	var cjMbrshYn = 'Y';
	var custTyp = '10';
	var age = '19950208';
	var sex = 'F';
	var currentHost = location.href;
	var resCjMbrshYn = 'U';
	var resUserId = $.cookie('_tving_token') == null ? '' : $.cookie('_tving_token');
	var resLoginYn = 'Y';
	var resLoginType = 'U';	// 회원 유형
	var resSite = 'TVING';  // 고정
	var resChannelType = ""; // 채널 유형
	var resChildSite = "TVING"; // TVING, TVN, OTVN ...
	var resCID = $.cookie('_ga') == null ? '' : $.cookie('_ga'); // CID 명(_ga 쿠키)
	var resAge = "N";
	var resSex = "N";
	var resUserTypeJson = $.cookie('GA360_USERTYPE_JSON') == null ? '' : JSON.parse($.cookie('GA360_USERTYPE_JSON'));
		
	var gdm009 = resUserTypeJson['dm009_usertype'] == null ? 'U' : resUserTypeJson['dm009_usertype'];		//dm009:고객유형(멀티) - A,B,C,AD,BD,CD,D,N,U
	var gdm013 = resUserTypeJson['dm013_resIsPaid'] == null ? 'U' : resUserTypeJson['dm013_resIsPaid'];		//dm013:유료/무료 구분 - 유료(P), 무료(F), 비로그인(U)
	var gdm016 = resUserTypeJson['dm016_TL_FYMD'] == null ? '' : resUserTypeJson['dm016_TL_FYMD'];			//dm016:아이티빙무제한 최초가입일 - YYMMDD
	var gdm017 = resUserTypeJson['dm017_TL_CYMD'] == null ? '' : resUserTypeJson['dm017_TL_CYMD'];			//dm017:아이티빙무제한 최종해지일 - YYMMDD
	var gdm018 = resUserTypeJson['dm018_LP_FYMD'] == null ? '' : resUserTypeJson['dm018_LP_FYMD'];			//dm018:무제한플러스 최초구매일 - YYMMDD
	var gdm019 = resUserTypeJson['dm019_paycnt'] == null  ? '' : resUserTypeJson['dm019_paycnt'];			//dm019:상품구매 - 정기 결제차수(멀티)
	var gdm020 = resUserTypeJson['dm020_LP_CYMD'] == null ? '' : resUserTypeJson['dm020_LP_CYMD'];			//dm020:무제한플러스 최종해지일 - YYMMDD
	var gdm021 = resUserTypeJson['dm021_MP_FYMD'] == null ? '' : resUserTypeJson['dm021_MP_FYMD']; 			//dm021:무비프리미엄 최초구매일 - YYMMDD
	var gdm022 = resUserTypeJson['dm022_MP_CYMD'] == null ? '' : resUserTypeJson['dm022_MP_CYMD'];			//dm022:무비프리미엄 최종해지일 - YYMMDD
	
	var resIsPaid = (gdm013 != null)? gdm013 : "U";
	
	if(custTyp == '10' || custTyp == '30' || custTyp == '40'){
		if(cjMbrshYn == 'Y'){
			resLoginType = 'CJ ONE';
		}
		else if(cjMbrshYn == 'N'){
			resLoginType = 'TVING';
		}
		// 40 : Test 계정
	}
	else if(custTyp == '91'){
		resLoginType = 'FACEBOOK';	// facebook
	}
	else if(custTyp == '92'){
		resLoginType = 'TWITTER';	// twitter
	}
	
	if(isApp) {
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
    }
	else{
		if(currentHost.indexOf('/pc/') != -1) {
			resChannelType = 'PC WEB';
		}
		else if(currentHost.indexOf('/pc/') == -1) {
			resChannelType = 'MO WEB';
		}
	}
	
	if(resCID != ""){
		// _ga = GA1.2.958498282.1528764948;
		var cid = resCID.split(".");
		resCID = cid[2] + "." + cid[3]; // 고유사용자 식별값 + "." + 사용자가 웹사이트에처음 방문한 때의 타임스탬프
	}
	
	
	if(age != null && age != ""){
		age = parseInt(moment().format('YYYY')) -  parseInt(moment(age, 'YYYYMMDD').format('YYYY'));
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
	
	if(sex != null && sex != ""){
		if(sex == 'M'){
			resSex = 'A';
		}
		else if(sex == 'F'){
			resSex = 'B';
		}
		else{
			resSex = 'N';
		}
	}
	
	if(cjMbrshYn == 'Y'){
		resCjMbrshYn = 'O';
	}
	else if(cjMbrshYn == 'N'){
		resCjMbrshYn = 'X';
	}
	else{
		// 비로그인시
		resAge = "U";
		resSex = "C";
		resLoginYn = 'N'
		resIsPaid = 'U';
	}
	
	// GA DATA for GoogleTagmanager 
	dataLayer = [{
		'dm001' : resUserId			// 고객_고유번호(_tving_token)
		,'dm002' : resCjMbrshYn		// 고객_통합회원여부(O / X / U : 비로그인)
		,'dm003' : resLoginYn		// 고객_로그인여부(Y : 로그인 / N : 비로그인)
		,'dm004' : resLoginType		// 고객_회원유형(CJ ONE / TVING / FACEBOOK / TWITTER / U)
		,'dm005' : resAge			// 고객_연령(A:10대이하, B:20대, C:30대, D:40대, E:50대, F:60대이상, N:알수없음, U:비로그인)
		,'dm007' : resSex			// 고객_성별(A:남자, B:여자, C:비로그인, N:알수없음)
		,'dm009' : gdm009			// 고객유형(멀티) - A,B,C,AD,BD,CD,D,N,U
		,'dm011' : resSite			// 사이트명(TVING으로 고정, 영문대문자 표기)
		,'dm012' : resChannelType	// 채널 유형(PC WEB / MO WEB / APP / TABLET / AOS TV)
		,'dm013' : resIsPaid		// 유무료_회원여부(P:유료, F:무료, U:비로그인)
		,'dm014' : resChildSite		// 하위 사이트명(TVING / TVN / OGN …)
		,'dm015' : resCID			// CID 명(515627205.1526369222 / …  _ga쿠키값)
		,'dm016' : gdm016			// 아이티빙무제한 최초가입일 - YYMMDD
		,'dm017' : gdm017			// 아이티빙무제한 최종해지일 - YYMMDD
		,'dm018' : gdm018			// 무제한플러스 최초구매일 - YYMMDD
		,'dm019' : gdm019			// 상품구매 - 정기 결제차수(멀티)
		,'dm020' : gdm020			// 무제한플러스 최종해지일 - YYMMDD
		,'dm021' : gdm021			// 무비프리미엄 최초구매일 - YYMMDD
		,'dm022' : gdm022			// 무비프리미엄 최종해지일 - YYMMDD
	}];
	
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
	
	function WEB_PAGEVIEW(){
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-118660069-1', 'auto');
		ga('set','userId', resUserId); 				//UserID 설정
		ga('set','dimension1', resUserId);	        //고객_고유번호
		ga('set','dimension2', resCjMbrshYn);		//고객_통합회원여부
		ga('set','dimension3', resLoginYn);			//고객_로그인여부
		ga('set','dimension4', resLoginType);		//고객_회원유형
		ga('set','dimension5', resAge);				//고객_연령
		ga('set','dimension7', resSex);				//고객_성별
		ga('set','dimension9', gdm009);				//고객유형(멀티) - A,B,C,AD,BD,CD,D,N,U
		ga('set','dimension11', resSite);			//사이트명
		ga('set','dimension12', resChannelType);	//채널 유형
		ga('set','dimension13', resIsPaid);			//유무료_회원여부
		ga('set','dimension14', resChildSite);		//하위 사이트명
		ga('set','dimension15', resCID);			//CID 명
		ga('set','dimension16', gdm016);		 	//아이티빙무제한 최초가입일 - YYMMDD
		ga('set','dimension17', gdm017);			//아이티빙무제한 최종해지일 - YYMMDD
		ga('set','dimension18', gdm018);			//무제한플러스 최초구매일 - YYMMDD
		ga('set','dimension19', gdm019);		    //상품구매 - 정기 결제차수(멀티)
		ga('set','dimension20', gdm020);		 	//무제한플러스 최종해지일 - YYMMDD
		ga('set','dimension21', gdm021);			//무비프리미엄 최초구매일 - YYMMDD
		ga('set','dimension22', gdm022);			//무비프리미엄 최종해지일 - YYMMDD
	}
	
	var versionCompare = function(left, right) {
	    if (typeof left + typeof right != 'stringstring')
	        return false;
	    
	    var a = left.split('.')
	    ,   b = right.split('.')
	    ,   i = 0, len = Math.max(a.length, b.length);
	        
	    for (; i < len; i++) {
	        if ((a[i] && !b[i] && parseInt(a[i]) > 0) || (parseInt(a[i]) > parseInt(b[i]))) {
	            return 1;
	        } else if ((b[i] && !a[i] && parseInt(b[i]) > 0) || (parseInt(a[i]) < parseInt(b[i]))) {
	            return -1;
	        }
	    }
	    
	    return 0;
	}
	
	function doRequest(url) {
		if(url != null && url != '') {
			var iframe = document.createElement("IFRAME");
			iframe.setAttribute("src",url);
			iframe.setAttribute("id", "gaRequest");
			//document.documentElement.appendChild(iframe);
			document.getElementByTagName("body")[0].appendChild(iframe);
		}
		var gaRequest = document.getElementById("gaRequest");
		if(gaRequest !== null && gaRequest.getAttribute('id') === 'gaRequest'){
			iframe.parentNode.removeChild(iframe);
			iframe = null;
		}
	}
	
	function SEND_GADATA_TO_APP(){
		if(isApp) {
			// TODO : 추후 상용적용 예정, ios 는 버전에 따라 호출구분. 5.4.5 이상이면 처리. add 20181031
			var resAppVersion = isNaN(parseFloat('')) ? '0' : '';
            if(oVisitor.OS == "android") {
            	window.Android.GA_DATA(JSON.stringify(ga_data));
            }
            else if(oVisitor.OS == "ios" && versionCompare(resAppVersion,'5.4.5') > 0) {
            	//add 20181107 page load delay
				if ( document.addEventListener ) {
					// For all major browsers, except IE 8 and earlier
					document.addEventListener( "DOMContentLoaded", function(){
						var iFrameURL = "iOS://" + encodeURIComponent(JSON.stringify(ga_data));
						doRequest(iFrameURL);
					});
				} else {
					// For IE 8 and earlier versions
					window.attachEvent( "onload", function(){
						var iFrameURL = "iOS://" + encodeURIComponent(JSON.stringify(ga_data));
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
	
	function APP_PAGEVIEW(){
		ga_data.type = 'P'	// 페이지뷰 : 'P', 이벤트 : 'E'
		SEND_GADATA_TO_APP();
	}
	
	// TODO : 추후 신영화님에게 전달받은 GA 이벤트 대상 항목 실행히 아래 function 실행하여 APP에 이벤트 전달
	function APP_EVENT(){
		ga_data.type = 'E'	// 페이지뷰 : 'P', 이벤트 : 'E'
		// TODO : 빌링파트에서 아래 3개 파라미터확인 필요!!!
		ga_data.category = '';	// 카테고리명(전자상거래 이벤트일 경우 Ecommerce)
		ga_data.action = '';	// 액션명 (전자상거래 이벤트일 경우 해당 이벤트 단계명 ex) Click, Detail ...)
		ga_data.label = '';		// 라벨명
		SEND_GADATA_TO_APP()
	}
	
</script>
<!-- End Google Dimension --><script>
	if(isApp) {
		APP_PAGEVIEW();
	}
	else{
		WEB_PAGEVIEW();
	}
</script>
<!-- End Google Analytics -->

<!-- Google Tag Manager -->
<script>
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-K9Q8F7B');</script>
<!-- End Google Tag Manager --></head>
<body>
        <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-K9Q8F7B"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- 480 X 670 -->
	<div id="wrap">
		<div id="header">
			<h1 class="single">이용권 구매 완료</h1>
		</div>
				<div class="pack_ch">
			<dl>
				<dt id="purchaseProdName" title="무비 프리미엄">무비 프리미엄</dt>
				<dd>
                 PC, 스마트폰, 태블릿, 크롬캐스트, 스마트TV(삼성/LG), 안드로이드TV(뷰잉, 텔레비)에서 월정액 영화관의 모든 영화(Premium, Lite)를 초고화질(1080P)로 시청할 수 있는 이용권입니다.
                    				</dd>
			</dl>
		</div>
		

		<div id="contents">

            <div class="amount">
				<span>결제할 금액 <strong>11,900</strong> 원
				</span> <em>(VAT포함)</em>
				<p>매월 자동결제</p>
			</div>

			<form id="billForm" method="post" name="billForm">
				<fieldset>
										<div class="pay_method" id="payMethodList">
	<h3>계좌번호</h3>
	<ul>
			<li>
			
			<label id="label_mobile" for="paytool_mobile">
			<strong>
				(주)윌 뱅크
			</strong>
			</label>
		</li>
			<h3>101-27-25912692-07</h3>
		</ul>

	<input id="paytoolName" name="paytoolName" type="hidden" value="">
</div>

				
					<dl class="notice">
	<dt>꼭 확인하세요!</dt>
	<dd>
		<em>입금 확인이 완료되면 회원정보가 업데이트 됩니다.</em>
	</dd>
	<dd>
		입금 후 30분내로 회원정보가 업데이트 될 예정 입니다.&nbsp;&nbsp;&nbsp;<a href="<%=cp %>/itving/myPage.do" class="ico" target="_blank">마이페이지</a>
	</dd>
	<dd>
		<em>본 상품은 매월 정기결제가 이루어지며, 다음달에 자동 결제됩니다.</em>
	</dd>
	<dd>
		매월 결제 당일 회원정보에 등록된 이메일로 안내 드립니다.&nbsp;&nbsp;&nbsp;<a href="<%=cp %>/itving/myPage.do" class="ico" target="_blank">회원정보 수정</a>
	</dd>
	<dd>정기결제가 이루어지지 않은 경우 서비스 이용이 해지됩니다.</dd>

    <!-- tier theme만 노출 -->
            <dd>VOD는 본 상품에 포함되어 있지 않습니다.</dd>
    
            <dd>
                            DRM 콘텐츠는 기기등록한 디바이스에서만 이용 가능하며 아이티빙 플레이어에서만 재생됩니다.
                        <br><a href="javascript:;" onclick="javascript:devicePc.popup();;" class="ico">기기 등록하기</a>
        </dd>
        		<dd>
			구매 후 사용내역이 없는 경우 7일 이내에 고객센터를 통해 이용신청의 철회를 할 수 있습니다. 
		</dd>
		<dd>
			위 내용을 확인하였으며, 유료이용약관에 동의합니다. 미성년자의 콘텐츠 구매시 법정대리인의 동의를 받아야 하며, 동의를 받지 않은 경우 법정대리인이 이를 취소할 수 있습니다.<br>
			* 구매 후 사용내역이 없는 경우 7일 이내에 고객센터를 통해 이용신청의 철회를 할 수 있습니다 다만, 이미 다운로드 및  스트리밍하여 사용한 상품에 대해서는 청약철회가 불가능하며, 여러개의 디지털콘텐츠로 구성된 상품의 경우에는 사용하지 아니한 부분에 한해 청약철회가 가능합니다.<br>
			* 콘텐츠가 표시∙광고의 내용과 다르거나 계약내용이 다르게 이행된 경우 구매일로부터 3개월이내 또는 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 청약철회가 가능합니다.<br>
			* 청약철회 일로부터 3일 이내 결제수단과 동일한 방법으로 환불처리됩니다. 단, 관련업체(신용카드, 휴대전화)의 사정에 따라 변경될 수 있습니다.<br>
		</dd>
        <dt>DRM 콘텐츠 시청 가능 환경</dt>
        <dd>
			- PC 권장 사양 : Window 7 이상 / HTML5 지원 모든 브라우저<br>
			- 스마트폰/태블릿 권장 사양 : 안드로이드 OS 4.4이상 / iOS 8.0이상<br>
			- 스마트TV 권장사양 : LG 스마트TV 2015년형 이상 모델(web OS 2.0 이상) / 삼성 스마트TV 2016년형 이상 모델(타이젠 2.4 이상)<br>
       	</dd>
    </dl>
					<div class="act_area">
						<a href="<%=cp %>/itving/rankUpdate_ok2.do"onclick="window.close()" class="btn next" id="payBtn">확인</a> 
						
					</div>
									</fieldset>
				<input type="hidden" name="PRODID" value="3952989">
				<input type="hidden" name="PRODTYPE" value="2">
				<input type="hidden" name="CHARGEAMT" value="9900">

                								
				<input type="hidden" name="ISSPEED" id="ISSPEED" value="3">
				<div id="commonHidden">
					<input type="hidden" name="ssn" id="ssn">
				</div>
			</form>

		</div>
			</div>
		<iframe id="billHiddenForm" name="billHiddenForm"> </iframe>


<script type="text/javascript">
	var isSend = false;
	$( window ).load( function() {
		resizePopup( 480, 670 );
		$("#payBtn").bind("click", recurPayApprove );
	});
	
	function recurPayApprove() {
		//check empty

        if("3952989" == "1197432"){
            if( !$("input:checkbox[name='check_term']").is(":checked") || !$("input:checkbox[name='check_after_discount_pay']").is(":checked")) {
                alertLayer("내용 확인 및 약관 동의하셔야 결제가 가능합니다.");
                return false;
            }
        } else {
            if( !$("input:checkbox[name='check_term']").is(":checked")) {
                alertLayer("내용 확인 및 약관 동의하셔야 결제가 가능합니다.");
                return false;
            }
        }
		
		var paytoolName = $(':radio[name="paySeq"]:checked').attr( "paytoolcode" );
		$("input[id='paytoolName']").val(paytoolName);
		

        $("#billForm").attr("action", "/pc/bill/cash_payment_page.tving");
        $("#billForm").submit();			

	}
	
	//
</script>

<script type="text/javascript">
        
    $( document ).keydown( function( e ) {
        var elid = $( document.activeElement ).is( "input,textarea" );
        if ( (e.keyCode == 8 || e.keyCode == 37 ) && !elid ) {
            e.preventDefault();
            return false;
        }
    } );

    //기본 버튼들
    $( window ).load( function() {

        $( 'input.val' ).bind( {
            focus : function() {
                $( this ).removeClass( 'val' );
            },
            blur : function() {
                var val = $( this ).val();
                if ( val == '' ) {
                    $( this ).addClass( 'val' );
                }
            }
        } );

        $( "#preBtn" ).click( function() {
            var preUrl = "/pc/bill";

            if ( "3952989" != "" ) {
                //상품
									preUrl += "/recurpay_page.tving?PRODID=3952989&PRODTYPE=2";
				            } else if (location.href.indexOf('recurpay_change_paymethod') > 0) {
                preUrl += "/recurpay_change_page.tving?recurNo=";
            } else {
                //캐쉬
                preUrl += "/cash_select.tving?CHARGEAMT=";
            }
            window.location.href = preUrl;
        } );

        $( "#cancelBtn, #closeBtn" ).click( function() {
            if (requestUri.indexOf("result") >= 0) {
                if ('' == 'Y') {
                    // PC의 팝업페이지로 redirect하지 않음.
                    try {
                        //parent.location.reload();
                        opener.location.reload();
                    } catch (e){}
                    self.close();
                } else {
                    billingV4Pc.purchaseComplete('');
                }

            } else {
                self.close();
            }
        } );

        //event trigger
        $( "input[name=paySeq]" ).bind( "click", changePayTool );

        $( "input[name=paySeq]" ).eq( 0 ).attr( "checked", "checked" ).trigger( "click" );

        //레이어 안의 상품명들
        $( ".layer" ).find( "#usedProdName" ).text( billingPc.displayProdName( "", "", "", "", "", "", "" ) );
        $( ".layer" ).find( "#purchaseProdName" ).text( billingPc.displayProdName( "무비 프리미엄", "2", "", "30", "3", "", "" ) );

        $( "div" ).find( "#purchaseProdName" ).text( billingPc.displayProdName( "무비 프리미엄", "2", "", "30", "3", "", "" ) );

        var divDisplayProdName = $( "div#contents" ).find( "span#purchaseProdName" ).text();
        if ( divDisplayProdName.length > 26 ) {
            divDisplayProdName = divDisplayProdName.substr( 0, 25 ) + "...";
            $( "div#contents" ).find( "span#purchaseProdName" ).text( divDisplayProdName );
        }

        //레이어들 (구매정책 관련 )
        if ( "true" == "true" ) {

            if ( "" == "Y" ) {
                alertLayerShowById( "streamAvailProdLayer" );
            }
            // 2014.06.14 : 패키지 대체 상품으로 구매 전환
            else if ( "" == "N" &&  "" == "Y") {
                alertLayerShowById( "replacePackageProdLayer" );
            }
        } 
		if( "true" == "false" ) {
			if("0" == "9986"){
				alertLayerShowById("inlifePurchaseMessage");
			} else if ("0" == "9991") {
				alertLayerShowById("notPurchaseMessageEmp");
			} else {
								alertLayerShowById("notPurchaseMessage");
			}
        }
    } );

    function changePayTool() {

				if($( "input[name=paySeq]:checked" ).val() == "30"){
			alert("다른 결제 수단을 선택해 주세요.");
		}

        //초기화
        $( "#ul_terms_card" ).hide();
        $( "#ul_terms_mobile" ).hide();
        $( "#ul_terms_phonebill" ).hide();
        $( "#ul_terms_culture" ).hide();
        $( "#ul_terms_book" ).hide();

        $( "input[name=paySeq]" ).each( function() {

            var paytool = $( this ).attr( "paytoolcode" );
            var text = $( "#label_" + paytool ).text();
            if ( $( this ).is( ":checked" ) ) {
                $( "#div_paytool_" + paytool ).show();
                $( "#ul_terms_" + paytool ).show();
                $( "#label_" + paytool ).html( "<strong>" + text + "</strong>" );
            } else {
                $( "#div_paytool_" + paytool ).hide();
                $( "#div_paytool_" + paytool + "_result" ).hide();
                $( "#ul_terms_" + paytool ).hide();
                $( "#label_" + paytool ).html( text );
            }

            $( "#div_paytool_" + paytool ).find( "input[type=text],input[type=password],input[type=hidden],input[type=number]" ).val( "" );
            $( "#div_paytool_" + paytool ).find( "input:checkbox" ).removeAttr( "checked" );
            $( "#ul_terms_" + paytool ).find( "input:checkbox" ).removeAttr( "checked" );
            //아래는 조금 특수한 초기화
            $( "#mobileCoName" ).text( "선택" );
            $( "#mobileCo" ).val( "선택" );
            $( "#mobileNum1" ).text( "010" );
            $( "#phonebillNum1" ).text( "02" );
            $( "#smsBtn" ).removeClass().addClass( "cer_in" );
            $( "#cardPointCheckBox" ).hide();
            $( "#isUseCardPoint" ).removeAttr( "checked" );
            $( "#dlMobileSktPin" ).hide();
            $( "#dlMobileAnsimPin" ).hide();
            $( "#sktPin" ).val('');
            $( "#ansimPin" ).val('');
            //신한올뎃입점인경우 결제수단(신한카드)고정
            if("" == 'shinhancard') {
                $( "#cardName" ).text("신한" );
                $( "#cardCode" ).val( "LGC" );
                $( "#div_card_select" ).hide();
            }else{
                $( "#cardName" ).text( "카드사 선택" );
            }
        } );
    }

    function popupExit(){
        if (self.screenTop > 9000) {
            alert('닫힘');
            if (requestUri.indexOf("result") >= 0) {
                if ('' == 'Y') {
                    // PC의 팝업페이지로 redirect하지 않음.
                    try {
                        //parent.location.reload();
                        opener.location.reload();
                    } catch (e){}
                    self.close();
                } else {
                    billingV4Pc.purchaseComplete();
                }

            } else {
                self.close();
            }
        }
    }
</script><!-- 공통 alert -->
<div class="layer" id="alertLayer" style="display: none;">
    <div class="inner">
        <h3>구매하기</h3>
        <p class="alert" id="errMsg"></p>
        <!--  alertLayerCloseById 함수 안에서 location 처리 하기 위해 [return false;] 필수 -->
        <a href="#" class="close" onclick="alertLayerCloseById('alertLayer'); return false;">닫기</a>
        <a href="#" class="win" onclick="alertLayerCloseById('alertLayer'); return false;">닫기</a>
    </div>
</div>

<div class="layer" id="notPurchaseMessage" style="display: none;">
    <div class="inner">
        <h3>구매하기</h3>
        <div class="info">
            <div class="period">
            <p><strong></strong><br><br>
            </p>
            </div>
        </div>
        <div style="margin-bottom:10px; text-align:center;">
            <a href="#" class="bt_txt" onclick="alertLayerCloseById('notPurchaseMessage');self.close();"><span>닫기</span></a>
        </div> 
    </div>
</div>

<div class="layer" id="inlifePurchaseMessage" style="display: none;">
    <div class="inner">
        <h3>구매하기</h3>
        <div class="info">
            <div class="period">
            	<p>고객님은 임직원 상품을 사용중이셔서 일반 이용권의 구매가 불가합니다.<br>
					임직원은 전용 '무제한 플러스 이용권' 구매화면에서 구매하실 수 있습니다.<br>
					확인 버튼을 선택하시면 임직원 전용 화면으로 이동합니다.<br>
           		</p>
            </div>
        </div>
        <div style="margin-bottom:10px; text-align:center;">
            <a href="/pc/bill/recurpay_page.tving?PRODID=1204831&amp;PRODTYPE=2" class="bt_txt" onclick="alertLayerCloseById('inlifePurchaseMessage');"><span>닫기</span></a>
        </div> 
    </div>
</div>

<div class="layer" id="notPurchaseMessageEmp" style="display: none;">
    <div class="inner">
        <h3>구매하기</h3>
        <div class="info">
            <div class="period">
            	<p>고객님은 임직원용 아이티빙무제한 이용권을 사용하고 있지 않습니다.<br>
            	     임직원 전용 '무제한 플러스' 이용권을 구매하기 위해서는 우선 CJ 인라이프의 아이티빙 메뉴에서 카페테리아 포인트로 '아이티빙무제한' 이용권을 구매하시기 바랍니다.<br><br>
					※CJ인라이프는 사내 PC에서만 접속가능한점 양해바랍니다.<br>
           		</p>
            </div>
        </div>
        <div style="margin-bottom:10px; text-align:center;">
            <a href="#" class="bt_txt" onclick="alertLayerCloseById('notPurchaseMessageEmp');self.close();"><span>닫기</span></a>
        </div> 
    </div>
</div>

<!-- 2014.06.13 : 스트리밍 권한은 있으며 다운로드 전용 상품 구매할때 -->
<div class="layer" style="display: none;" id="streamAvailProdLayer">
    <div class="inner">
        <h3>구매하기</h3>
        <div class="period">
            <p><strong>현재 시청 권한이 있는 이용권을 사용하고 있습니다.</strong></p>
            <p>다운로드를 하시려면 추가 결제해 주세요.</p>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('streamAvailProdLayer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('streamAvailProdLayer')">닫기</a>
    </div>
</div>
<!-- 2014.06.14 : 판매 불가능한 컨텐츠 패키지로 전환 판매 -->
<div class="layer" style="display: none;" id="replacePackageProdLayer">
    <div class="inner">
        <h3>구매하기</h3>
        <div class="period">
            <p><strong>패키지 이용권으로 시청 가능한 콘텐츠 입니다. (개별 구매 불가)</strong></p>
            <p>닫기를 클릭하시면 시청이 가능한 패키지 이용권을 구매하실 수 있습니다.</p>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('replacePackageProdLayer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('replacePackageProdLayer')">닫기</a>
    </div>
</div>
<!-- 카드포인트 alert -->
<div class="layer" id="cardPointLayer" style="display: none;">
    <div class="inner">
        <h3>카드 포인트 사용 안내</h3>
        <div class="info">
            <p>
                <em>포인트가 부족한 경우, 부족한 금액은 신용카드 결제가 이루어집니다.</em>
            </p>
            <h4>결제 가능한 카드 포인트</h4>
            <ul>
                <li>BC탑포인트 : 1포인트 이상 적립 시 사용가능</li>
                <li>KB포인트리 : 1점 이상 적립 시 사용 가능</li>
            </ul>
            <h4>결제 유의사항</h4>
            <ul class="end">
                <li>법인카드, 가족카드는 사용이 불가합니다.</li>
                <li>포인트 차감은 카드 결제 청구 시 포인트가 차감된 금액으로 청구됩니다.</li>
                <li>카드 종류에 따라 차감율이 상이할 수 있습니다.</li>
            </ul>
        </div>
		<br><br>
        <a href="#" class="close" onclick="alertLayerCloseById('cardPointLayer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('cardPointLayer')">닫기</a>
    </div>
</div>

<div class="layer" style="top: 35px; display: none;" id="legal_pg_layer">
    <div class="inner">
        <h3>결제대행사 약관</h3>
        <div class="legal">
            <div class="article">
                <dl>
                    <dt>제 1조 목적</dt>
                    <dd>이 약관은 통신과금서비스를 제공하는 주식회사 케이지모빌리언스, 주식회사 다날(이하 "회사"라 합니다)과 통신과금서비스 이용자(이하 "이용자"라 합니다) 사이의 통신과금서비스에 관한 기본적인 사항을 정함으로써 통신과금서비스의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.</dd>
                </dl>
                <dl>
                    <dt>제 2조 용어의 정의</dt>
                    <dd>
                        이 약관에서 정하는 용어의 정의는 다음과 같습니다.<br> 1. "통신과금서비스"라 함은 정보통신서비스로서 다음 각 호의 업무를 말한다.<br> 1) 타인이 판매, 제공하는 재화 또는 용역(이하 "재화 등"이라 한다)의 대가를 자신이 제공하는 전기통신역무의 요금과 함께 청구, 징수하는 업무<br>
                        2) 타인이 판매, 제공하는 재화 등의 대가가 제1호의 업무를 제공하는 자의 전기통신역무의 요금과 함께 청구, 징수되도록 거래정보를 전자적으로 송수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 업무<br> 2. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 통신과금서비스를 이용하는 자를
                        말합니다.<br> 3. '접근매체'라 함은 통신과금 거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 유무선 전화 및 통신사에 등록된 이용자의 유무선 전화 번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등을
                        말합니다.<br> 4. '거래지시'라 함은 이용자가 통신과금서비스 계약에 따라 회사에게 통신과금서비스의 처리를 지시하는 것을 말합니다.<br> 5. ‘가맹점’이라 함은 통신과금서비스를 통하여 이용자에게 재화 또는 용역을 판매, 제공하는 자를 말합니다.<br> 6. ‘지정한 기일’이란
                        이용자가 통신사와 약정한 1항의 전기통신역무의 요금 납입기한을 의미하며, 이는 이동통신사의 기준에 따릅니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 3조 약관의 명시 및 변경</dt>
                    <dd>
                        1. 회사는 이용자가 통신과금 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.<br> 2. 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.<br> 3. 회사가 약관을 변경하는 때에는
                        그 시행일 2주 전에 변경되는 약관을 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 4조 회사의 의무</dt>
                    <dd>
                        1. 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링체계를 갖추어야 합니다.<br> 2. 회사는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여야 합니다.<br> 1) 침입차단시스템 설치<br>
                        2) 침입탐지시스템 설치<br> 3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치<br> 3. 회사는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립·운용하여야 합니다.<br> 1) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은
                        사용을 자제하고 불가피할 경우에는 컴퓨터 바이러스 검색, 치료 프로그램으로 진단 및 치료 후 사용할 것<br> 2) 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것<br> 3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것
                    </dd>
                </dl>
                <dl>
                    <dt>제 5조 회사의 정보 보호조치</dt>
                    <dd>
                        1. 회사는 이용자의 과실 또는 이용자 장비의 문제로 인해 회사의 정보통신망에 중대한 침해사고가 발생하여 회사의 서비스를 이용하는 이용자의 정보시스템 또는 정보통신망 등에 심각한 장애가 발생할 가능성이 있는 아래 각 호의 경우에는 이용자에 대한 보호조치를 전자우편, 공지사항 등의 방법으로 요청할 수 있습니다.<br>
                        1) 사용자의 장비가 제3의 사용자에게 이용 당하여 회사의 서비스에 장애를 초래한 경우<br> 2) 사용자의 장비의 H/W 혹은 S/W의 문제로 회사의 서비스에 장애를 초래하는 경우<br> 3) 사용자가 고의 혹은 실수로 회사의 악의적인 접속을 시도하거나 접속을 한 경우<br> 2.
                        이용자가 취할 보호조치의 내용은 아래 각 호와 같습니다.<br> 1) 해당 장비의 네트워크로부터 연결케이블 제거, 서비스 포트 차단, 네트워크 주소 차단 등의 즉각적인 분리<br> 2) 해당 장비에 대한 보안점검<br> 3) 관련 원인점검 및 패치, OS재설치, 필터링 등의 사후 보안
                        조치 실시<br> 3. 회사는 이용자가 전항의 보호조치를 이행하지 아니할 경우 정보통신망으로의 접속을 5일간 제한할 수 있습니다.<br> 4. 회사가 이용자의 보호조치 불이행에 대하여 부당한 접속 제한을 한 경우 이용자는 제13조 제1항의 담당자에게 이의제기를 할 수 있으며, 회사는
                        이의제기를 접수 후 2주 이내로 사실을 확인하고, 이용자에게 서면(전자문서 포함. 이하 같다)으로 답변을 발송하여야 합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 6조 이용자의 의무 등</dt>
                    <dd>
                        1. 회사는 통신과금서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.<br> 2. 회사는 이용자에게 거래 금액 외에 일정금액의 수수료를 부과할 수 있습니다.<br> 3. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는
                        담보 목적으로 제공할 수 없습니다.<br> 4. 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안 되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.<br> 5. 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은
                        때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.<br> 6. 이용자는 ‘정보통신망 이용촉진 및 정보보호에 관한 법률’ 제72조에 의거하여 재화 등을 할인매입한 행위를 하였을 경우 회사는 관계당국에 고소 및 고발, 민사상의 법적 조치를 취할 수
                        있습니다.<br> 7. 회사는 이용자가 전기통신역무의 요금과 함께 청구된 재화 등의 대가를 ‘지정한 기일’까지 납입하지 아니한 때에는 그 요금의 100분의 2에 상당하는 가산금을 부과합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 7조 개인정보 수집 및 이용</dt>
                    <dd>
                        1. 회사는 본 서비스(휴대폰 소액결제 서비스)의 원활한 이용을 위해 고객인증, 이용금액 청구 및 수납을 위하여 이용자가 지정한 이동통신사에 고객의 휴대전화번호, 주민번호 등 개인정보와 인증 및 과금에 필요한 정보(사용금액, 구매일시, 상품코드 등)를 제공할 수 있습니다.<br> 2. 이동통신사와의
                        청구수납대행계약에 따른 요금정산을 위해 필요한 정보(휴대전화번호, 주민번호, 사용일자, 청구일자, 청구 및 수납금액 등)를 제공받을 수 있습니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 8조 불법 거래 차단 시스템 구축</dt>
                    <dd>
                        1. 회사는 제3자의 불법적인 결제로부터 이용자를 보호하고, 이로 인한 이용자의 손해를 최소화하기 위해 다음 각 호와 같은 시스템을 구축하여야 합니다.<br> 1) 비정상 거래 유형 분석 시스템<br> 2) 복제폰 이용 거래 탐지 시스템<br> 3) 기타 불법결제 의심 거래 모니터링
                        시스템<br> 2. 회사는 본조 제1항 각 호의 시스템을 통해 불법적인 결제 요청으로 판단될 경우, 결제 요청을 차단할 수 있습니다.<br> 3. 본조에 의한 차단 사유가 해소된 경우, 이용자는 제13조 제1항의 담당자에게 연락을 하여 본인 확인 절차를 거친 후 통신과금서비스를 이용할 수
                        있습니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 9조 유무선전화결제이용자보호협의회</dt>
                    <dd>
                        1. 회사는 불법 과금, 복제폰, 휴대폰 깡, 및 불법 마케팅 등으로부터 이용자를 보호하기 위하여 유무선전화결제이용자보호협의회(이하 “전보협”이라 한다)의 구성원으로 참여하여, “유무선전화결제이용자보호협의회에 관한 합의서”를 성실히 이행합니다.<br> 2. 회사는 전보협의 민원경보시스템 운영을 위해
                        항시 연락 가능한 담당자 1인을 아래와 같이 지정하여, 신속한 민원처리에 협조합니다.<br> 담당자: 이 인 숙<br> 연락처(전화번호, 전자우편주소):<br> 02)2018-2120, help@mobilians.co.kr<br> 3. 회사는 전보협 운영위에서 심사하고,
                        전보협, 방송통신위원회에서 제시한 가이드라인을 준수하며, 가맹점에게 가이드라인의 준수를 권고하고 지속적으로 모니터링합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 10조 회사의 배상책임</dt>
                    <dd>
                        1. 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다. <br> 2. 회사가 접근매체의 발급주체이거나 사용, 관리주체인 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여
                        배상책임이 있습니다. <br> 3. 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조 제2항에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가
                        발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다. <br> 4. 회사는 이용자가 통신과금서비스 이용 시 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 또는 이용자가 제6조 제3,
                        4항에 위반하는 등 이용자의 부주의에 기한 손해에 대하여 배상 책임이 없습니다. <br> 5. 회사와 이용자 사이에 손해배상에 관한 협의가 성립되지 아니하거나 협의를 할 수 없는 경우에는 당사자는 방송통신위원회에 재정을 신청할 수 있습니다. <br> 6. 회사는 컴퓨터 등 정보통신설비의
                        보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 통신과금서비스의 제공을 일시적으로 중단할 수 있습니다.<br> 7. 회사는 전항의 사유로 통신과금서비스의 제공이 일시적으로 중단됨으로 인하여 이용자가 입은 손해에 대하여 배상합니다. 단, 회사가 고의 또는 과실이 없음을 입증한 경우에는
                        그러하지 아니합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 11조 고지사항</dt>
                    <dd>
                        1. 회사는 재화 등의 판매·제공의 대가를 청구할 때 이용자에게 다음 각 호의 사항을 고지하여야 합니다.<br> 1) 통신과금서비스 이용일시<br> 2) 통신과금서비스를 통한 구매·이용의 거래 상대방(통신과금서비스를 이용하여 그 대가를 받고 재화 또는 용역을 판매·제공하는 자를 말하며, 이하
                        "거래 상대방"이라 합니다)의 상호와 연락처<br> 3) 통신과금서비스를 통한 구매·이용 금액과 그 명세<br> 4) 이의신청 방법 및 연락처<br> 2. 회사는 이용자가 구매·이용 내역을 확인할 수 있는 방법을 제공하여야 하며, 이용자가 구매·이용 내역에 관한 서면을 요청하는
                        경우에는 그 요청을 받은 날부터 2주 이내에 이를 제공하여야 합니다.<br> 3. 회사는 다음 각 호의 사항에 관한 기록을 해당 거래를 한 날부터 1년간 보존하여야 합니다. 다만, 건당 거래 금액이 1만원을 초과하는 거래인 경우에는 5년간 보존하여야 합니다.<br> 1) 통신과금서비스를 이용한
                        거래의 종류<br> 2) 거래 금액<br> 3) 거래 상대방<br> 4) 거래 일시<br> 5) 대금을 청구·징수하는 전기통신역무의 가입자번호<br> 6) 회사가 통신과금 서비스 제공의 대가로 수취한 수수료에 관한 사항<br> 7) 해당 거래와 관련한
                        전기통신역무의 접속에 관한 사항<br> 8) 거래의 신청 및 조건의 변경에 관한 사항<br> 9) 거래의 승인에 관한 사항<br> 10) 그 밖에 방송통신위원회가 정하여 고시하는 사항<br> 4. 전항에 따른 거래기록은 서면, 마이크로필름, 디스크, 자기테이프, 그 밖의
                        전산정보처리조직에 의하여 보존하여야 합니다. 다만, 디스크, 자기테이프, 그 밖의 전산정보처리조직에 의하여 보존하는 경우에는 전자거래기본법 제5조 제1항 각 호의 요건을 모두 갖추어야 합니다.<br> 5. 이용자는 통신과금서비스가 자신의 의사에 반하여 제공되었음을 안 때에는 회사에게 이에 대한 정정을
                        요구할 수 있으며(이용자의 고의 또는 중과실이 있는 경우는 제외한다), 회사는 그 정정 요구를 받은 날부터 2주 이내에 처리 결과를 알려 주어야 한다.<br> 6. 회사는 이용자의 이용내역 및 요금부과 등에 대한 문의전화가 발생할 경우 회사와 고객응대 업무만을 위해 설립한 자회사에 고객응대 업무에
                        한하여 업무대행을 의뢰할 수 있습니다.<br> 7. 이용자가 제1항에서 정한 서면 교부를 요청하고자 할 경우 다음의 연락처로 요청할 수 있습니다.<br> 주소: 경기도 성남시 분당구 대왕판교로 660 유스페이스1 A동 5층<br> 이메일 주소: help@mobilians.co.kr<br>
                        전화번호: 1600-0523
                    </dd>
                </dl>
                <dl>
                    <dt>제 12조 통신과금정보의 제공금지</dt>
                    <dd>
                        1. 회사는 통신과금서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 통신과금의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 업무상 이용자 정보를 제3자에게 제공할 경우 본 약관변경을
                        통해 홈페이지에 고지합니다.<br> 
						2. 회사는 고객서비스를 보다 활성화하여 최적화된 서비스를 제공하고 신상품이나 이벤트 정보안내, 설문조사 등 고객 지향적인 마케팅을 수행하기 위해 서비스 이용계약 체결 시 수집한 고객의 개인정보 (성명, 이동통신단말 번호, 고유식별번호(주민등록번호 앞 7자리))를 활용할 수 있으며, 이에 대한 보유기간은 이용자가 동의한 날로부터 5년간 입니다.<br> 
						3. 회사는 정보통신망이용촉진및정보보호등에관한법률 (제7장 통신과금서비스)의 관련규정에 의거하여 구성된 "유무선전화결제이용자보호협의회"가 이용자 보호를 위해 통신과금서비스 관련 정보를 요청하면 다음 각 호의 경우에는 관련 정보를 제공할 수
                        있습니다.<br> 1) 휴대폰깡, 대포폰, 복제폰 등 시장 질서를 교란시키는 불법업체 혹은 불법행위자에 의한 민원발생의 경우<br> 2) 지인 사용 등 제3자 결제로 인한 민원발생의 경우<br> 3) 기타 통신과금서비스를 통한 불법행위가 발생하여 이용자 보호가 필요한 경우<br>
                        4. 회사는 통신과금서비스의 거래 내역 확인 및 서비스 상담 등의 이용자 편의 업무를 위해서 아래와 같이 이용자 정보를 제공하고 있습니다.<br> 제공받는자 : 주식회사 씨베이스<br> 제공되는 항목 : 휴대전화 번호, 거래 일시, 거래 금액, 거래 상대방, 거래 내역<br> 목 적
                        : 거래 내역 확인, 취소, 환불 및 서비스 상담<br> 보유 및 이용기간: 이용자의 동의 철회시까지
                    </dd>
                </dl>
                <dl>
                    <dt>제 13조 이의신청 및 권리구제</dt>
                    <dd>
                        1. 이용자는 다음의 보호책임자 및 담당자에 대하여 이의신청 및 권리구제를 요청할 수 있습니다.<br> 담당자: 이 인 숙(고객센터 센터장)<br> 연락처(전화번호, 전자우편주소): 02)2018-2110, help@mobilians.co.kr<br> 2. 회사는 이용자로부터
                        이의신청을 받은 날부터 2주일 이내에 그 조사 또는 처리 결과를 이용자에게 알려야 합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제 14조 약관 외 준치 및 관할</dt>
                    <dd>
                        1. 본 약관에 명시되지 아니한 사항 또는 약관 해석상 다툼이 있는 경우에는 이용자는 언제든지 회사가 운영하는 고객센터를 통해 회사와 합의하여 해결할 수 있고, 합의가 이뤄지지 아니한 경우에는 소비자보호 관련 법령 및 일반상관례에 따릅니다.<br> 2. 회사와 이용자 간에 발생한 분쟁에 관한 관할은
                        민사소송법에서 정한 바에 따릅니다.<br> <br> 부칙<br> 1. 본 약관은 2012년 7월 8일부터 적용합니다.<br> 2. 기존에 적용되던 약관(2010.6.11~2012.7.7 적용)은 본 약관으로 대체합니다.
                    </dd>
                </dl>
            </div>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('legal_pg_layer');">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('legal_pg_layer');">닫기</a>
    </div>
</div>




<div class="layer" style="top: 35px; display: none;" id="legal_charge_layer">
    <div class="inner">
<h3>유료이용약관</h3>
        <div class="legal">
            <div class="article">
                <dl>
                    <dt>제 1 조 (목적)</dt>
                    <dd>
                        <p>
                            본 약관은 씨제이이엔앰 주식회사(이하 "회사”라 합니다.)가 운영하는 아이티빙 웹(<a href="http://www.tving.com/">www.tving.com</a> / <a href="http://www.tving.com/">m.tving.com</a>)과 모바일, 태블릿, 스마트TV 앱이 제공하는 서비스와 기타 부가적인 서비스 이용과 관련하여 유료서비스 이용 및 유료서비스의 결제수단인 아이티빙캐쉬의 이용에 대한 “회원”과 “회사”의 권리 의무 및 책임사항 규정을 목적으로 합니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 2 조 (약관의 공지 및 적용)</dt>
                    <dd>
                        <p>
                            ① 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 “회원”에게 공지함으로써 효력이 발생합니다.<a name="_GoBack"></a>
                        </p>
                        <p>
                            ② “회사”는 합리적인 사유가 발생한 경우에는 디지털콘텐츠산업진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률 등 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 
                        </p>
                        <p>
                           ③ “회사”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항과 같은 방법으로 그 적용일자 10일 전에 게시하거나 기타의 방법을 통해 제공합니다. 단, “회원”에게 불리한 약관개정의 경우에는 적용일자 및 변경사유를 명시하여 현행 약관과 함께 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지하며, 공지 외에 전자우편주소 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다. 
                        </p>
                        <p>
                            ④ “회사”가 약관을 개정할 경우에는 개정약관 공지 후 개정약관의 적용에 대한 “회원”의 동의 여부를 확인합니다. “회원”이 변경된 약관에 동의하지 않을 경우 “회원”탈퇴를 요청할 수 있으며, “회원”이 변경된 약관의 효력 발생일 이후에도 거부의사를 밝히지 않고 서비스를 계속 사용하거나 약관의 효력 발생일까지 거부의 의사를 밝히지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 3 조 (용어의 정의)</dt>
                    <dd>
                        <p>
                            ① 유료서비스 : 아이티빙의 사이버 머니인 아이티빙캐쉬 또는 “회사”가 제공하는 별도의 결제방식을 이용하여 이용요금을 지급한 후에 사용할 수 있는 아이티빙의 서비스를 말합니다. 
                        </p>
                        <p>
                            ② 아이티빙캐쉬 : 아이티빙캐쉬는 아이티빙에서 제공하는 각종 유료서비스의 이용 할 수 있는 이용요금 결제수단인 사이버머니를 말합니다. 
                        </p>
                        <p>
                           ③ 충전 : 아이티빙캐쉬 충전은 “회원”이 아이티빙캐쉬를 확보하기 위해 “회사”가 정한 특정 지불수단 중 원하는 결제수단을 선택하여 아이티빙캐쉬를 구매하는 것을 말합니다. 
                        </p>
                        <p>
                            ④ 결제 : “회원”이 유료서비스를 이용하기 위하여 아이티빙캐쉬 또는 “회사”가 제공하는 별도의 결제수단을 통하여 유료서비스에 대한 이용요금을 “회사”에 지불하는 것을 말합니다. 
                        </p>
                        <p>
                            ⑤ 결제취소 : “회원”이 결제한 이후에 일정한 절차에 따라 결제 행위를 철회하는 것을 말합니다. 
                        </p>
                        <p>
                            ⑥ 구매 : “회원”이 결제를 통하여 유료서비스에 대한 이용권한을 취득하는 행위를 말합니다. 
                        </p>

                        <p>
                            ⑦ 구매취소 : “회원”이 구매한 유료서비스에 대한 구매를 철회하는 것을 말합니다. 
                        </p>
                        <p>
                           ⑧ 환불 : “회원”이 결제한 유료서비스에 대한 이용요금을 아이티빙캐쉬 이용요금의 결제와 동일한 방법 또는 현금으로 되돌려 받거나, 아이티빙캐쉬 차감 취소 또는 “회사”가 제공하는 결제수단별 승인취소 등의 방법으로 유료서비스에 대한 이용요금의 지불이 이루어지지 않도록 하는 것을 말합니다. 
                        </p>
                        <p>
                            ⑨ 이용권구입 : “회원”이 아이티빙이 제공하는 별도의 결제수단을 통하여 아이티빙캐쉬의 이용권 구입형 서비스를 이용하는 것을 말합니다. 
                        </p>
                        <p>
                            ⑩ PG : “회사”와 계약관계에 있는 전자지불 결제대행사를 말합니다. 
                        </p>
                        <p>
                            ⑪ 실시간TV : 아이티빙에서 제공하는 실시간 방송을 스트리밍 방식으로 “회원”에게 제공하는 서비스를 말합니다. 
                        </p>
                        <p>
                            ⑫ VOD : 아이티빙에서 제공하는 컨텐츠를 스트리밍, 다운로드 방식으로 “회원”에게 제공하는 서비스를 말합니다. 
                        </p>
						<p>
                             ⑬ CP : 콘텐츠 제공업체 (Contents Provider)를 말합니다.
                        </p>
                        <p>
                            상기한 용어를 제외한 기타 용어는 상위 약관인 아이티빙 서비스 이용 약관 및 개별 유료서비스 이용약관 및 “회사”가 정하는 정책에 따릅니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 4 조 (이용계약의 성립, 신청, 승낙, 계약사항의 변경 등) </dt>
                    <dd>
                        <p>
                            유료서비스 이용계약은 “회원”의 아이티빙 유료서비스 이용약관에 대한 동의와 해당 유료서비스 이용을 원하는 “회원”의 아이티빙캐쉬 충전 후 지불 혹은 “회사”가 제공하는 별도의 결제수단을 이용한 결제를 통한 이용신청과 “회사”의 승낙으로 성립합니다. 기타사항은 상위약관인 아이티빙 서비스 이용약관, 개별 유료 부가 서비스 이용약관의 규정 및 “회사”가 정하는 정책에 따릅니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 5 조 (개인정보의 보호) </dt>
                    <dd>
                        <p>
                            ① “회사”는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 그에 따른 시행규칙, 시행령 등 관계법령이 정하는 바에 따라 “회원” 등록정보를 포함한 “회원”의 개인정보를 보호하기 위해 노력합니다. 
                        </p>
                        <p>
                            ② “회사”는 “회원”이 미풍양속에 저해되거나 국가보안에 위배되는 파일을 등록하거나 배포시, 관련기관의 요청이 있을 경우 “회원”에게 별도의 통지 없이 관련 기관에 “회원”의 자료를 열람 및 제공할 수 있습니다. 
                        </p>
                        <p>
                           ③ “회사”는 “회원”의 서비스 이용 장애 시 해당 “회원”의 동의 하에 장애 해결의 목적으로 자료를 열람할 수 있습니다. 
                        </p>
                        <p>
                            ④ “회사”는 “회원”의 귀책사유로 인해 노출된 개인정보에 대해 “회사”는 일체의 책임을 지지 않습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 6 조 (유료서비스의 종류)</dt>
                    <dd>
                        <p>
                           ① “회사”가 “회원”에게 제공하는 유료서비스의 종류는 다음과 같습니다. 
                        </p>
                        <p>
                            가. 스트리밍 서비스: “회사”가 콘텐츠를 온라인 스트리밍 방식으로 ”회원”에게 제공하는 서비스 
                        </p>
                        <p>
                           나. 다운로드 서비스 : “회사”가 콘텐츠를 다운로드 방식으로 ”회원”에게 제공하는 서비스 
                        </p>
                        <p>
                           ② “회사”의 유료서비스의 이용가능기기 및 이용에 필요한 최소한의 기술사항은 다음의 ‘권장사양정보’에 따릅니다.
                        </p>
						<p>
                            가. PC 권장 사양 : Window 7 이상 / HTML5 지원 모던 브라우저
                        </p>
                        <p>
                           나. 스마트폰/태블릿 권장 사양 : 안드로이드 OS 4.4이상 / iOS 8.0이상
                        </p>
						<p>
                            다. 스마트TV 권장사양 : LG 스마트TV 2015년형 이상 모델(web OS 2.0 이상) / 삼성 스마트TV 2016년형 이상 모델(타이젠 2.4 이상)
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 7 조 (결제방식)</dt>
                    <dd>
                        <p>
                            ① 결제방식은 정기결제방식과 이용권 구입방식으로 나뉘며 결제의 도구로는 아래와 같은 수단이 있으며, 자세한 내용은 상품 안내 페이지를 통해 상세히 설명합니다. 단, 정기결제를 지원하는 결제수단은 관련업체와의 협의에 따라 변동될 수 있습니다. 
                        </p>
                        <p>
                            가. 아이티빙캐쉬 : 유료서비스 이용약관에 따라 충전한 사이버머니를 이용한 결제 방식 
                        </p>
                        <p>
                            나. 직접결제 : 아이티빙캐쉬를 이용하지 않고 ”회사”가 제공하는 별도의 결제 수단(휴대폰, 신용카드 등)을 통한 결제 방식 
                        </p>
                        <p>
                            다. 정기결제 : 매월 자동으로 과금하는 결제방식. 결제수단은 별도 명시된 수단에 한 함. 
                        </p>
                        <p>
                            라. CJ ONE 포인트 : CJ ONE 통합회원의 경우 CJ ONE 포인트를 사용하여 결제하는 방식. CJ ONE포인트와 관련하여서는 해당 "CJ ONE" 이용약관의 내용을 따릅니다. 
                        </p>
                        <p>
                           ② 정기결제상품은 해당 유료서비스의 지속적 이용이라는 서비스 특성에 적합하도록 1개월(이하 “서비스 이용 기간”)마다 “회원”이 신청한 일정한 결제수단을 통해 1개월 동안의 서비스 이용요금을 “서비스 이용 기간” 개시 전에 결제를 자동으로 진행하고, 결제한 “서비스 이용 기간” 동안 서비스를 이용하게 하는 서비스 상품으로서, 정기결제상품의 경우 “회원”이 정해진 절차에 따라 “회사”에 이용중지 의사를 밝히지 않을 경우 매월 계약이 갱신되는 것으로 간주되어 지속적으로 요금이 청구됩니다.
                        </p>
                        <p>
                            가. “회사”는 매월 서비스 이용계약의 자동갱신 및 이용요금 청구를 위해 “서비스 이용기간” 및 “서비스 이용 기간” 종료 후 일정기간 동안 “회원”의 결제관련정보를 보유할 수 있습니다. 
                        </p>
                        <p>
                            나. “회원”이 정기결제를 신청하시면 별도의 해지 신청을 하지 않을 경우 1개월 마다 자동으로 “서비스 이용 기간”에 대한 서비스 이용 요금이 결제됩니다. “회사”는 결제가 이루어지기 전에 “회원”에게 결제될 내역에 대하여 전자우편 또는 문자메시지 등으로 고지합니다. 
                        </p>
                        <p>
                            다. “정기결제” 해지로 인한 “서비스 이용 기간” 만료일은 정기결제일로부터 1개월 입니다. “정기결제” 해지 시 “회원”은 “서비스 이용 기간”에서 이미 이용한 기간을 제외한 나머지 기간 동안 서비스를 이용할 수 있으며, 남은 “서비스 이용 기간” 만료일 후 결제가 자동으로 진행되지 않습니다. 
                        </p>
                        <p>
                           라. 타인의 결제 정보를 동의 없이 사용할 경우 민/형사상 책임을 지게 되며 관계법령에 의해 처벌될 수 있습니다. 
                        </p>
                        <p>
                            마. 결제 정보 변경, 신용카드 및 휴대전화의 분실, 기타의 사유로 정기결제가 이루어지지 않을 경우 마지막 정기결제일로부터 1개월 지난 후 서비스 이용이 자동 정지됩니다. 
                        </p>
                        <p>
                            바. “회원”의 이용요금 미납 등 귀책사유로 인한 정기결제중지 및 이에 따른 서비스 이용정지로 인한 손해에 대해 “회사”는 책임을 지지 않습니다. 
                        </p>
                        <p>
                            사. 휴대전화의 정기 자동 결제 시 “회원”이 통신사를 변경하여 자동 결제가 실행되지 않는 경우에는 자동결제시스템에 따라 변경된 통신사로 자동 전환되어 결제가 실행되며 이후 “회원”의 명시적인 통보가 없는 한 변경된 통신사로 결제가 변경됩니다. 
                        </p>
                        <p>
                            아. 결제수단의 미납 또는 한도초과로 인하여 “정기결제”가 실행되지 않는 경우에는 자동결제시스템에 따라 익월 초에 재결제가 실행됩니다. 
                        </p>
                        <p>
                            자. “정기결제”가 이루어지는 기간 동안 가격이 변경되는 경우에는 “회원”에게 가격 변경에 대한 동의여부를 선택할 수 있도록 변경된 가격으로 전자적 대금지급이 이루어지는 시점에서 전자적 대금 결제창을 “회원”에게 제공합니다. 
                        </p>
                        <p>
                            ③ 유료서비스 이용시 결제정보 입력란에 결제방식 및 결제금액을 설정한 후 정상결제가 되면, 일정기간 경과 후 해당 정보에 명시된 이용요금을 지불하여야 합니다. 만약 명시된 이용요금을 기한 내에 지불하지 못하였을 경우에는 해당 서비스 사용이 중지됩니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 8 조 (아이티빙캐쉬 충전) </dt>
                    <dd>
                        <p>
                           ① 아이티빙캐쉬 충전은 아이티빙캐쉬 결제 페이지에 있는 결제금액단위 중 원하는 금액을 선택하여 충전할 수 있습니다. 
                        </p>
                        <p>
                           ② 아이티빙캐쉬의 충전 금액은 휴대전화 결제의 경우 해당 통신사의 제한에 의거하여 이용 및 금액이 제한될 수 있으며, 이와는 별도로 “회원”이 선택하신 지불 수단에 따라 사용제한 금액이 있습니다. 
                        </p>
                        <p>
                            ③ 아이티빙캐쉬를 충전한 “회원”의 경우 아래 내용에도 동의한 것으로 간주합니다. 
                        </p>
                        <p>
                            가. “회사”는 “회원”이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 전자우편이나 무선 문자메시지 등의 방법으로 “회원”에게 제공할 수 있으며, “회원”은 원치 않을 경우 정보수신을 거부할 수 있습니다. 다만, “회원”의 서비스 이용과 관련되어 서비스 이용상 중대한 정책 변경 등에 관한 사항은 정보수신을 거부한 “회원”들에게도 E-Mail 등을 통해 해당 내역을 고지할 수 있습니다. 
                        </p>
                        <p>
                            나. “회원”은 서비스 이용요금을 해당 과금업체의 요금 청구를 받아 납부시스템에 의하여 납부하며, 서비스의 이용요금을 정상적으로 납부하지 않을 경우 “회사”는 해당 “회원”에 대해 서비스의 이용을 제한할 수 있습니다. 
                        </p>
                        <p>
                            ④ 아이티빙캐쉬의 충전에 대한 결제방식은 ”회사”와 결제 계약이 이루어진 해당사의 결제기준에 따릅니다. 
                        </p>

                    </dd>
                </dl>
                <dl>
                    <dt>제 9 조 (아이티빙캐쉬의 유효기간)</dt>
                    <dd>
                        <p>
                            아이티빙캐쉬의 유효기간은 5년입니다. “회원”은 아이티빙캐쉬를 충전한 날로부터 유효기한 내에서 사용할 수 있으며, 유효기간이 경과된 아이티빙캐쉬는 충전한 날을 기점으로 순차적으로 자동 소멸됩니다. (단, 이벤트 캐쉬는 지급 페이지 내에 유효기간 별도 명기) 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 10 조 (아이티빙캐쉬 사용)</dt>
                    <dd>
                        <p>
                            ① 아이티빙캐쉬는 아이티빙 내의 각종 유료서비스의 이용, 디지털 콘텐츠 구입할 때, 그 결제수단으로 이용됩니다. 
                        </p>
                        <p>
                            ② 아이티빙캐쉬 1원은 현금 1원과 같은 비율로 사용되며, http://www.tving.com의 각 유료서비스를 위한 결제수단으로 사용이 가능합니다. 
                        </p>
                        <p>
                            ③ “회원”은 아이티빙캐쉬를 타인에게 양도하거나 타인으로부터 양도 받을 수 없습니다. 
                        </p>
                        <p>
                            ④ 아이티빙 서비스의 중대한 하자에 의하여 “회원”이 서비스 이용에 손해를 입은 경우 아이티빙캐쉬로 충전 또는 그에 상응하는 적절한 수단을 통해 보상 받을 수 있으며 이는 본 약관 및 개별 유료서비스 약관의 환불 정책에 따릅니다. 
                        </p>
                        <p>
                           ⑤ “회사”는 “회원”의 아이티빙캐쉬에 대한 금융이자 지급 의무가 없습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 11 조 (미성년자의 아이티빙캐쉬 충전 및 사용)</dt>
                    <dd>
                        <p>
                           ① 만 14세 미만의 미성년자는 유료 서비스를 이용하실 수 없습니다. 
                        </p>
                        <p>
                           ② 만 15세 이상부터 만 19세 미만의 민법상 미성년자가 유료 서비스를 이용하고자 하는 경우 법정대리인(부모)의 동의를 받아야 합니다. 미성년자가 부모님 등 법정대리인의 동의를 받지 않은 경우 유료 서비스를 이용하실 수 없습니다. 
                        </p>
                        <p>
                           ③ 만 15세 이상부터 만 19세 미만의 미성년자의 유료서비스 이용은 법정대리인이 이를 취소할 수 있습니다. 이 경우 법정대리인은 “회사”에 당해 이용자의 법정대리인임을 증명하고 확인 및 보존이 가능한 방법으로 취소의 의사표시를 해야 합니다. 
                        </p>
                        <p>
                           ④ 전항과 관련하여 미성년자가 다른 성인 등의 개인정보를 이용하여 회원가입을 하거나 성인 등의 결제정보를 그 자의 동의 없이 이용하는 등 사술로써 “회사”로 하여금 능력자로 믿게 한 때에는 취소하지 못합니다. 
                        </p>
                    </dd>
                </dl>
				<!-- -->
				<dl>
                    <dt>제 12 조 (포인트 운영)</dt>
                    <dd>
                        <p>
                           ① 포인트란 “회사”가 정한 정책에 따라 서비스 이용 시 가감되는 일종의 점수를 말합니다.
                        </p>
						<p>
                          ② “회사”는 시행중인 포인트의 기준 및 사용방법을 “회사” 서비스 특정화면에 게시합니다.
                        </p>
						<p>
                        ③ 포인트 기준 및 운영정책은 “회사”의 사정에 따라 변경될 수 있습니다.
                        </p>
						<p>
                            ④ “회원”이 포인트를 부당하게 취득한 증거가 있을 때에는 “회사”는 사전통지 없이 포인트를 삭제할 수 있으며 이와 관련하여 “회원”의 자격을 제한 할 수 있습니다.
                        </p>
						<p>
                           ⑤ “회원”이 정보삭제를 요구하거나 회원탈퇴를 요청한 경우, 포인트는 모두 소멸되며 재적립 되지 않습니다.
                        </p>
						<p>
                            ⑥ 포인트는 제3자에게 양도, 또는 양수 할 수 없습니다. 단, 2010년9월1일부터 시행되는 "CJ ONE" 통합멤버쉽 포인트의 경우 해당 "CJ ONE" 이용약관의 내용을 따릅니다.
                        </p>
						<p>
                           ⑦ “회사”는 경영상·기술상의 이유로 포인트 서비스를 종료하는 경우 최소 30일 전까지 “회원”에게 이 사실을 고지하며, 이 기간 내에 이용하지 못한 포인트에 대해서는 사전에 정한 보상방법에 따라 “회원”에게 보상합니다.
                        </p>
					</dd>
				</dl>
				<!-- -->
                <dl>
                    <dt>제 13 조 (청약의 철회 및 결제 취소)</dt>
                    <dd>
                        <p>
                            ① “회원”은 구매 후 사용내역이 없는 경우 &lt;아이티빙서비스 이용약관&gt; 제16조 제1항에 따른 수신확인의 통지를 받은 날로부터 7일 이내에 이용신청의 철회를 할 수 있습니다. 다만, “회사”가 다음 각 호 중 하나의 조치를 취한 경우에는 “회원”의 이용신청 철회가 제한될 수 있습니다. 
                        </p>
                        <p>
                           가. 이용신청 철회가 불가능한 “콘텐츠”에 대한 사실을 표시사항에 포함한 경우 
                        </p>
                        <p>
                           나. 시용상품을 제공한 경우 
                        </p>
                        <p>
                            다. 한시적 또는 일부이용 등의 방법을 제공한 경우 
                        </p>
                        <p>
                           ② 제1항의 이용신청의 철회는 “회원”이 전화, 전자우편 또는 모사전송으로 “회사”에 의사표시를 한 때에 효력이 발생합니다. 
                        </p>
                        <p>
                            ③ “회사”는 제2항에 따라 “회원”이 표시한 이용신청의 철회의 의사표시를 수신한 후 지체없이 이러한 사실을 “회원”에게 회신합니다. 
                        </p>
                        <p>
                            ④ “회원”은 이용신청을 철회한 경우 “회원”이 선택한 각각의 결제방식에 따라 “회사”에 해당 결제취소처리를 신청할 수 있습니다. 다만, 다음 각 호의 경우에는 결제취소처리가 불가능합니다. 
                        </p>
                        <p>
                            가. 이벤트, 보상 등 결제수단이 무료로 지급된 경우 
                        </p>
                        <p>
                            나. 해당 기간 내에 사용내역이 있을 경우 
                        </p>
                        <p>
                            다. 해당 결제수단에 따른 결제취소 가능기간을 경과한 경우 
                        </p>
                        <p>
                           라. 결제취소처리가 불가능한 결제방식을 이용해서 아이티빙캐쉬를 충전하거나 유료서비스 결제를 한 경우(이 경우는 본 약관 제14조에 따른 환불처리만이 가능합니다.) 
                        </p>
                        <p>
                            ⑤ 각각의 결제방식에 따른 결제취소 가능기간은 다음과 같으며, 결제취소 가능기간이 경과한 경우 결제취소처리가 불가능합니다. 단, 아래 각 호는 관련업체의 사정에 따라 변경될 수 있습니다. 
                        </p>
                        <p>
                           가. 신용카드 : 결제당일 ~ 2개월(60일) 이내에 결제취소가 가능합니다. 단, 각각의 해당 신용카드사의 정책에 따라 취소가능기간이 다를 수 있습니다. 
                        </p>
                        <p>
                           나. 휴대전화 : 결제 당월 말일 하루 전까지 결제취소가 가능합니다. 단, 각각의 해당 이동통신업체의 정책에 따라 취소가능기간이 다를 수 있습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 14 조 (“회원”의 계약의 해제·해지)</dt>
                    <dd>
                        <p>
                            ① “회원”은 다음 각 호의 사유가 있을 때에는 유료서비스의 이용을 시작한 날로부터 3월 이내 또는 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 유료서비스 이용계약을 해제·해지할 수 있습니다.
                        </p>
                        <p>
                          가. 약정한 유료서비스가 제공되지 않는 경우 
                        </p>
                        <p>
                           나. 제공되는 유료서비스가 표시·광고 등과 상이하거나 현저히 차이가 나는 경우 
                        </p>
                        <p>
                            다. “회사”의 시스템 장애 및 기타 “회사”의 귀책사유로 인해 유료서비스의 정상적인 이용이 현저히 불가능한 경우 
                        </p>
                        <p>
                           ② “회원”은 제1항의 사유로 계약 해제·해지의 의사표시를 하기 전에 상당한 기간을 정하여 “회사”에 유료서비스 이용의 하자에 대한 치유를 요구할 수 있습니다. 
                        </p>
                        <p>
                            ③ 제1항의 계약 해제·해지는 “회원”이 전화, 전자우편 또는 모사전송 기타 “회사”가 인정하는 방법으로 “회사”의 정상 업무시간 이내에 “회사”에 그 의사를 표시한 때에 효력이 발생합니다. 
                        </p>
                        <p>
                           ④ “회사”는 제3항에 따라 “회원”이 표시한 유료서비스 이용계약 해제·해지의 의사표시를 수신한 후 지체없이 이러한 사실을 “회원”에게 회신합니다. 
                        </p>
                        <p>
                           ⑤ “회원”이 유료서비스 이용계약을 해제·해지할 경우 “회사”는 “회원”이 선택한 각각의 결제방식에 따라 결제시 이용한 결제 수단에 따라 환불하는 것을 원칙으로 합니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 15 조 (“회사”의 계약의 해제·해지)</dt>
                    <dd>
                        <p>
                            ① “회사”는 “회원”이 &lt;아이티빙서비스 이용약관&gt;의 제32조에서 정한 행위를 하였을 경우 해당 조항에 따라 사전통지 없이 계약을 해제, 해지하거나 또는 기간을 정하여 서비스이용을 제한할 수 있습니다. 
                        </p>
                        <p>
                            ② “회사”가 제1항에 따라 계약을 해제, 해지할 경우에 &lt;아이티빙서비스 이용약관&gt;의 제14조에 따라 “회원”이 얻은 이익 및 결제대행수수료를 공제하고 환급할 수 있습니다. 
                        </p>
                        <p>
                            ③ 본 조 제1항의 해제, 해지는 “회사”가 정한 통지방법에 따라 “회원”에게 그 의사표시가 도달한 때에 효력이 발생합니다. 
                        </p>
                        <p>
                           ④ “회사”의 해제, 해지 및 이용제한에 대하여 “회원”은 “회사”가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 “회사”가 인정하는 경우, “회사”는 계정을 정지한 기간만큼 이용기간을 연장합니다. 
                        </p>
                    </dd>
                </dl>
				<!-- -->
				<dl>
                    <dt>제 16 조 (서비스 이용의 취소 및 환불)</dt>
                    <dd>
                        <p>
                           ① 충전된 아이티빙캐쉬를 이용한 개별 CP가 제공하는 유료 서비스의 내용, 유료서비스 이용의 취소 등은 유료회원이 동의한 개별 유료 서비스 이용약관에 명기된 개별 조항에 따릅니다. 따라서, 개별 CP가 제공하는 서비스 내용과 관련된 문의, 서비스의 이용취소에 관련된 문의는 개별 CP 의 서비스 약관을 참조하시어 직접 개별 CP 에게 해야 합니다. 단, 본 항에 의한 환불은 해당 환불 금액에 상당하는 아이티빙캐쉬를 재충전 하는 방식으로 진행됩니다.
                        </p>
                        <p>
                            ② 아이티빙캐쉬를 충전하였으나 “회사”의 귀책사유로 이용할 서비스가 전무할 경우(단, 일시적인 서비스 점검은 제외) “회사”는 유료회원이 보유한 아이티빙캐쉬 잔액을 현금 환불해 드립니다.
                        </p>
                        <p>
                            ③ 아이티빙캐쉬의 충전이 중복으로 이루어진 경우(동일한 결제 수단으로 동일한 금액이 연속적으로 충전된 경우에 한하여 중복 충전으로 간주합니다.) 혹은 충전요청 금액에 미달할 경우 “회사”는 A)중복으로 충전된 경우에는 유료회원의 개별 요청에 의해 현금 환불하고, B) 충전요청 금액에 미달할 경우 미달된 부분을 재충전해 드립니다. 본 항에 명기된 A)와 B) 의 경우 “회사”의 홈페이지에 있는 고객센터의 안내에 따라 질의할 수 있습니다. “회사”는 유료회원의 요청이 타당한지 여부를 PG등 관련 업체에 확인 후 유료회원의 요청이 타당할 경우 현금 환불 혹은 아이티빙캐쉬를 재충전 합니다.
                        </p>
                        <p>
                            ④ 아이티빙캐쉬 결제 시스템의 이상으로 유료회원이 선택한 결제 수단에 의한 대금청구가 잘못 이루어진 경우(예를 들어 휴대폰으로 결제하였으나 실제 아이티빙캐쉬 이용대금보다 많은 액수가 휴대폰 이용 요금으로 청구된 경우) 유료회원은 “회사”의 홈페이지에 있는 고객센터를 이용하여 “회사”에게 현금 환불 혹은 재충전을 요청할 수 있습니다. “회사”는 유료회원의 요청이 타당한지 여부를 PG등 관련 업체를 통해 해당 유료회원의 아이티빙캐쉬 이용 내역 등을 확인한 후 유료회원의 주장이 타당할 경우 부당하게 청구된 부분을 유료회원의 선택에 따라 재충전 혹은 현금 환불합니다.
                        </p>
						<p>
                            ⑤ 유료회원이 충전된 아이티빙캐쉬를 이용한 유료서비스를 모두 이용 종료한 후 아이티빙캐쉬 이용 자체를 중단한다는 의사표시와 함께 잔여 아이티빙캐쉬의 반환을 요청할 경우, “회사”는 우선 유료회원의 결제 수단별 혹은 개별 유료서비스 이용별 미납액이 있는지 여부를 확인하고 미납액이 없는 경우에 한해 잔여 아이티빙캐쉬 금액을 이용자에게 현금으로 반환합니다. 본 항에 의한 해지를 원할 경우 홈페이지를 통해 “회사”의 고객센터에 해지 요청을 할 수 있습니다.
                        </p>
						<p>
                           ⑥ 기타 관련 법규상 환불 혹은 재충전이 강제되는 경우 “회사”는 관련 법규가 규정한 환불 및 재충전 방식에 의거 환불 및 재충전 합니다.
                        </p>
						<p>
                            ⑦ 아이티빙캐쉬를 이용하시려면 기본적으로 “회사” 아이디가 있어야 합니다. 유료회원이 본 조 제5항 에 의한 동의철회를 하기 전에 “회사” 아이디의 해지 신청을 할 경우 혹은 “회사”가 운영하는 서비스에서 유료회원의 아이티빙캐쉬 잔액을 파악하기 어려운 경우가 있어 원활한 해지 절차를 진행하기 어려울 수도 있으니 본 조 제5항에 의한 동의철회 절차를 반드시 먼저 진행해주시기 바랍니다. 유료회원이 본 조 제5항에 의해 아이티빙캐쉬 이용 자체에 대한 동의철회(아이티빙캐쉬를 이용한 개별 CP가 제공하는 유료서비스 전체의 이용을 중단할 경우)를 하더라도 유료회원이 “회사” 아이디로 “회사”가 제공하는 유료서비스가 아닌 다른 기타 서비스를 이용할 수 있습니다.
                        </p>
						<p>
                           ⑧ 유료회원이 충전된 아이티빙캐쉬가 아닌 신용카드를 이용하여 개별 CP가 제공하는 유료서비스를 직접 이용한 경우 이와 관련된 해지 및 환불 문제는 개별 CP가 정한 이용약관에 따릅니다. 따라서, 유료회원은 본 항과 관련된 환불 및 해지 문제는 본 약관 제 14조를 참조하기 바랍니다.
                        </p>
						<p>
                            ⑨ 다음 각호의 경우 환불이 불가합니다. 
                        </p>
						<p>
                            가. 전자상거래 등에서의 소비자보호에 관한 법률 제 17조 2항에 따라 소비자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우, 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우, 복제가 가능한 재화 등의 포장을 훼손한 경우 환불이 되지 않습니다.
                        </p>
						<p>
                            나. 다른 “회원”으로부터 선물 받은 아이티빙캐쉬는 환불이 되지 않습니다.
                        </p>
						<p>
                           다. 이벤트참여 등으로 인해 획득한 아이티빙캐쉬는 환불이 되지 않습니다.
                        </p>
						<p>
                            라. 법령에 의해 환불이 제한되는 것으로 판단하는 경우(타인의 명의도용, 범죄의 수단) 일정한 확인 절차 후 환불이 되지 않을 수 있습니다.
                        </p>
						<p>
                           ⑩ 유료회원은 해당 유료서비스 내지 상품을 전혀 사용하지 아니하였을 경우에 한하여 결제일로부터 7일 이내에 “회사”에 결제 취소(청약 철회)를 요청할 수 있습니다.
                        </p>
						<p>
                            ⑪ 유료회원이 제10항에 의하여 유료서비스 또는 상품에 대하여 청약 철회 가능한 기간(결제일로부터 7일 이내)을 경과하여 청약 철회를 신청하거나, 전자상거래 등에서의 소비자 보호에 관한 법률, 콘텐츠산업진흥법, 콘텐츠 이용자 보호지침 등 기타 관계 법령에서 정한 청약 철회 제한 사유에 해당하는 콘텐츠의 경우에 해당하는 경우에는 청약 철회가 제한됩니다.
                        </p>
						<p>
                            ⑫ “회원”이 구매한 유료서비스 또는 상품을 중도 해지한 경우, “회사”는 “회원”이 구매한 대금에서 “회원”이 실제 콘텐츠를 다운로드한 건 수, 이용한 기간 등 서비스 또는 상품을 통하여 취득한 이익을 감안, 합리적인 범위 내에서 “회사”가 적용하는 소정의 기준율을 적용하여 차감하고 환불합니다.
                        </p>
						<p>
                            ⑬ 회원이 환불을 요청하는 경우, 잔액에서 결제대행수수료 등 기타 부대비용으로 환불금액의 10%에 해당하는 환불 수수료를 공제한 금액을 환불하여 드리며 (단, 환불대상금액이 금10,000원 이하의 경우는 1,000원 공제), 환불대상금액이 1,000원 이하인 경우는 환불이 불가능합니다.
                        </p>
                    </dd>
                </dl>
				<!-- --> 

				<!-- -->
				<dl>
                    <dt>제 17 조 (환불 시 기준)</dt>
                    <dd>
                        <p>
                            ① 신용카드로 충전한 아이티빙캐쉬를 유료 서비스 이용에 전혀 사용하지 아니한 경우에는 신용카드로 충전된 금액 중 소정의 환불수수료 차감하고 타인의 구좌가 아닌 개인정보에 기재되어 있는 유료회원의 본인 계좌로 현금 지급합니다.
                        </p>
						<p>
                           ② 휴대폰으로 당월 아이티빙캐쉬를 충전한 부분을 유료 서비스 이용에 전혀 사용하지 아니하고 당월에 환불 요청할 경우에는 휴대폰으로 충전된 금액을 매출 취소합니다.
                        </p>
						<p>
                            ③ 휴대폰으로 당월 아이티빙캐쉬를 충전한 부분을 유료 서비스 이용에 전혀 사용하지 아니하고 당월 이후에(익월이 도래한 시점부터) 환불 요청할 경우에는 휴대폰으로 충전된 금액 중 소정의 환불수수료 차감하고 유료회원의 계좌로 현금 지급합니다. 
                        </p>
						<p>
                           ④ 문화상품권, 도서상품권 등으로 아이티빙캐쉬를 충전한 부분을 유료 서비스 이용에 전혀 사용하지 아니하고 당월에 환불 요청할 경우에는 문화상품권, 도서상품권 등으로 충전된 부분에 대해 전액 매출 취소합니다.
                        </p>
						<p>
                            ⑤ 문화상품권, 도서상품권 등으로 아이티빙캐쉬를 충전한 부분을 유료 서비스 이용에 전혀 사용하지 아니하고 당월 이후 (익월이 도래한 시점부터) 환불 요청할 경우에는 문화상품권, 도서상품권 등으로 충전된 금액 중 소정의 환불수수료 차감하고 유료회원의 본인 계좌로 현금 지급 합니다.
                        </p>
						<p>
                           ⑥ 현금의 반환은 “회원” 명의의 본인 계좌로만 가능하며, 계좌이체는 송금수수료를 공제한 잔액을 현금으로 반환합니다.
                        </p>
						<p>
                            ⑦ 그 외의 결제 수단은 각 결제수단별 결제취소 절차에 따릅니다. 단, 각 결제수단별로 취소 가능 기간이 지난 경우에는 송금수수료 및 결제대행 수수료를 공제한 잔액을 현금으로 반환하거나 매출 취소합니다.
                        </p>
						<p>
                           ⑧ 결제 수단별 취소가능 기간, 취소 방법 또는 취소 후 조치방법에 차이가 있을 수 있으므로 회원은 취소 시 이에 유의하여야 합니다.
                        </p>
					</dd>
				</dl>
				<!-- -->



                <dl>
                    <dt>제 18 조 (환불정책)</dt>
                    <dd>
                        <p>
                            ① “회사”는 A) “회원”이 이용신청의 철회를 요청하였으나 결제취소 처리가 불가능한 경우, B) 본 약관 제14조에 의하여 유료서비스 이용계약을 해제·해지한 경우, 또는 C) “회사”의 판단에 의해 “회원”의 자격을 상실할 경우, ⅰ) “회원”이 이용신청 철회의 의사표시를 한 날로부터, ⅱ) “회원”에게 유료서비스 이용계약 해제·해지의 의사표시에 대하여 회신한 날로부터 또는 ⅲ) “회원” 자격 상실일로부터 3영업일 이내에 결제수단과 동일한 방법으로 이를 환불조치를 취하며, 동일한 방법으로 환불이 불가능할 경우 이를 “회원”에게 사전고지합니다. 명확히 하자면, A), B), C)의 경우 ⅰ), ⅱ), ⅲ)의 날로부터 3영업일 이내에 환불조치를 합니다.   
                        </p>
                        <p>
                            ② “회사”는 “회사”의 귀책사유로 인한 환불 시에는 “회원”이 서비스 이용으로부터 얻은 이익을 공제하고 환불 조치합니다. 
                        </p>
                        <p>
                            가. TV+VOD 스트리밍 시청 정기결제 이용권 : 전체 이용대금 – (기 이용일수 X 일일 이용대금)
                        </p>
                        <p>
                            나. Only VOD 스트리밍 시청 정기결제 이용권 : 전체 이용대금 – (기 이용일수 X 일일 이용대금)
                        </p>
                        <p>
                            다. 아이티빙캐쉬 이용 정기결제 이용권 :  전체 이용대금 – (기 이용일수 X 일일 이용대금)
                        </p>
						<p>
                            라. VOD 단건 구매 : 전체 이용대금
                        </p>
                        <p>
                            ③ “회사”는 “회원”의 귀책사유로 인한 환불 시에는 본 조 제2항의 “회원”이 서비스 이용으로부터 얻은 이익을 공제하는 금액을 공제한 잔여 금액에서 위약금(10%)을 제외한 금액을 환불 조치합니다. 
                        </p>
                        <p>
                            ④ “회사”는 환불할 경우 “회원”이 신용카드 또는 전자화폐 등의 결제수단으로 이용요금을 지불한 경우에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 이용요금의 청구를 정지 또는 취소하도록 요청합니다. 다만, 본 조 제2항 및 제3항의 금액공제가 필요한 경우에는 그러하지 아니할 수 있습니다. 
                        </p>
                        <p>
                           ⑤ 본 조 제1항의 환불 대상 중 다음 각 호에 해당하는 경우에는 환불이 불가합니다. 
                        </p>
                        <p>
                            가. 선물 받은 아이템을 보유하고 있는 경우 
                        </p>
                        <p>
                           나. 기타 “회원”이 직접 충전하지 않은 경우 
                        </p>
                        <p>
                           ⑥ 아이티빙캐쉬의 충전 및 이에 대한 약정을 전제로 하여 보너스로 제공되는 사항에 대하여는 환불이 되지 않으며 해당 충전금액을 환불하는 경우 이미 사용한 보너스 내역은 환불잔액에서 차감 됩니다. 
                        </p>
                        <p>
                            ⑦ 이벤트 당첨자는 해당 이벤트와 관련된 결제 금액을 전액 사용시에만 탈퇴 및 환불이 가능 합니다. “이용자”의 귀책 사유로 인하여 부득이 탈퇴할 경우 이벤트 비용을 차감하고 환불됩니다. 
                        </p>
                        <p>
                            ⑧ 기결제된 결제금액 또는 결제취소가 불가능한 결제금액의 환불 신청 시에는 해당 요금의 정상납입 확인 후 환불조치가 가능하며, 결제취소기간 내 환불 의사를 밝힌 경우에는 결제취소처리를 우선적으로 고려하여 처리할 수 있습니다. 
                        </p>
                        <p>
                            ⑨ 환불 받을 금융기관 계좌의 예금주 명의와 아이티빙에 등록된 “회원” ID의 명의가 동일한 경우에만 입금하여 드립니다. 단 해외금융기관의 계좌인 경우에는 환불이 불가능합니다. 
                        </p>
                        <p>
                            ⑩ 개인정보 도용 및 결제정보 도용 또는 부정결제 등으로 인한 경우에는 환불되지 않으며, 해당 경우의 결제자 개인정보 요구 및 확인은 관계법령에 근거한 수사기관의 정당한 요청을 통해서만 확인이 가능합니다. 
                        </p>
                        <p>
                            ⑪ 환불 입금은 제1항에 기재된 각 날로부터 3영업일이내에 하는 것을 원칙으로 합니다. 다만, 후불제 결제수단 (신용카드, 휴대전화) 등을 이용해서 결제하신 경우에는 해당 결제내역의 입금사실이 3개월 이내에 확인 가능하므로 해당 기간만큼 환불처리기간이 추가로 소요될 수 있습니다. 
                        </p>
                        <p>
                           ⑫ 환불 시에는 “회원”이 결제한 금액에 대해 납부영수증 등으로 이용요금의 납부여부를 확인한 후 환불 처리를 합니다. 이용요금의 납부여부의 확인이 불가능한 경우 환불이 불가능할 수 있으니 결제와 관련된 납부영수증 등의 증빙자료 보관에 유념하시기 바랍니다. 
                        </p>
                        <p>
                            ⑬ “회원” 탈퇴 및 환불요청 시 “회원”의 오기(誤記) 등의 귀책사유로 인해 발생하는 불이익에 대해서 “회사”는 책임을 지지 않습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 19 조 (손해배상 범위)</dt>
                    <dd>
                        <p>
                            ① 아이티빙의 아이티빙캐쉬 및 유료서비스 제공과 관련하여 “회사”의 귀책사유로 “회원”에게 손해가 발생한 경우 “회사”는 “회원”에게 발생한 손해를 배상하여야 합니다.
                        </p>
                        <p>
                            ② “회원”이 본 약관상의 의무를 위반함으로 인하여 “회사”에 손해가 발생한 경우 또는 “회원”이 아이티빙캐쉬 또는 유료서비스를 이용함에 있어 “회사”에 손해를 입힌 경우, “회원”은 “회사”에 그 손해를 배상하여야 합니다. 
                        </p>
                        <p>
                            ③ “회사”는 서비스의 신뢰에 기인한 손실 등, 여타 간접적인 이익의 손실 법적 손해배상이 인정되지 아니하는 손해에 대하여서는 어떠한 책임도 없음을 알려드립니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 20 조 (면책) </dt>
                    <dd>
                        <p>
                            ① “회사”는 다음 각 호의 사유로 인하여 “회원” 또는 제3자에게 발생한 손해에 대하여는 그 책임을 지지 아니합니다. 
                        </p>
                        <p>
                            가. 천재지변 또는 이에 준하는 불가항력으로 인해 아이티빙캐쉬 또는 유료서비스를 제공할 수 없는 경우 
                        </p>
                        <p>
                           나. “회원”이 자신의 아이디 또는 비밀번호 등의 관리를 소홀히 한 경우 
                        </p>
                        <p>
                            다. “회사”의 관리영역이 아닌 공중통신선로의 장애로 서비스이용이 불가능한 경우 
                        </p>
                        <p>
                            라. 기타 “회사”의 귀책사유가 없는 통신서비스 등의 장애로 인한 경우 
                        </p>
                        <p>
                            ② “회사”는 “회원”에게만 유료서비스를 제공하므로, “회원”이 아이티빙캐쉬 또는 유료서비스를 이용하여 제3자에게 유료서비스를 제공함으로써 얻으려고 하는 수익 등 기타 “회원”이 유료서비스를 이용하는 방법으로 기대하는 수익을 상실한 것에 대하여 책임을 지지 않습니다. 
                        </p>
                        <p>
                            ③ “회사”는 “회원” 상호간 또는 “회원”과 제3자 상호간에 아이티빙캐쉬 또는 유료서비스와 관련하여 발생한 분쟁에 대하여 개입할 의무가 없으며, “회사”에 귀책사유가 없는 한 이로 인하여 발생한 손해를 배상할 책임이 없습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 21 조 (과오금) </dt>
                    <dd>
                        <p>
                            ① “회사”는 과오금이 발생한 경우 이용대금의 결제와 동일한 방법으로 과오금 전액을 환불하여야 합니다. 다만, 동일한 방법으로 환불이 불가능할 때는 이를 사전에 고지합니다. 
                        </p>
                        <p>
                            ② “회사”의 책임 있는 사유로 과오금이 발생한 경우 “회사”는 계약비용, 수수료 등에 관계없이 과오금 전액을 환불합니다. 다만, “회원”의 책임 있는 사유로 과오금이 발생한 경우, “회사”가 과오금을 환불하는 데 소요되는 비용은 합리적인 범위 내에서 “회원”이 부담하여야 합니다. 
                        </p>
                        <p>
                           ③ “회사”는 “회원”이 주장하는 과오금에 대해 환불을 거부할 경우에 정당하게 이용대금이 부과되었음을 입증할 책임을 집니다. 
                        </p>
                        <p>
                            ④ “회사”는 과오금의 환불절차를 "콘텐츠 이용자 보호지침"에 따라 처리합니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 22 조 (콘텐츠 하자 등에 의한 “회원” 피해보상) </dt>
                    <dd>
                        <p>
                            “회사”는 유료서비스의 하자 등에 의한 “회원”피해보상의 기준, 범위, 방법 및 절차에 관한 사항을 "콘텐츠 이용자 보호지침"에 따라 처리합니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 23 조 (“회사”의 의무) </dt>
                    <dd>
                        <p>
                            ① “회사”는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있으나 전쟁, 지진, 재난 등 천재지변이나 불가피한 시스템의 고장, 통신서비스 “회사”의 통신 두절 등 불가항력의 사유가 발생한 경우에는 일시적으로 서비스를 중단할 수 있습니다. 
                        </p>
                        <p>
                            ② “회사”는 PG업체의 귀책사유로 “회원”의 아이티빙캐쉬 사용에 문제가 발생할 경우 PG업체의 고객지원 업무는 보조하나 이에 대한 법적 책임은 없음을 알려드립니다. “회사”는 아이티빙캐쉬와 관련된 전반적인 고객지원 업무를 수행합니다. 단, 다음에 명기된 고객지원 업무는 해당 업체의 책임 하에 진행 되오니 직접 문의하시기 바랍니다. 개별CP또는 PG업체의 연락처는 고객센터 페이지에 별도의 란을 통해 공지합니다. 
                        </p>
						<p>
							가. 충전된 아이티빙캐쉬를 이용하여 개별 CP의 유료 서비스를 이용하던 중 발생한 서비스 자체에 대한 문의 및 해지/환불 이슈 등 : 해당 CP에 문의하시기 바랍니다. 
						</p>
						<p>
							나. 충전된 아이티빙캐쉬를 이용하지 아니하고 신용카드를 이용하여 CP의 유료 서비스 이용과 관련된 모든 문의 (해지/환불 포함) : 해당 CP에 문의하시기 바랍니다.
						</p>
						<p>
							다. 신용카드를 이용하여 아이티빙캐쉬 충전함에 있어 문제가 발생한 경우 (환불/해지 제외) : 해당PG업체에 문의하시기 바랍니다.
						</p>
						<p>
							라. 휴대폰, 문화상품권, 도서상품권 등을 이용하여 아이티빙캐쉬를 충전함에 있어 문제가 발생한 경우(환불/해지 제외) : 해당PG업체에 문의하시기 바랍니다.
						</p>
						<p>
							③ “회사”가 개별 CP의 자격으로 제공하는 유료서비스의 경우 (“회원”은 유료 서비스 별 약관을 통해 유료 서비스의 제공 주체를 확인할 수 있습니다) “회원”이 요청한 경우에 한해 세금계산서를 발행합니다. “회사”가 아닌 개별 CP가 제공하는 유료서비스 이용과 관련된 세금계산서 발행 요청은 해당 CP에게 직접 문의 해야 합니다.
						</p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 24 조 (“유료회원”의 의무) </dt>
                    <dd>
                        <p>
                           ① “유료회원”은 “회원”이 “회사”가 정한 소정 양식에 따라 요청하는 최소한의 개인 인적 사항을 제공하여 이용신청을 합니다. 
                        </p>
                        <p>
                           ② “유료회원”은 신상정보의 변경이 있을 시, 개인정보변경 메뉴를 통해 직접 수정하여야 하며, 변경을 태만히 함으로써 발생한 손해의 책임은 이용자에게 있습니다. 
                        </p>
                        <p>
                            ③ “유료회원”은 “회사”의 명시적인 승인 없이 유료서비스를 이용한 어떠한 영리행위도 할 수 없습니다. 만약 “유료회원”의 영리 행위로 인해 “회사” 및 제3자에게 손해가 발생할 경우 “유료회원”이 전적으로 모든 책임을 부담합니다. 
                        </p>
                        <p>
                            ④ “유료회원”은 아이티빙캐쉬를 이용하여 유료 서비스를 이용할 경우 본 약관을 준수하여야 합니다. 만약 “유료회원”이 약관을 위반하는 행위를 할 경우 “회사”는 사전 통지 없이 이용 계약을 해지하거나 또는 유예 기간을 두고 “유료회원”의 서비스 이용을 중지할 수 있습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 25 조 (분쟁의 해결) </dt>
                    <dd>
                        <p>
                           ① “회사”는 “회원”이 제기하는 의견이나 불만에 대하여 적절하고 신속하게 처리하고, 그 결과를 통지합니다. 다만 신속한 처리가 곤란한 경우에 “회사”는 “회원”에게 그 사유와 처리일정을 통보합니다. 
                        </p>
                        <p>
                            ② “회사”는 “회원”이 제기한 의견 등이 정당하지 않음을 이유로 처리하지 않은 경우 이의 사유를 통보합니다. 
                        </p>
                        <p>
                            ③ “회사”와 “회원” 사이에 분쟁이 발생한 경우 “회사” 또는 “회원”은 콘텐츠산업진흥법 제 30조에 따라 콘텐츠분쟁조정위원회에 분쟁조정을 신청할 수 있습니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 26 조 (재판관할) </dt>
                    <dd>
                        <p>
                            ① 아이티빙캐쉬 또는 유료서비스 이용과 관련하여 “회사”와 “회원” 사이에 분쟁이 발생한 경우, “회사”와 “회원”은 분쟁의 해결을 위해 성실히 협의합니다 
                        </p>
                        <p>
                           ② 한국에 거주하는 “회원”의 경우, 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우, “회원”의 주소를 관할하는 지방법원을 관할법원으로 합니다. “회원”의 주소가 없는 경우, 또는 한국 이외의 경우, 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우, “회사”의 주소에 가장 가까운 지방 법원을 관할법원으로 합니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>제 27 조 (약관의 해석 등) </dt>
                    <dd>
                        <p>
                          본 약관에 정하지 아니한 사항과 본 약관의 해석에 관하여는 상위 약관인 아이티빙 서비스 이용약관과 개별 유료서비스 이용약관, 디지털콘텐츠산업진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 콘텐츠 이용자 보호지침, 기타 관계법령 또는 상관례에 따릅니다. 
                        </p>
                    </dd>
                </dl>
                <dl>
                    <dt>&lt;부칙&gt;</dt>
                    <dd>
                        <p>
                            본 약관은 2019년 9월 30일부터 적용합니다.
                        </p>
                    </dd>
                </dl>
            </div>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('legal_charge_layer');">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('legal_charge_layer');">닫기</a>
    </div>
</div>






<div class="layer" style="top:35px; display: none;" id="legal_payinfo_layer">
    <div class="inner">
        <h3>결제정보 제공 동의</h3>
        <div class="legal">
            <div class="article">
                <dl>
                    <dd>CJ올리브네트웍스 주식회사가 결제서비스와 관련하여 본인으로부터 취득한 개인정보는 “정보통신망 이용촉진 및 정보보호등에 관한 법률” 및 “신용정보의 이용 및 보호에 관한 법률”에 따라 본인의 동의를 얻어 다음의 목적을 위해 제공 및 위탁합니다.</dd>
                </dl>
                <dl>
                    <dt>■ 개인정보 제3자 제공 및 취급위탁 동의</dt>
                    <dd>
                        1. 개인정보 제3자 제공<br> CJ올리브네트웍스 주식회사는 수집한 개인정보를 이용자의 사전 동의 없이 제3자에게 제공하지 않습니다. 단 아래의 경우에는 예외로 합니다.<br> - 서비스 제공에 따른 요금정산을 위한 경우<br> - 법령에 규정하거나, 수사 등의 목적으로 법령에 정해진
                        절차에 의하여 수사기관 등이 요청한 경우<br> 2. 개인정보 취급위탁<br> - 수탁사<br> SKT, SKB, KT, LGU+, SKM&amp;C, 신용카드사(비씨, 국민, 신한, 삼성, 현대, 외환, NH농협, 하나Sk, 롯데), 금융결제원, 케이아이비넷, 한국문화진흥, 한국도서보급,
                        해피머니아이엔씨, 아이앤플레이, 티모넷, 이니시스<br> - 위탁 목적<br> 구매상품 결제 및 결제와 관련된 서비스 제공<br> CJ올리브네트웍스 주식회사는 " 개인정보보호법" 에 따라 고유식별정보를 다음과 같이 처리합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>■ 고유식별정보 처리 동의</dt>
                    <dd>
                        1. 이용항목: 주민등록번호 앞 7자리 (생년월일 + 성별)<br> 2. 이용목적: 구매상품 결제 및 결제와 관련된 서비스 제공<br> 3. 보유 및 이용기간:<br> 고유식별정보는 이용 목적이 달성되면 지체 없이 파기하며 보유하지 않습니다. 단 관계법령에 의하여 보존의무가 있는 경우에는 그에 따릅니다.
                    </dd>
                </dl>
            </div>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('legal_payinfo_layer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('legal_payinfo_layer')">닫기</a>
    </div>
</div>

<div class="layer" style="top: 35px; display: none;" id="legal_ecommerce_layer">
    <div class="inner">
        <h3>전자금융거래 약관</h3>
        <div class="legal">
            <div class="article">
                <dl>
                    <dt>제1조 목적</dt>
                    <dd>이 약관은 주식회사 케이지모빌리언스(이하 "회사"라 함)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.</dd>
                </dl>
                <dl>
                    <dt>제2조 (용어의 정의)</dt>
                    <dd>
                        이 약관에서 정하는 용어의 정의는 다음과 같습니다. <br> 1. "전자금융거래"라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 "전자금융거래 서비스"라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를
                        이용하는 거래를 말합니다. <br> 2. "전자지급결제대행서비스"라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다. <br> 3. “결제대금예치서비스”라 함은 선불식 통신판매에
                        있어서, 회사가 이용자가 지급하는 결제대금을 예치하고 배송이 완료 또는 서비스 이용 확인 후, 재화 또는 용역의 대금을 판매자에게 지급하는 제도를 말합니다.<br> 4. "이용자"라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.<br> 5.
                        "접근매체"라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), "전자서명법"상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를
                        사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다. <br> 6. "거래지시"라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다. <br> 7. "오류"라 함은 이용자의 고의
                        또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.<br> 8. “선불식 통신판매”라 함은 이용자가 재화 또는 용역을 공급받기 전에 미리 대금의 전부 또는 일부를 지급하는 대금 지급 방식의 통신판매를 말합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제3조 (약관의 명시 및 변경)</dt>
                    <dd>
                        1. 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.<br> 2. 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다. <br> 3. 회사가 약관을 변경하는
                        때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제4조 (전자지급결제대행서비스의 종류)</dt>
                    <dd>
                        회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다. <br> 1. 신용카드 결제대행 서비스 : 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는
                        서비스를 말합니다.<br> 2. 계좌이체대행서비스: 이용자가 결제대금을 현금으로 결제하고자 할 경우 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 결제대금을 출금하여 결제가 이루어지도록 회사가 제공하는 결제대행서비스를 말합니다.<br> 3. 가상계좌서비스: 이용자가 결제대금을
                        현금으로 결제하고자 할 경우 회사의 전자결제시스템을 통하여 부여받은 이용자 고유의 일회용 계좌(가상계좌)를 통해 결제대금을 납부하여 결제가 이루어지도록 회사가 제공하는 결제대행서비스를 말합니다.<br> 4. 회사가 제공하는 서비스로써 지급결제수단의 종류에 따라 ‘상품권결제대행서비스’,
                        ‘교통카드결제대행서비스’ 등이 있습니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제5조 (결제대금예치서비스의 내용)</dt>
                    <dd>
                        1 이용자(이용자의 동의가 있는 경우에는 재화 또는 용역을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 또는 용역을 공급받은 사실을 재화 또는 용역을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.<br> 2. 회사는 이용자로부터 재화 또는 용역을 공급받은 사실을 통보 받은 후
                        회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.<br> 3. 회사는 이용자가 재화 또는 용역을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수
                        있습니다.<br> 4. 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급 받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제6조(이용 시간)</dt>
                    <dd>
                        1. 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.<br> 2. 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이
                        불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제7조 (접근매체의 선정과 사용 및 관리)</dt>
                    <dd>
                        1. 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다. <br> 2. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다. <br> 3. 이용자는 자신의 접근매체를
                        제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제8조 (거래내용의 확인)</dt>
                    <dd>
                        1. 회사는 이용자와 미리 약정한 전자적 방법 또는 www.t-money.co.kr(T cash/T-money 결제대행서비스의 경우)에서 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주
                        이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.<br> 2. 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적
                        장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는
                        거래내용에서 제외됩니다. <br> 3. 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다. <br> * 주소 : 경기도 성남시 분당구 삼평동 670 유스페이스1 A동 5층<br> * 이메일 주소 :
                        help@mobilians.co.kr<br> * 전화번호 : 1600-0523
                    </dd>
                </dl>
                <dl>
                    <dt>제9조 (오류의 정정 등)</dt>
                    <dd>
                        1. 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다. <br> 2. 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제10조 (회사의 책임)</dt>
                    <dd>
                        1. 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다.<br> 2. 회사가 접근매체의 발급주체이거나 사용, 관리주체인 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여
                        배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그러하지 아니합니다. <br> 3. 회사는 계약체결 또는
                        거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본 조 제2항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여
                        보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다. <br> 4. 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서
                        이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제11조 (전자지급거래계약의 효력)</dt>
                    <dd>
                        1. 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.<br> 2. 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제12조 (거래지시의 철회)</dt>
                    <dd>
                        1. 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.<br> 2. 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래 지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌의 원장에 입금기록이 끝난 때
                        (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래 지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제13조 (전자금융거래 기록의 생성 및 보존)</dt>
                    <dd>
                        1. 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.<br> 2. 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제14조 (전자금융거래정보의 제공금지)</dt>
                    <dd>회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다. 다만, [금융실명거래 및 비밀보장에 관한 법률]
                        제4조제1항 단서의 규정에 따른 경우 또는 그 밖에 다른 법률에서 정한 경우에는 이용자의 동의 없이 제공할 수 있습니다.</dd>
                </dl>
                <dl>
                    <dt>제15조 (분쟁처리 및 분쟁조정)</dt>
                    <dd>
                        1. 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.<br> 담당자 : 고객센터<br> 연락처(전화번호, 전자우편주소) : <br> 02)2018-2120,
                        help@mobilians.co.kr<br> 2. 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다. <br> 3. 이용자는 '금융위원회의 설치 등에 관한 법률'에 따른 금융감독원의 금융분쟁조정위원회나
                        '소비자기본법'에 따른 한국소비자원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
                    </dd>
                </dl>
                <dl>
                    <dt>제16조 (회사의 안정성 확보 의무)</dt>
                    <dd>회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.</dd>
                </dl>
                <dl>
                    <dt>제17조 (약관외 준칙 및 관할)</dt>
                    <dd>
                        1. 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 여신전문금융업법등 소비자보호 관련 법령에서 정한 바에 따릅니다.<br> 2. 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
                    </dd>
                </dl>
            </div>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('legal_ecommerce_layer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('legal_ecommerce_layer')">닫기</a>
    </div>
</div>
<div class="layer" style="display: none;" id="legal_personal_layer">
    <div class="inner">
        <h3>개인정보 수집 동의</h3>
        <div class="policy pi">
            <p>CJ올리브네트웍스 주식회사가 결제서비스와 관련하여 본인으로부터 취득한 개인정보는 “정보통신망 이용촉진 및 정보보호등에 관한 법률” 및 “신용정보의 이용 및 보호에 관한 법률”에 따라 본인의 동의를 얻어 다음의 목적을 위해 수집 및 이용합니다.</p>
            <h4>개인정보 수집 및 이용 동의</h4>
            <ol>
                <li><strong>1. 개인정보의 수집 및 이용 목적</strong> : <span>구매상품 결제 및 결제와 관련된 서비스 제공</span></li>
                <li><strong>2. 수집하는 개인정보의 항목</strong> : <span>휴대폰번호, 가입통신사, 유선전화번호, 주민등록번호 앞 7자리 (생년월일 + 성별)</span></li>
                <li><strong>3. 개인정보의 보유 및 이용 기간</strong> : <span> 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보유합니다.<br> 가. 보존하는 항목:
					휴대폰번호, 가입통신사, 주민등록번호 앞 7자리 (생년월일+성별), 유선전화번호.<br> 나. 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 전자금융거래법에 의거한 보존 의무: 5년</span>
                </li>
            </ol>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('legal_personal_layer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('legal_personal_layer')">닫기</a>
    </div>
</div>
<div class="layer" style="display: none;" id="legal_ssn_layer">
    <div class="inner">
        <h3>고유식별정보 처리 동의</h3>
        <div class="policy">
            <p>
                CJ올리브네트웍스 주식회사는 "개인정보보호법"에 따라<br>고유식별정보를 다음과 같이 처리합니다.
            </p>
            <h4>고유식별정보 처리 동의</h4>
            <ol>
                <li><strong>1. 이용항목</strong> : 주민등록번호 앞 7자리 (생년월일 + 성별)</li>
                <li><strong>2. 이용목적</strong> : 구매상품 결제 및 결제와 관련된 서비스 제공</li>
                <li><strong>3. 보유 및 이용기간</strong> : <span>고유식별정보는 이용 목적이 달성되면 지체 없이 파기하며 보유하지 않습니다.<br> 단 관계법령에 의하여 보존의무가 있는 경우에는<br> 그에 따릅니다.
			</span></li>
            </ol>
        </div>
        <a href="#" class="close" onclick="alertLayerCloseById('legal_ssn_layer')">닫기</a> <a href="#" class="win" onclick="alertLayerCloseById('legal_ssn_layer')">닫기</a>
    </div>
</div>


<div id="popAnsimPin" style="display:none;">
    <div class="dimmed"></div>
    <div class="cell_pop">
        <h3>안심결제 비밀번호 안내</h3>

        <div class="con">
            <dl>
                <dt>휴대폰 안심결제란?</dt>
                <dd>휴대폰 안심결제는 안전한 휴대폰 소액결제를 위해<br>서비스 가입 시, 본인이 설정한 4자리 숫자의 비밀번호로 추가 결제 인증을 하는 서비스입니다.</dd>
            </dl>
            <dl>
                <dt>언제 이용하나요?</dt>
                <dd>휴대폰 소액 결제를 위한 인증 번호 입력 시, 안심결제 비밀번호도 함께 입력하시면 됩니다.</dd>
            </dl>
            <dl>
                <dt>비밀번호 잠금/분실 시 어떻게 하나요?</dt>
                <dd>휴대폰 안심 결제 서비스를 가입한 회사의 고객센터로 연락하여도 재설정 해야 합니다.</dd>
            </dl>
            <a href="#" onclick="$('#popAnsimPin').hide();" class="cls">닫기</a>
            <a href="#" onclick="$('#popAnsimPin').hide();" class="xbt">닫기</a>
        </div>
    </div>
</div>

<div id="popSktPin" style="display:none;">
    <div class="dimmed"></div>
    <div class="cell_pop">
        <h3>소액결제 비밀번호 안내</h3>

        <div class="con">
            <dl>
                <dt>소액결제 비밀번호란?</dt>
                <dd>소액결제 비밀번호는 안전한 휴대폰 소액결제를 위해 미리 설정한 번호로 추가 결제 인증을 하는 서비스입니다.</dd>
            </dl>
            <dl>
                <dt>언제 이용하나요?</dt>
                <dd>휴대폰 소액결제의 결제 정보 입력 시 소액결제 비밀번호도 함께 입력하시면 됩니다.</dd>
            </dl>
            <dl>
                <dt>비밀번호 잠금/분실 시 어떻게 하나요?</dt>
                <dd>휴대폰 안심 결제 서비스를 가입한 회사의 고객센터로 연락하여도 재설정 해야 합니다.</dd>
            </dl>
            <a href="#" onclick="$('#popSktPin').hide();" class="cls">닫기</a>
            <a href="#" onclick="$('#popSktPin').hide();" class="xbt">닫기</a>
        </div>
    </div>
</div></body></html>