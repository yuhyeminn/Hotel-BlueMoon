<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />

<style>
    table{
        border: 1px solid rgb(230, 227, 223);
        border-collapse: collapse;
        margin: auto;
        padding: 0px;
        width: 1100px;
        
    }
    img{
        display: block;
        width: 767px;
        height: 463px;
    }
    </style>
</head>
<body>
    <h3>객실</h3>
    <p>블루문 호텔에서 격이 다른 <br> 휴식과 여유를 경험해 보세요</p>

    <h4>디럭스</h4>
    <p>모던하면서도 세련된 최신 트렌드의 인테리어가 돋보이는 객실</p>
    
    <table border=".1">
        <tr>
            <td><img src="<%=request.getContextPath() %>/images/room1.jpg" width="500px" alt=""></td>
            <td>
                <li>디럭스룸</li>
                <li>은은한 조명과 어우러진 다크 브라운의 조화</li>
                <hr>
                <p><strong>전망</strong>&nbsp;시티뷰</p>
                <p><strong>인원</strong>&nbsp;성인2인</p>
                <p><strong>베드타입</strong>&nbsp;더블, 트윈, 온돌</p>
                <p><strong>객실크기</strong>&nbsp;40~50㎡</p>
                <a href="#">상세보기</a>
            </td>
        </tr>
    </table>

    <br>
    <br>

    <table border=".1" style="border-collapse: collapse;">
            <tr>
                <td><img src="<%=request.getContextPath() %>/images/room2.jpg" width="500px" alt=""></td>
                <td>
                    <li>프리미엄디럭스 룸</li>
                    <li>해변의 아름다운 해안선을 만끽할 수 있는 객실</li>
                    <hr>
                    <p><strong>전망</strong>&nbsp;리버뷰</p>
                    <p><strong>인원</strong>&nbsp;성인2인</p>
                    <p><strong>베드타입</strong>&nbsp;더블, 트윈</p>
                    <p><strong>객실크기</strong>&nbsp;59~73㎡</p>
                    <a href="#">상세보기</a>
                </td>
            </tr>
        </table>

        <br>
        <br>

    <table border=".1" style="border-collapse: collapse;">
            <tr>
                <td><img src="<%=request.getContextPath() %>/images/room3.jpg" width="500px" alt=""></td>
                <td>
                    <li>프리미엄디럭스 룸</li>
                    <li>해변의 아름다운 해안선을 만끽할 수 있는 객실</li>
                    <hr>
                    <p><strong>전망</strong>&nbsp;리버뷰</p>
                    <p><strong>인원</strong>&nbsp;성인2인</p>
                    <p><strong>베드타입</strong>&nbsp;더블, 온돌</p>
                    <p><strong>객실크기</strong>&nbsp;143㎡</p>
                    <a href="#">상세보기</a>
                </td>
            </tr>
        </table>

        <br>
        <br>

    <table border=".1" style="border-collapse: collapse;">
            <tr>
                <td><img src="<%=request.getContextPath() %>/images/room4.jpg" width="500px" alt=""></td>
                <td>
                    <li>스위트 룸</li>
                    <li>편안한 침실과 안락한 거실이 분리되어 품격 있는 휴식을 누릴 수 있는 스위트 룸</li>
                    <hr>
                    <p><strong>전망</strong>&nbsp;시티뷰/리버뷰</p>
                    <p><strong>인원</strong>&nbsp;성인2인</p>
                    <p><strong>베드타입</strong>&nbsp;더블, 트윈</p>
                    <p><strong>객실크기</strong>&nbsp;353㎡</p>
                    <a href="#">상세보기</a>
                </td>
            </tr>
        </table>
        
</body>
