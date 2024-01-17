<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>버튼들</title>
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            @font-face {
                font-family: 'S-CoreDream-3Light';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            * {
                font-family: 'S-CoreDream-3Light';
            }

            #btn_body {}

            .btn_outer {
                text-align: center;
            }

            .FNC_btn {
                margin-right: 40px;
            }

            .go_btn {
                /* 상단버튼 스타일 */
                width: 300px;
                height: 150px;
                color: #fff;
                border-radius: 15px;
                padding-top: 1px;
                font-family: 'S-CoreDream-3Light';
                font-weight: 500;
                background: transparent;
                cursor: pointer;
                transition: all 0.3s ease;
                position: relative;
                display: inline-block;
                box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                    7px 7px 20px 0px rgba(0, 0, 0, .1),
                    4px 4px 5px 0px rgba(0, 0, 0, .1);
                outline: none;
            }

            /* goFAQ_btn */
            .goFAQ_btn {
                background-color: #89d8d3;
                background-image: linear-gradient(315deg, #8565dc 0%, #3c99e1 74%);
                border: none;
                z-index: 1;
                text-align: center;
                font-size: 60px;
            }

            .goFAQ_btn:after {
                position: absolute;
                content: "";
                width: 100%;
                height: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                border-radius: 15px;
                background-color: #4dccc6;
                background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
                box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
                transition: all 0.3s ease;
            }

            .goFAQ_btn:hover {
                color: #fff;
            }

            .goFAQ_btn:hover:after {
                top: 0;
                height: 100%;
            }

            .goFAQ_btn:active {
                top: 2px;
            }

            /* goNotice_btn */
            .goNotice_btn {
                background-color: #241171;
                background-image: linear-gradient(315deg, #D6F2FE 0%, #E7F8FF 74%);
                border: none;
                z-index: 1;
                text-align: center;
                font-size: 60px;
                color: black;
            }

            .goNotice_btn:after {
                position: absolute;
                content: "";
                width: 100%;
                height: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                border-radius: 15px;
                background-color: #4dccc6;
                background-image: linear-gradient(315deg, #D6F2FE 0%, #66a9c6  74%);
                box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
                transition: all 0.3s ease;
            }

            .goNotice_btn:hover {
                color: #fff;
            }

            .goNotice_btn:hover:after {
                top: 0;
                height: 100%;
            }

            .goNotice_btn:active {
                top: 2px;
            }


            /* goCSList_btn */
            .goCSList_btn {
                background-color: #89d8d3;
                background-image: linear-gradient(315deg, #4dd1a3 0%, #03c8a8 74%);
                border: none;
                z-index: 1;
                text-align: center;
                font-size: 60px;
            }

            .goCSList_btn:after {
                position: absolute;
                content: "";
                width: 100%;
                height: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                border-radius: 15px;
                background-color: #4dccc6;
                background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
                box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
                transition: all 0.3s ease;
            }

            .goCSList_btn:hover {
                color: #fff;
            }

            .goCSList_btn:hover:after {
                top: 0;
                height: 100%;
            }

            .goCSList_btn:active {
                top: 2px;
            }
        </style>
    </head>

    <body id="btn_body">

        <div class="btn_outer">
            <div class="FNC_btns">
                <button class="go_btn goFAQ_btn FNC_btn" id="goFAQ"> FAQ</button>


                <button class="go_btn goNotice_btn FNC_btn" id="goNotice">공지사항</button>


                <button class="go_btn goCSList_btn FNC_btn" id="goCSList">문의사항</button>
            </div>
        </div>
        <script>
            $(function () {
                $('#goFAQ').click(function () {
                    location.href = 'http://localhost:7676/Freeeat/views/notice/FAQ.jsp';
                });
                $('#goNotice').click(function () {
                    location.href = 'http://localhost:7676/Freeeat/noticeList.sk?cpage=1';
                });
                $('#goCSList').click(function () {
                    location.href = 'http://localhost:7676/Freeeat/CSList.hj?cpage=1';
                });

            });
        </script>






    </body>


    </html>