/**
 * Created by style0924 on 2014. 6. 3..
 */
var itving_path = window.location.pathname;
var itving_host = window.location.host;

/*
function Enter_Check(){
    // 엔터키의 코드는 13입니다.
	if(event.keyCode == 13) {
		window.location = hidList.value + '&searchvalue=' + autocomplete.value;
		//window.location = '/itving/itving/videoList.do?searchvalue=' + autocomplete.value;
	}
}
*/

var Search = {
    config: {
        mode: 'normal',
        obj: null,
        id: 'autocomplete',
        current: 0,
        active: false,
        last: null,
		test: false,
		domain: '//search.tving.com'
    },
    init: function(mode, keyword) {
		Search.config.domain = Search.searchUrl();
        Search.config.obj = $('#autocomplete');
        Search.config.mode = mode;

        // 추천 검색어 초기화
        Search.recommandKeyword(function(data) {
        	try{
        		var idx = Math.floor(data.length * Math.random());
        		$(Search.config.obj).val(data[idx].content.banner_title);
        	}catch(e){}
        });

        $(Search.config.obj).focus(function() {
            if($('#suggest').css('display') != 'block') {
               // $(this).val('');
                $(this).select();
                Search.autocomplete($(this).val());
            }
            Search.on();
        });

        $(document).on('click', function(e) {
            var target = e.target.id;
            if(target != Search.config.id) {
                Search.off();
            }
        });

        $(Search.config.obj).on('keyup', function(e) {
            if(e.keyCode == 40 || e.keyCode == 38) {
                return false;
            }
            Search.autocomplete($(this).val());
        });
    },
    on: function() {
        if(!Search.config.active) {
            $(document).on('keydown', function(e) {
                var target = e.target.id;
                if(e.keyCode == 40) {
                    if(target == Search.config.id) {
                        if($('#suggest').css('display') == 'block') {
                            Search.config.current = 0;
                            var searchList = $('#search_list').find('a.node:first');
                            $(searchList).parent('li').addClass('on');
                            $(searchList).get(Search.config.current).focus();
                        }
                    } else {
                        var searchList = $('#search_list').find('a.node');
                        if($(searchList).get(Search.config.current+1)) {
                            $('#search_list').find('li').removeClass('on');

                            Search.config.current++;
                            $($(searchList).get(Search.config.current)).parent('li').addClass('on');
                            $(searchList).get(Search.config.current).focus();
                        }

                    }
                    Search.selectKeyword();
                    return false;
                } else if(e.keyCode == 38) {
                    if(target == Search.config.id) {
                        $('#suggest').hide();
                        Search.config.last = null;
                        $(Search.config.obj).val(Search.config.last);
                    } else {
                        var searchList = $('#search_list').find('a.node');
                        if(Search.config.current == 0) {
                            $('#search_list').find('li').removeClass('on');
                            $(Search.config.obj).focus();
                        } else {
                            $('#search_list').find('li').removeClass('on');

                            Search.config.current--;
                            $($(searchList).get(Search.config.current)).parent('li').addClass('on');
                            $(searchList).get(Search.config.current).focus();
                        }
                        Search.selectKeyword();
                    }
                    return false;
                } else if(e.keyCode == 13) {
                    if(target == Search.config.id) {
                        var searchText = Search.removeHtmlTag($(Search.config.obj).val());
                        Search.submit(searchText);
                    } else {
                        Search.eventSubmit(e);
                    }
                    return false;
                }
            });
            Search.config.active = true;
        }
    },
    off: function() {
        $(document).off('keydown');
        $('#suggest').hide();
        Search.config.active = false;
    },
    addMouseEvent: function(result) {
        $(result).find('a.node').on({
            click: function(e) {
                Search.eventSubmit(e);
                return false;
            },
            mouseover: function(e) {
                $(e.target).parent('li').addClass('on');
            },
            mouseout: function(e) {
                $('#search_list').find('li').removeClass('on');
            }
        });
    },
    selectKeyword: function() {
        var keyword = $('#search_list').find('a:focus').attr('title') || '';
        if(keyword) {
            $(Search.config.obj).val(keyword);
        }
    },
    eventSubmit: function(event) {
        if($(event.target).parents('li').hasClass('push')) {
            var linkUrl = event.target.href || $(event.target).parent().attr('href');
            window.location =  linkUrl;
        } else {
            var keyword = $(event.target).attr('title') || $(event.target).parent().attr('title');
            Search.submit(keyword);
        }
    },
    submit: function(keyword) {
        if(strip_tags(keyword) == '') {
            alert('검색어를 입력해주세요.');
            $(Search.config.obj).focus();
            $(Search.config.obj).val('');
            return false;
        }

        
        //keyword = keyword.replace(/&/gi, '&#38;');
        //keyword = keyword.replace(/</gi, '&lt;');
        //keyword = keyword.replace(/>/gi, '&gt;');
        //keyword = keyword.replace(/#/gi, '&#35;');
        

        if(Search.config.mode == 'normal') {
            $(Search.config.obj).val(keyword);
            Search.keywordHistory(keyword);

            if (hidList.value.indexOf("?") != -1) {
            	window.location = hidList.value + '&searchValue=' + encodeURIComponent(keyword);
            } else {
            	window.location = hidList.value + '?searchValue=' + encodeURIComponent(keyword);
            }
            // window.location = "http://" + itving_host + '/itving/itving/videoList.do?searchValue=' + encodeURIComponent(keyword);
            // window.location = serverDomain + '/find/main.do?kwd=' + encodeURIComponent(keyword); 
        } else {
            $(Search.config.obj).val(keyword);
            Search.keywordHistory(keyword);
            Find.tvInit(keyword);
        }
        $('#suggest').hide();
    },
    autocomplete: function(keyword) {
    	var _self = Search;
    	var _keyword = keyword;

    	function replaceRedKeyword(resultWord){
    		return resultWord.replace(_keyword, '<span style="red">' + _keyword + '</span>');
    	}

        if(keyword == '') {
            var result = Search.keywordHistory();
            if(!result) {
                Search.recentKeyword(function(result) {
                    var recentTime = result[0].inst_dt;
                    var recentDisplay = recentTime.substring(0,4) +'.'+
                        recentTime.substring(4,6) +'.'+
                        recentTime.substring(6,8) +' '+
                        recentTime.substring(8,10) +':'+
                        recentTime.substring(10,12) + ' 기준';

                    var html = '';

                    
                    html += '<div class="gnb-search-list">';
                    html += '<span>실시간 인기 검색어</span>';
                    html += '<span>'+ recentDisplay +'</span>';

                    html += '<ul class="keyword-list">';
                    
                    $(result).each(function(idx, data) {
                        if(idx < 3) {
                            html += '<li class="top"><a href="#" class="tit node" title="'+ data.kwd +'"><span>'+ (idx+1) +'</span> '+ data.kwd +'</a></li>';
                        } else {
                            html += '<li><a href="#" class="tit node" title="'+ data.kwd +'"><span>'+ (idx+1) +'</span> '+ data.kwd +'</a></li>';
                        }
                    });

                    html += '</ul>';
                    html += '</div>';

                    html = $(html);
                    Search.addMouseEvent(html);
					
                    $('#search_list').html(html);
                    $('#suggest').show();
                    $('#search_list').show(); 
                    _self.showSearchLayer();
                    
                });
            }
        }
        else if(Search.config.last != keyword) {
            $.ajax({
                url: 'https:'+Search.config.domain+'/search/common/module/getAkc.jsp?jsoncallback=?',
                data: {
                    kwd: keyword,
                    type: 'both',
                    speed: '300',
                    sort1: 'no',
                    sort2: 'no',
                    sort3: 'no',
                    fixed: 'Y',
                    category: '!SHORTCLIP',
                    screen: 'CSSD0100',
                    os: 'ALL',
                    network: 'ALL',
                    grade_cd: 'CMMG0400'
                },
                type: 'get',
                dataType: 'jsonp',
                jsonp: 'jsoncallback'
            }).done(function(json) {
                if(json.akcRsb && json.akcRsb.dataList) {
                    var html = '';
                    var idx2 = 0;
                    $(json.akcRsb.dataList).each(function(idx, data) {
                        if(idx < 10) {
                            if(idx == 0) {
                                switch (data.gubun) {
                                    case "SCH" :
                                        //채널
                                        //var url = (Search.config.mode == 'tv') ? serverDomain + '/tv/player/' : serverDomain + '/live/player/';
                                        var url = (Search.config.mode == 'tv') ? serverDomain + '/tv/player/' : serverDomain + '/live/player/';

                                        html += '<div class="keyword-box gnb-poster-area">';
                                        html += '   <div class="keyword-lnk poster-info">';
                                        html += '       <p class="title"><a href="'+ url + data.ch_cd +'" title="'+ data.mast_nm +'" class="node">'+ data.ch_nm +'</a></p>';
                                        html += '       <a href="'+ url + data.ch_cd +'" title="'+ data.mast_nm +'" class="poster-link-go">채널시청 바로가기</a>';
                                        html += '   </div>';
                                        html += '   <div class="thumb poster-img"><img src="'+ imageDomain + data.web_url3 +'" alt="'+ data.ch_nm +'"></div>';
                                        html += '</div>';

                                        break;
                                    case "VODBC" :
                                        //프로그램
                                        var url = (Search.config.mode == 'tv') ? serverDomain + '/tv/player/' : serverDomain + '/vod/player/';

                                        html += '<div class="keyword-box  gnb-poster-area">';
										html += '   <div class="keyword-lnk poster-info">';
										html += '	    <p class="title"><a href="'+ url + data.mast_cd +'" class="node">'+ data.kwauto +'</a></p>';
										html += '	    <a href="'+ url + data.mast_cd +'" class="poster-link-go">최신회차 바로가기</a>';
										html += '   </div>';
										html += '   <div class="thumb poster-img"><img src="'+ imageDomain + data.web_url4 +'" alt="'+ data.mast_nm +'"></div>';
									    html += '</div>';

                                        break;
                                    case "VODMV" :
                                        //영화
                                        var url = (Search.config.mode == 'tv') ? serverDomain + '/tv/player/' : serverDomain + '/movie/player/';

                                        html += '<div class="keyword-box  gnb-poster-area">';
                                        html += '   <div class="keyword-lnk poster-info">';
										html += '	    <p class="title"><a href="'+ url + data.mast_cd +'" title="'+ data.mast_nm +'" class="node">'+ data.kwauto +'</a></p>';
										html += '   </div>';
										html += '   <div class="thumb poster-img"><img src="'+ imageDomain + data.web_url +'" alt="'+ data.mast_nm +'"></div>';
									    html += '</div>';

                                        break;
                                }
                            }
                            else {

                                if(idx == 1) html += '<ul class="keyword-list">';

                                var css = idx < 4 ? ' class="high"' : '';
                                var title = data.gubun == 'SCH' ? data.ch_nm : data.mast_nm;
                                html += '<li'+ css +'><a href="#" class="tit node" title="'+ title +'">'+ data.kwauto +'</a></li>';

                                if(idx == idx2) html += '</ul>';

                            }

                        }
                    });

                    html += '</ul>';

                    html = '<div class="gnb-search-list poster">' + html + '</div>';

                    html = $(html);
                    Search.addMouseEvent(html);

                    $('#search_list').html(html);
                    $('#suggest').show();
                    _self.showSearchLayer();

                    Search.config.last = keyword;
                }
            });
        }
    },
    keywordHistory: function(keyword) {
    	//debugger;

        var keywordHistory = $.cookie('keywords') ? $.cookie('keywords').split(/,/) : new Array();
        if(keyword) {
            $(keywordHistory).each(function(idx, data) {
                if(data == keyword) {
                    keywordHistory.splice(idx, 1);
                }
            });

            keywordHistory.unshift(keyword);

            if(keywordHistory.length > 10){
                keywordHistory.pop();
            }
            $.cookie('keywords', keywordHistory, { path: '/', domain: '.tving.com' });
        } else {
            var result = false;
            if(keywordHistory.length > 0) {
                var html = '';

                html += '<div class="gnb-keyword-list gnb-search-list lately search-history-list">';
                html += '    <span>최근검색어</span>';
                html += '    <button id="deleteSearchAll" type="button" class="btn-alldelete">전체 삭제</button>';
                html += '    <ul class="keyword-list">';

                $(keywordHistory).each(function(idx, data) {
                    html += '       <li><span style="cursor:pointer" class="tit node" title="'+ data +'">'+ data +'</span><button type="button" class="btn-delete"><span>삭제</span></button></li>';
                });

                html += '    </ul>';
                html += '</div>';

                html = $(html);

                Search.addMouseEvent(html);
                $('#search_list').html(html);

                $('#deleteSearchAll').on('click', function() {
                    $.cookie('keywords', '', { path: '/', domain: '.tving.com' });
                    $('.gnb-search-area').hide();
                    Search.keywordHistory('');
                    return false;
                });

                $('.search-history-list').find('li .node').on('click', function(){
                	var keyword = $(this).attr('title');
                	window.location = serverDomain + '/find/main.do?kwd=' + encodeURIComponent(keyword);
                });

                $('.search-history-list').find('li button').on('click', function(){
                	var keyword = $(this).parent().find('span').attr('title');
                    if(keyword) {
                    	var keywordHistory = $.cookie('keywords') ? $.cookie('keywords').split(/,/) : new Array();
                    	var newHistory = [];
                    	$.removeCookie('keywords', { path: '/', domain: '.tving.com' });
                    	$(keywordHistory).each(function(idx, data) {
                            if(data != keyword) {
                            	newHistory.push(data);
                            }
                    	});

                    	$.cookie('keywords', newHistory, { path: '/', domain: '.tving.com' });
                        $(this).parent().remove();
                    }
                });

                $('#suggest').show();
                $('.gnb-search-area').show();
                return true;
            }
            return result;
        }
    },
    recommandKeyword: function(callback) {
        jarvisHighlight.getList({positionKey: 'PCV4_GNB_RECOMMENDED_SEARCH_WORD'}, function(json) {
        	try{
        		callback(json.result);
        	}catch(e){}
        });
    },
    recentKeyword: function(callback) {
        $.ajax({
            url: 'https:'+Search.config.domain+'/search/common/module/getRpk.jsp?jsoncallback=?',
            type: 'post',
            dataType: 'jsonp',
            jsonp: 'jsoncallback'
        }).done(function(json) {
            if(json.rpkRsb && json.rpkRsb.dataList) {
                callback(json.rpkRsb.dataList);
            }
        });
    },
    removeHtmlTag: function ($searchText) {
        var text = $searchText.replace(/<(\/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(\/)?>/gi, "");
        text = text.replace(/<(no)?script[^>]*>.*?<\/(no)?script>/ig, "");
        text = text.replace(/<style[^>]*>.*<\/style>/ig, "");
        text = text.replace(/<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>/ig, "");
        text = text.replace(/<\\w+\\s+[^<]*\\s*>/ig, "");
        text = text.replace(/&[^;]+;/ig, "");
        text = text.replace(/\\s\\s+/ig, "");
        return text;
    },

    showSearchLayer : function(){
    	$('.gnb-search-area').show();
	},

	searchUrl: function() {
		var targets = ['test', 'qc', 'dev', 'loc'];
		var host = location.host;
		for(var i = 0; i < targets.length; i++) {
			if(host.indexOf(targets[i]) >= 0) return '//qc-search.tving.com';
		}
		return '//search.tving.com';
	}
};

function strip_tags (input, allowed) {
    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi;
    return input.replace(tags, function ($0, $1) {
        return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
    });
}
