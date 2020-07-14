<%@page import="com.proj3.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" style="" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"><head><script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=AW-931058540&amp;l=dataLayer&amp;cx=c"></script><script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>ITVING｜마이아이티빙</title>
<meta name="Author" content="CJ ENM">
<meta name="description" content="마이티빙">

<!-- naver web master tool -->
<meta name="naver-site-verification" content="812a99b3ebc03f59de55c39007c877263955564c">

<!-- facebook -->
<meta property="fb:app_id" content="167597706623778">
<meta property="og:site_name" content="www.tving.com">
<meta property="og:title" content="TVING｜마이티빙">
<meta property="og:description" content="마이티빙">
<meta property="og:url" content="https://www.tving.com">
<meta property="og:image" content="https://image.tving.com/public_v6/portal/img/common/tving_log.jpg">

<meta property="og:type" content="video.other">
<meta property="og:video:type" content="application/x-shockwave-flash">
<meta property="og:video:url" content="/">
<meta property="og:video:width" content="1280">
<meta property="og:video:height" content="720">


<!-- mobile web alert -->
<link rel="“alternate”" href="“http://m.tving.com”">
<link rel="shortcut icon" href="https://image.tving.com/theme/tving_new/img/logo/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="https://image.tving.com/public_v6/static/lib/jquery/jquery.bxslider.min.4.2.15.css?v=108">  
<link rel="stylesheet" type="text/css" href="https://image.tving.com/public_v6/portal/css/typography.css?v=108">
<link rel="stylesheet" type="text/css" href="https://image.tving.com/public_v6/portal/app.css?v=108">

<script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-K9Q8F7B"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/jquery/jquery-1.12.3.min.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/jquery/jquery.cookie.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/jquery/jquery.easing.1.3.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/jquery/jquery.scrollbar.min.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/momentjs/moment.min.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/momentjs/moment.lang.ko.js?v=108"></script>

<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.core-1.0.js?apiKey=1e7952d0917d6aab1f0293a063697610&amp;v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.media-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.operator-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.community-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.my-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.infra-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/jarvis.smr-1.0.js?v=108"></script>

<script type="text/javascript" src="https://image.tving.com/public_v6/static/common.util-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/json2/json2.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/user-agent/ua_parser.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/user-agent/ua-parser.min.js?v=108"></script>

<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/clientjs/client.min.js?v=108"></script>

<script type="text/javascript" src="https://image.tving.com/public_v6/portal/js/script.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/portal/js/common/page.common.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/portal/js/common/nethru_script.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/marpple/partial.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/portal/js/common/cja_common.js?v=108"></script>

<link rel="stylesheet" type="text/css" href="https://image.tving.com/public_v6/portal/css/my.css?v=108">
<link rel="stylesheet" type="text/css" href="https://image.tving.com/public_v6/portal/js/my/page.my.main.js?v=108">

<title>TVING｜TV를 더 즐겁게</title>
<meta name="Author" content="CJ ENM">
<meta name="description" content="국내 최초 N스크린 동영상 서비스 티빙">

</head>
<body data-n-head="">
<div id="wrap" class="page-membership">
	
<!--[s] header -->
<header id="header" class="page-my-user-confirmPassword.do">
	<div id="top-gnb">
		<div class="top-wrap">
			<nav id="topUtil" class="top-util">

			</nav>
		</div>
	</div>

  	<div id="gnb">
    	<div class="inner-wrap">
			<h1><img onclick="javascript:location.href='<%=cp%>/itving/main.do'" alt="" src="<%=cp%>/proj3/itving/logo2.jpg" width="300" height="20"/></h1>
			<nav id="gnbMenu" class="gnb-menu">
               <h2>
					<a href="<%=cp %>/itving/login.do" data-sub="#gnbChannel" data-nethru_clcode="A000002"
						class="nuxt-link-exact-active">게임</a>
				</h2>
				<h2>
					<a href="<%=cp %>/itving/login.do" data-sub="#gnbProgram" data-nethru_clcode="A000003">드라마</a>
				</h2>
				<h2>
					<a href="<%=cp %>/itving/login.do" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">예능</a>
				</h2>
				<h2>
					<a href="<%=cp %>/itving/login.do" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">스포츠</a>
				</h2>
				<h2>
					<a href="<%=cp %>/itving/login.do" data-sub="#gnbMovie"
						data-nethru_clcode="A000004">영화</a>
				</h2>
				<h2>
					<a href="<%=cp %>/itving/login.do" data-sub="#gnbMovie" data-nethru_clcode="A000004"
						class="">커뮤니티</a>
				</h2>
      		</nav>
    	</div>
	</div>
</header>
<!--[e] header -->
<script type="text/javascript">

    $(function(){
        if(user_yn){
            //Recommend.init();
            //$('#gnbRecommend_login .main-contents02').show();
        }
    	// gnb 서브메뉴 on클래스 적용
    	var requestUri = "/my/user/confirmPassword.do";
    	var $target = $("#header .gnb-sub a[href='" + requestUri + "']");
    	$target.addClass("on");
    	$target.closest("div").show();
    	$target.closest("div").find("ul").css('opacity', 1);

        $('#login-btn, #login-btn2').click( function(e){
            pd(e);
            goLoginPage();
        });

        $('#logout-btn').click( function(e){
        	pd(e);
            logout('http%3A%2F%2Fwww.tving.com%2Fmain.do');
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
        function mainMenuMouseLeaveEventHandler(){
            isOver = false;
            var _this = overTarget;
            var dur = 200;

            if(!_this) return;

            setTimeout(function(){
                if(!isOver){
                   	var requestUri = "/my/user/confirmPassword.do";
                   	if(
                   		(
                   		(requestUri.indexOf('player') == -1) || (requestUri.indexOf('pick') >= 0) ) && (requestUri.indexOf('/main.do') == -1)
                   		) {
                    	var $onDom = $("#header .gnb-sub a[href='" + "/my/user/confirmPassword.do" + "']");

                    	if(requestUri.indexOf("smr") != -1) {
                    		$onDom = $("#header .gnb-sub a[href='/pick/channel/main/main']");
                    	}

                       	 if(requestUri.indexOf("/movieList") > -1 || requestUri.indexOf("/vod/recommend/") > -1) {
                			var requestUriArray = requestUri.split("/");
                			requestUri = "/"+requestUriArray[1] + "/" + requestUriArray[2];

                			$onDom = $("#header .gnb-sub a[href='"+requestUri+"']");
                       	}

                    	var divId = $onDom.closest("div").attr("id");

                    	if(requestUri.indexOf('/kids/') > -1) { //하위메뉴가 없을경우 여기 예외 추가 하위메뉴가 생기면 제거.
                    		divId = 'gnbKids';
                    	}

                    	$("#gnbMenu").find("a").removeClass("on");
                    	$curMenu.addClass("on");//어디에도 속하지 못하는 URL 예외 케이스 방어 추가(대부분 픽클케이스) , 1depth 메뉴 하이라이트 유지
                    	$("#gnbMenu").find("a[data-sub='#"+divId+"']").addClass("on");

                    	$("#gnbMenu a").each(function(index, data) {
                    		if($(this).hasClass("on")) {
                    			var $this = $(this);
                                $(".gnb-sub > div").hide();
                                $(".gnb-sub > div").find("ul").css("opacity", 0);
                                $("#gnbMenu a").removeClass("on");
                                $(this).addClass("on");

                                $($(this).data("sub")).stop(true , true);
                                $($(this).data("sub")).find("ul").stop(true , true);

                                $(".gnb-sub").show();
                                $($(this).data("sub")).show();
                                $($(this).data("sub")).find("ul").css('opacity', 1);
                    		}
                    	});
   					} else {
   						$(_this.data("sub")).find("ul").animate({opacity: 0}, 200);
   						  $(_this.data("sub")).slideUp("fast" , function(){
   	                            $(".gnb-sub").hide();
   	                            $("#gnbMenu a").removeClass("on");
   						  });
   					}
                }
            },dur);
        }

        $('#tv-mode-btn').click(function(e) {
            e.preventDefault();

            var path = '';


            if (global && global.media_code) {

                if (global.smr_category_code) {

                    if (/^S/.test(global.smr_category_code)) {
                        if (typeof  getFlashObject != 'undefined') {
                            if (typeof  getFlashObject("tving-player") != 'undefined') {
                                getFlashObject("tving-player").flashCall("pause", null);
                            }
                        }
                        path = getSmrPlayerPath(global.smr_category_code, global.media_code, 'tv');
                    }

                    if (/^P/.test(global.smr_category_code)) {
                        path = getSmrPlayerPath(global.smr_category_code, global.media_code, 'tv');
                    }

                }else {
                    if (/^E/.test(global.media_code)) {
                        if (global.body.episode.drm_yn == 'Y') {
                        } else {
                            if (typeof  getFlashObject != 'undefined') {
                                if (typeof  getFlashObject("tving-player") != 'undefined') {
                                    getFlashObject("tving-player").flashCall("pause", null);
                                }
                            }
                        }
                    }

                    if (/^C/.test(global.media_code)) {
                        //if (global.media_code == 'C04601' || global.media_code == 'C07381' || global.media_code == 'C07382') {
                        if(pageBaseController.parameters.common_params.channel_drm_code.indexOf(global.media_code) >= 0){
                        } else {
                            if (typeof  getFlashObject != 'undefined') {
                                if (typeof  getFlashObject("tving-player") != 'undefined') {
                                    getFlashObject("tving-player").flashCall("pause", null);
                                }
                            }
                        }
                    }

                    if (/^M/.test(global.media_code)) {
                        if (global.body.movie.drm_yn == 'Y') {
                        } else {
                            if (typeof  getFlashObject != 'undefined') {
                                if (typeof  getFlashObject("tving-player") != 'undefined') {
                                    getFlashObject("tving-player").flashCall("pause", null);
                                }
                            }
                        }
                    }

                    path = getPlayerPath(global.media_code, 'tv');
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
<script type="text/javascript" src="https://image.tving.com/public_v6/static/common.search-1.0.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/billing/js/infra.billing.pc.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/lib/jquery/jquery.placeholders.min.js?v=108"></script>
<script type="text/javascript" src="https://image.tving.com/public_v6/static/common.recommend-1.0.js?v=108"></script>

<main>	
<!--[s] contents -->
<div class="inner-pwd container" id="contents-wrap">
    <div class="sub-contents-wrap inner-wrap">
        <form action="/my/user/confirmPasswordProc.do" name="frmChk" id="frmChk" method="post">
            <div class="title-group">
                <h3 class="large">회원 가입 완료</h3>
            </div>
            <section class="coupon-regist-box">
                <h4>회원 가입을 축하합니다!</h4>
                
				<div id="login01" class="tab-contents-login" align="center" style="padding-top: 1rem;">
					<div class="login-form" style="width: 10%;">
						<a href="<%=cp %>/itving/login.do" id="doLoginBtn">다음</a>
					</div>
				</div>
            </section> 
        </form>
    </div>
</div>
<!--[e] contents -->
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