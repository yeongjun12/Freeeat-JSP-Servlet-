<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>피드페이지입니다</title>
        <link rel="icon" href="../common/image/favicon.ico" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <link href="../../resources/feed_resources/styles/common.css" rel="stylesheet" type="text/css" />
        <link href="../../resources/feed_resources/styles/feed.css" rel="stylesheet" type="text/css" />

        <style>
            /* div {
                border: 1px red solid;
            } */

            .FAQ_title {
                font-size: 100px;
                text-align: center;
                background-color: #E7F8FF ;
                margin: 20px;
                border-radius: 40px;
            }

            .container {
                width: 500px;
                margin: 0 auto;
                overflow: hidden
            }

            a {
                text-decoration: none
            }

            #faq-links {
                padding: 10px 20px
            }

            #faq-links div {
                color: #aeaeaf;
                cursor: pointer;
                font-weight: 700;
                text-transform: capitalize;
                margin: 18px 0
            }

            .faq-group {
                padding: 0 20px 40px 20px;
                position: relative
            }

            .faq-group div {
                font-weight: 700;
                text-align: center;
            }

            .faq-group hr {
                border: 0;
                border-top: 1px solid #606060;
                clear: both;
                -moz-box-sizing: content-box;
                -webkit-box-sizing: content-box;
                box-sizing: content-box;
                height: 3px;
                color: #333;
                background-color: #333;
            }

            /* Chrome 10 미만 버전과, Firefox 29 미만 버전에서는 각각 -webkit과 -moz prefix를 사용해야 합니다 */

            .faq-group:after {
                top: 33%;
                left: 50%;
                border: solid transparent;
                content: " ";
                height: 0;
                width: 0;
                position: absolute;
                pointer-events: none;
                border-top-color: #393939;
                border-width: 15px;
                margin-left: -15px
            }

            .faq-accordion>li {
                border-top: 1px solid rgba(198, 198, 198, 0.4);
                color: #666;
                padding: 1.125em 0
            }

            .faq-accordion li a {
                color: #666;
                padding: 1.125em;
            }

            .faq-accordion>li:last-child {
                border-bottom: 1px solid rgba(198, 198, 198, 0.4);
            }

            .faq-accordion>li>a:before {
                content: 'Q.';
                padding-right: 0.313em
            }

            .faq-accordion>li>a:after {
                color: #ff8300;
                content: '+';
                float: right;
                font-weight: 300;
                margin-right: 1.25em;
                -webkit-transform: scale(2);
                -ms-transform: scale(2);
                transform: scale(2);
                overflow-y: hidden;
            }

            /* Chrome 10 미만 버전과, Firefox 29 미만 버전에서는 각각 -webkit과 -moz prefix를 사용해야 합니다 */

            .faq-accordion>li>a.expanded:after {
                color: #ffa326;
                content: '\2212';
                -webkit-transform: scale(2);
                -ms-transform: scale(2);
                transform: scale(2);
            }

            /* transform:scale() - X 또는 Y축으로 확대/ 축소 */

            .faq-accordion>li>a.expanded {
                /*expanded : 확장속성을 표현함*/
                font-weight: 700;
                opacity: 1 !important
            }

            /* opacity 속성 : 요소의 투명도를 정할 수 있음. */

            .faq-content {
                background-color: #ececec;
                margin: 20px 0 -20px;
            }

            .faq-content p:before {
                content: 'A.';
                color: #ff8300;
                float: left;
                font-weight: 700;
                margin-right: .5em
            }

            .faq-content p {
                margin: 0 1.2em;
                padding: 1.250em 0
            }

            .faq-hide {
                display: none
            }

            .faq-selected {
                color: #49494b !important;
                -webkit-transition: all 1s ease;
                transition: all 1s ease;
            }

            /* transition 속성. 기본값 all 특정 조건 하에서 애니메이션이 동작되는 과정을 보여주고자 할 때 사용 . 전환이 일어날 요소들을 작성해주는것 */
            /* transition: property duration function delay */
            /* all : 전부, 1s : 1초간, ease : 느리게 시작하여 점점 빨라졌다 느려지면서 종료 */

            .slide-left {

                -webkit-animation-name: slide-left;
                -moz-animation-name: slide-left;
                animation-name: slide-left;


                -webkit-animation-duration: 1s;
                -moz-animation-duration: 1s;
                animation-duration: 1s;


                -webkit-animation-timing-function: ease-in-out;
                -moz-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;

            }

            /* animation-name : 키프레임 애니메이션 이름을 지정.특수문자를 제외한 문자열, 숫자, -,_ 를 조합해 1글자 이상. */
            /* animation-duration : 	애니메이션 재생 시간, 또는 반복 루프 1회를 도는 시간 */
            /* animation-timing-function : ease-in-out :애니메이션 진행 속도, 또는 가속 방식을 지정. 미리 설정된 속도 커브 중 한가지를 선택. */



            /* 
            @keyframes @규칙은 개발자가 애니메이션 중간중간의 특정 지점들을 거칠 수 있는 키프레임들을 설정함으로써
             CSS 애니메이션 과정의 중간 절차를 제어할 수 있게 합니다. 이 룰은 브라우저가 자동으로 애니메이션을 처리하는 것 보다 
             더 세밀하게 중간 동작들을 제어할 수 있습니다.
            
             키프레임을 사용하려면 @keyframes 룰을 애니메이션과 키프레임 리스트를 매칭시킬 
             animation-name 속성에서 사용할 이름과 함께 생성합니다. (위에서 animation-name: slide-left; 했음)
              각 @keyframes 룰은 키프레임 선택자의 스타일 리스트를 포함하고 있고, 
              각 리스트는 각 키프레임이 생성되고 키프레임의 스타일 정보를 포함하고 있는 지점에서 사용할 %로 구성됩니다.

              키프레임에서 !important 속성을 이용한 정의는 모두 무시됩니다.
            */
            @-webkit-keyframes slide-left {
                0% {
                    -webkit-transform: translateX(150%);
                }

                /* 0% 왔을 때 X축으로 150%이동 */

                50% {
                    -webkit-transform: translateX(-8%);
                }

                /* 50% 더왔을 때 X축 -8%이동 */

                65% {
                    -webkit-transform: translateX(4%);
                }

                /* 한마디로 왔다갔다하는 효과다 이말이야 */
                80% {
                    -webkit-transform: translateX(-4%);
                }

                95% {
                    -webkit-transform: translateX(2%);
                }

                100% {
                    -webkit-transform: translateX(0%);
                }
            }

            @-moz-keyframes slide-left {
                0% {
                    -webkit-transform: translateX(150%);
                    -moz-transform: translateX(150%);
                    transform: translateX(150%);
                }

                50% {
                    -webkit-transform: translateX(-8%);
                    -moz-transform: translateX(-8%);
                    transform: translateX(-8%);
                }

                65% {
                    -webkit-transform: translateX(4%);
                    -moz-transform: translateX(4%);
                    transform: translateX(4%);
                }

                80% {
                    -webkit-transform: translateX(-4%);
                    -moz-transform: translateX(-4%);
                    transform: translateX(-4%);
                }

                95% {
                    -webkit-transform: translateX(2%);
                    -moz-transform: translateX(2%);
                    transform: translateX(2%);
                }

                100% {
                    -webkit-transform: translateX(0%);
                    -moz-transform: translateX(0%);
                    transform: translateX(0%);
                }
            }

            @keyframes slide-left {
                0% {
                    -webkit-transform: translateX(150%);
                    -moz-transform: translateX(150%);
                    transform: translateX(150%);
                }

                50% {
                    -webkit-transform: translateX(-8%);
                    -moz-transform: translateX(-8%);
                    transform: translateX(-8%);
                }

                65% {
                    -webkit-transform: translateX(4%);
                    -moz-transform: translateX(4%);
                    transform: translateX(4%);
                }

                80% {
                    -webkit-transform: translateX(-4%);
                    -moz-transform: translateX(-4%);
                    transform: translateX(-4%);
                }

                95% {
                    -webkit-transform: translateX(2%);
                    -moz-transform: translateX(2%);
                    transform: translateX(2%);
                }

                100% {
                    -webkit-transform: translateX(0%);
                    -moz-transform: translateX(0%);
                    transform: translateX(0%);
                }
            }
        </style>
    </head>

    <body id="body">
        <%@ include file="../common/menubar_hj.jsp" %>
            <!--  여기 인클루드 하자 -->
            <%@ include file="../common/noticeFaqCs.jsp" %>

                <!--body-->
                <div class="FAQ_title">
                    <h1 class="FAQ_title_h1">FAQ</h1>

                </div>

                <div class="container">
                    <div id="faq-links">
                        <div id="definitionType" class="faq-selected">타입의 정의</div>
                        <div id="logInOut">로그인 / 로그아웃</div>
                        <div id="signInOut">회원 가입 / 탈퇴</div>
                        <div id="features">기능</div>
                        <div id="etc">기타</div>
                    </div>

                    <div id="faq-wrapper" class="about-definitionType">

                        <div class="faq-group">
                            <div class="slide-left">
                                <div>카테고리 기준</div>
                            </div>
                            <hr>
                        </div>
                        <!--faq-group-->
                        <div class="slide-left">
                            <div class="faq">
                                <ul class="faq-accordion">

                                    <li>
                                        <a href="#">비건 ( 락토 ) </a>
                                        <ul class="faq-content">
                                            <li>
                                                <div>
                                                    <p> 저희 Freeeat의 비건기준은 락토-오보 (Lacto-Ovo)를 의미합니다. <br> <br>
                                                        &nbsp;계란과 우유를 허용하고 동양의 종교적 채식주의자 대다수가 이를
                                                        택하고 있기 때문에 채식주의 중 가장 많은 수가 여기에 속합니다.<br> <br>
                                                        &nbsp;저희는 다양한 비건 식당을 소개하고 있습니다. Free하게 즐겨보세요!🎠
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <!--비건(락토)-->

                                    <li>
                                        <a href="#">락토프리</a>
                                        <ul class="faq-content">
                                            <li>
                                                <div>
                                                    <p> 카페에서 음료를 만들 때 사용하는 우유 대신 귀리, 콩, 아몬드
                                                        등 식물성 원료를 주제료로 하는 대체유를 사용하는 곳을 소개합니다. <br> <br>
                                                        &nbsp;곡물로 만든 대체우유에 주목하는 것은 영양분이 우유 못지않고 친환경적이며
                                                        유당 불내증으로 우유를 마시지 못하는 사람도 섭취 가능하다는 이유 때문입니다.<br> <br>
                                                        &nbsp;맛있는 락토프리 음료들을 Freeeat 과 함께 즐겨보세요!
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <!--락토프리 ipsum-->

                                    <li>
                                        <a href="#">슈가프리</a>
                                        <ul class="faq-content">
                                            <li>
                                                <div>
                                                    <p> 저희 Freeeat은 다이어트나 혈당관리를 목적으로하는 설탕이 포함되지 않은
                                                        슈가프리 카페들을 소개하고 있습니다.<br> <br>
                                                        &nbsp; '헬시플레저(healthy pleasure)’ 트렌드가
                                                        검색어 상위를 차지하고 있는 요즘, 사람들은 다이어트를 하면서도 즐겁게 하자는
                                                        목적을 가지고 맛있으면서도 당이 적게 표함된 식품을 찾아다니고 있습니다.<br> <br>
                                                        &nbsp; Freeeat과 함께 맛있는 저당 음료들을 즐겨보세요!

                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <!--슈가프리 ipsum-->

                                    <li>
                                        <a href="#">디카페인</a>
                                        <ul class="faq-content">
                                            <li>
                                                <div>
                                                    <p> 매년 디카페인 커피의 수요가 증가하며 다양한 상품들이 출시되고 있습니다.<br> <br>
                                                        &nbsp;커피 한 잔을 기준으로 카페인은 약 50~150mg정도 들어있으며 중추신경을 자극하며
                                                        일시적으로 졸음을 제거하지만, 성인 남녀의 하루 카페인 권장 섭취량은 400mg미만으로
                                                        과다 섭취 시 위장장애 및 불면증으로 이어질 수 있기 때문에 주의해야 합니다.<br> <br>
                                                        &nbsp; 저희 Freeate은 맛있고 향이 좋으면서도 디카페인인 커피를 취급하는 맛있는 카페들을
                                                        소개해드리고 있습니다. 저희와 함께 카페인 걱정 없이 커피를 즐겨보세요!
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <!--디카페인 ipsum-->

                                    <li>
                                        <a href="#">동물복지</a>
                                        <ul class="faq-content">
                                            <li>
                                                <div>
                                                    <p>
                                                        시간이 갈수록 동물복지에 관심있는 사람들이 늘어나고 있습니다. <br> <br>
                                                        &nbsp; 고통스럽게 살아가고 도축되는 동물들을 보면서 안타까움을 느끼고
                                                        변화를 만들고자 하는 사람들이 점점 많아지고 있는데요, 우리 Freeeat은
                                                        이러한 사회적 바람에 동참하고자 동물복지계란이나 육류를 사용하는 식당을
                                                        소개하고자 합니다. <br> <br>&nbsp;저희와 함께 동물복지를 지키는 사회적 걸음에 동행해 주세요!
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <!--동물복지 ipsum-->
                                </ul>
                            </div>
                        </div>
                    </div>






                    <div class="about-logInOut faq-hide">

                        <div class="faq-group">
                            <div class="slide-left">
                                <div>로그인 / 로그아웃</div>
                            </div>
                            <hr>
                        </div>

                        <div class="slide-left">
                            <ul class="faq-accordion">

                                <li>
                                    <a href="#">로그인은 어디서 하나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>최상단에 로그인 버튼을 찾아서 눌러주세요!<br> <br>
                                                    회원가입을 안하셨다면 회원가입을 먼저 해주시길바랍니다!!
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--로그인은 어디서 하나요?-->

                                <li>
                                    <a href="#">로그아웃시 기능을 쓸 수 없나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>저희 Freeate은 로그인해야 더 다양한 기능들을 사용하실 수 있습니다.<br> <br>
                                                    스팸이나 음란 댓글 등의 부차적인 피해를 막기 위한 조치이오니 양해바랍니다.
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--로그아웃시 기능을 쓸 수 없나요-->

                            </ul>

                        </div>
                        <!--lide-left -->
                    </div>


                    <div class="about-signInOut faq-hide">

                        <div class="faq-group">
                            <div class="slide-left">
                                <div>회원 가입 / 탈퇴</div>
                            </div>
                            <hr>
                        </div>
                        <div class="slide-left">
                            <ul class="faq-accordion">

                                <li>
                                    <a href="#">회원가입은 어떻게 하나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>화면 상단의 회원가입 버튼을 눌러주세요!<br> <br>
                                                    저희 Freeeat은 회원님들의 정보를 어떠한 광고수단으로도 사용하지 않습니다.<br> <br>
                                                    걱정말고 가입해주세요!
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--회원가입-->

                                <li>
                                    <a href="#">회원탈퇴는 어떻게 하나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>
                                                    주민등록번호 사본과 현재 소속중인 회사, 학교 등의 재직증명서 사본,
                                                    보유중인 부동산과 금융자산 일체의 증명서 사본,
                                                    대한민국 국가 1절부터 3절까지만 수기로 3번적은 문서,
                                                    어릴적 꿈에 대한 에세이 2편 을 다음의 FAX번호로 제출해주시면 됩니다.<br> <br>
                                                    031-860-XXXX : XXXX은 터키의 귄도안씨가 아이스크림을 먹은 횟수
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--회원탈퇴는 어떻게 하나요?-->

                                <li>
                                    <a href="#">회원 가입일자에 따른 혜택?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>
                                                    회원가입일 100일 이상, 로그인 횟수 150회 이상 조건을 만족하시면<br>
                                                    저희가 감사합니다.
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--회원 가입일자에 따른 혜택-->
                            </ul>
                        </div>
                        <!--slide-left-->
                    </div>

                    <div class="about-features faq-hide">

                        <div class="faq-group">
                            <div class="slide-left">
                                <div>기능</div>
                            </div>
                            <hr>
                        </div>
                        <div class="slide-left">
                            <ul class="faq-accordion">

                                <li>
                                    <a href="#">식당 제보 시 혜택이 있나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>
                                                    다수의 식당을 제보해 주실경우 너무 감사합니다.
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--식당 제보 혜택-->

                                <li>
                                    <a href="#">팔로우한 회원에게 알람이 가나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>아직 그 기능은 제공하지 않고 있습니다. <br> <br> &nbsp;다만 빠른 시일내에 제 생일이 다가오니
                                                    그때 기분 좋으면 생각해 보겠습니다. 감사합니다.
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--팔로우한 회원에-->

                                <li>
                                    <a href="#">해당 지역 식당이 표시되지 않아요.</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>아직 저희의 데이터가 부족합니다. 당신이 좀 도와줘야겠어. <br> <br>
                                                    많은 식당 제보 부탁드립니다.<br> <br> &nbsp; 많은 식당 제보를 해 주시면 여러가지로 감사합니다.
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                        <!--slide-left-->
                    </div>
                    <!--about-features faq-hide-->


                    <div class="about-etc faq-hide">

                        <div class="faq-group">
                            <div class="slide-left">
                                <div>기타</div>
                            </div>
                            <hr>
                        </div>
                        <div class="slide-left">
                            <ul class="faq-accordion">

                                <li>
                                    <a href="#">비건 제품(공산품)에 대한 정보는 없나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>넵! 쿠팡에서 검색해주세요!</p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--비건 제품(공산품)에 대한 정보-->

                                <li>
                                    <a href="#">공정무역 카테고리는 없나요?</a>
                                    <ul class="faq-content">
                                        <li>
                                            <div>
                                                <p>공정? 대한민국에 그런 달달한 것이 남아있기는 한가?<br> <br>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!--공정무역 카테고리는 없나요?-->

                            </ul>
                        </div>
                        <!--slide-left-->
                    </div>
                    <!--about-etc faq-hide-->
                </div>
                <!--container-->


    </body>

    <script>

        var accordWithPage = function () {

            var faqDiv = $('#faq-links div');
            // #faq-links 의 후손 div에 접근하여 편하게 사용하기 위해 변수에 담기

            $(function () {

                faqDiv.click(function () {

                    var hideSec = 'faq-hide';
                    var $this = $(this),
                        $id = $this.attr('id'),
                        // 아이디 가져와서 변수에 넣기
                        $class = '.' + $('.about-' + $id).attr('class').replace(hideSec, '');

                    $('#faq-wrapper').addClass(hideSec);
                    $('.about-' + $id).removeClass(hideSec);
                    $('div[class*=about]').not($class).addClass(hideSec);

                    // class에 about이 포함된모든 div요소 선택. 
                    // 그 중에
                    // not() : 특정 선택자를 제외한 요소를 선택. 
                });

            });

            $(function () {

                var select = 'faq-selected';

                faqDiv.click(function () {

                    if ($(this).hasClass(select)) {
                        $(this).removeClass(select);
                    } else {
                        $('#faq-links .faq-selected').removeClass(select);
                        $(this).addClass(select);
                    }
                }); //faq link selected
            });



            //Accordion - 열고 닫기 
            // 열려져 있는건 닫고 클릭한 요소의 리스트를 열어버린다.

            $(function () {

                var expand = 'expanded';
                var content = $('.faq-content');
                //FAQ Accordion
                $('.faq-accordion > li > a').click(function (e) {
                    e.preventDefault();
                    if ($(this).hasClass(expand)) {
                        $(this).removeClass(expand);
                        //          $('.faq-accordion > li > a > div').not(this).css('opacity', '1');//returns li back to normal state
                        $(this).parent().children('ul').stop(true, true).slideUp();
                    } else {
                        //            $('.faq-accordion > li > a > div').not(this).css('opacity', '0.5');//dims inactive li
                        $('.faq-accordion > li > a.expanded').removeClass(expand);
                        $(this).addClass(expand);
                        content.filter(":visible").slideUp();
                        $(this).parent().children('ul').stop(true, true).slideDown();
                    }
                }); //accordion function

                content.hide();

            });

        }

        accordWithPage();


    </script>

    </html>