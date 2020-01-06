<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Roboto|Playfair+Display|Dancing+Script|Nanum+Gothic|Noto+Serif+KR|Gothic+A1|Do+Hyeon|Jua|Noto+Sans+KR|Song+Myung|Marck+Script|Kaushan+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<style>
/*header*/
header {
	position: relative;
	padding-bottom: 0px;
}
#header {
	width: 100%;
	height: 200px;
	position: relative;
	padding: 0px;
}
.logo-container{
    display: block;
    margin: 0 auto;
    width: fit-content;
    height: 160px;
}

#logo-img{
    display: inline-block;
    height: auto;
    width: 100%;
    margin: 0 auto;
    text-align: center;
}
#logo-img img{
    margin: 10px;
    width: 32%;
    height: 30%;
}

/*content*/
#content {
	width: auto!important;
	padding: 0!important;
	margin: 0 auto;
	min-height: 1000px;
}

#content-header {
	text-align: center;
}

#content-title {
	color: rgb(73, 73, 73);
	font-size: 37px;
	font-weight: 600;
}

#current-root a, #current-root {
	color: #666;
	text-decoration: none;
	font-size: 14px;
}

/*footer*/
footer {
	background-color: rgb(33, 32, 30);
	height: 250px;
	with: 100%;
}

#footer {
	text-align: center;
	margin: 0 auto;
	max-width: 1363px;
}

#footercontents {
	display: inline-block;
	margin-top: 60px;
}

#footer-left {
	text-align: left;
	float: left;
	margin-top: 2px;
}

#footer-right {
	color: rgba(255, 255, 255, 0.65);
	font-weight: 300;
	font-size: 15px;
	line-height: 1.6;
	margin-top: 3px;
	text-align: left;
	float: left;
}
#footer-nav {
	display: inline-block;
	width: auto;
	height: 20px;
	margin-bottom: 10px;
	margin-top: 2px;
}

#footer-nav ul {
	padding: 0;
}

#footer-nav ul li {
	list-style: none;
	display: inline-block;
}

#footer-nav ul li:not(:last-of-type )::after {
	content: "|";
	color: #908886;
	font-size: 15px;
	opacity: 0.5;
}

#footer-nav ul li a {
	text-decoration: none;
	color: rgba(255, 255, 255, 0.65);
	font-size: 15px;
	font-weight: 300;
	padding: 7px;
}

#info {
	color: rgba(255, 255, 255, 0.2);
	font-size: 15px;
	line-height: 1.6;
	margin-left: 10px;
	margin-top: 2px;
}

#copyright {
	width: auto;
	color: rgba(255, 255, 255, 0.2);
	font-size: 15px;
	margin-top: 15px;
	margin-left: 10px;
}

#verticalLine {
	width: 1px;
	height: 130px;
	background-color: rgba(226, 224, 224, 0.747);
	opacity: 0.5;
	float: left;
	margin: 0px 80px;
}

#center {
	color: rgb(156, 131, 106);
	margin: 0;
	margin-bottom: 4px;
}

#footer-right span {
	display: inline-block;
	width: 75px;
}

#footer-right a {
	text-decoration: underline;
	color: rgba(255, 255, 255, 0.65);
}

#contact {
	margin-top: 10px;
}
#nav2{
    display: inline-block;
    position: absolute;
    top: 16px;
    right: 80px;
}
#nav2 ul li{
    list-style: none;
    display: inline;
}
#nav2 ul li:not(:last-of-type)::after {
    content: "|";
    color:#908886;
    font-size: 13px;
    opacity: 0.5;
}
#nav2 ul li a {
    text-decoration: none; 
    color:#524d4c;
    padding: 10px;
    font-size: 13px;
}
#nav2 ul li a:hover {
    color: rgb(0, 30, 70);
    font-weight: 550;

}
#rsv {
    background-color: #1b65b3; /* Green */
    border: none;
    color: white;
    font-weight: 500;
    padding: 0 35px;
    line-height: 40px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
    width: auto;
    vertical-align: super;
    right: 100px;
    top: 159px;
    position: absolute;
}
#nav1{
    width: 580px;
}
#nav1:hover+#dropmenu, #dropmenu:hover{
    display:inline-block;
    background: gray;
    height: 220px;
    opacity: 1;
      transform: translateY(0);
}
#dropmenu{
    display: none;
    width: 100%;
    height: 220px;
     opacity: 0;
     transition: all .7s;
     margin: 0 auto;
     text-align:center;
     z-index: 2147483640;
}
#dropmenu li{
    list-style-type: none;
}
 #dropmenu_1{
    margin-left: 10px;
}
#dropmenu_2{
    margin-left: 170px;
}
#dropmenu_3{
    margin-left: 90px;
} 
.dropmenu-list{
    display: inline-block;
    width:200px;
    text-align: left;
    vertical-align: top;
}
#dropmenu_list{
    width: 1000px;
    margin: 0 auto;
}
#dropmenu_title {
    width: 1000px;
    margin: 0 auto;
    padding: 10px;
    font-weight: bold;
}
#dropmenu_title span{
    font-size: 27px;
    margin: 90px;
}

.dropmenu-list li{
    padding: 4px;
    font-size: 17px;
}
.dropmenu-list a{
    color: black;
}
.dropmenu-list a{
    color: black;
}
.dropmenu-list a:click{
    color: black;
}
.dropmenu-list a:hover{
    text-decoration: none;
    color: white;
}
.video-container{
    position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;
}
#myVideo{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
      

.header2 {
  position: relative;
  background-color: black;
  height: 65vh;
  min-height: 25rem;
  width: 100%;
  overflow: hidden;
}

.header2 video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: 0;
  -ms-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -webkit-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
}

.header2 .container {
  position: relative;
  z-index: 2;
}
.header2 .overlay {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background-color: black;
  opacity: 0.5;
  z-index: 1;
}

@media (pointer: coarse) and (hover: none) {
    .header2 {
    background: url('https://source.unsplash.com/XT5OInaElMw/1600x900') black no-repeat center center scroll;
    }
    .header2 video {
    display: none;
    }
}
.semi-text{
    font-family: Marck Script;
    font-size: 28px;
}
.main-title{
    font-family: Kaushan Script;
    font-size: 48px;
}
.main-title::after{
    background-color: #fff;
    content: "";
    display: block;
    height: 2px;
    margin: 0 auto;
    position: relative;
    top: 8px;
    width: 40px;
}
.text-container{
    margin-top: 280px;
}

/* after video */
.image-text-container{
    padding: 70px;
}
.ImageAndTextPanel-title{
    text-align: center;
    margin: 70px 0 70px 0;
}
.ImageAndTextPanel-title::after {
      background-color: #000;
    content: "";
    display: block;
    height: 2px;
    margin: 0 auto;
    position: relative;
    top: 8px;
    width: 433px;
}
.ImageAndTextPanel-columns{
    display: inline-block;
    margin: 0;
}
.text-panel{
    text-align: center;
    vertical-align: middle;
}
.image-text-wrapper{
    margin-bottom: 100px;
}
.text-panel-left{
    text-align: center;
    vertical-align: middle;
}
.carousel {
  width:930px;
  height:500px;
  margin: 0 auto;
}
.carousel-inner > .carousel-item > .view > img {
  height:500px;
}
.feature-container{
    padding-top: 140px;
}
.FeaturedProperty-title{
    text-align: center;
    margin-bottom: 70px;
}
.FeaturedProperty-title::after {
    background-color: #000;
    content: "";
    display: block;
    height: 2px;
    margin: 0 auto;
    position: relative;
    top: 8px;
    width: 460px;
}
.Heading-eyebrow{
    font-family: 'Dancing Script';
    font-size: 20px;
    font-weight: 600;
}
.Heading-title{
    font-family: 'Playfair Display';
    font-weight: 700;
}
.Heading-text{
	font-family: 'Nanum Myeongjo', serif;
    font-size: 18px;
}
.image-panel-itemContent{
	text-align: center;
}
#pFont{
	font-family: font-family: 'Nanum Myeongjo', serif;
}
</style>
<!-- video content -->
<div class="header2">
             <div class="overlay"></div>
             <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
                 <source src="<%=request.getContextPath() %>/video/mainVid.mp4" type="video/mp4"> 
    </video>
    <div class="container h-100">
        <div class="d-flex h-100 text-center align-items-center">
        <div class="w-100 text-white text-container">
           <!--  <p class="lead mb-0 semi-text">Discover</p>
            <h1 class="display-3 main-title">Designers of remarkable travel journeys</h1> -->
            <div class="underbar">
            	<%@include file="/WEB-INF/views/common/resvbar.jsp"%>
            </div>
        </div>
        </div>
    </div>
</div>

<!-- Feature container -->
<div class="feature-container">
    <div class="row">
        <div class="col-sm-12">
            <h2 class="FeaturedProperty-title ty-h2">DISCOVER BLUE MOON HOTEL</h2>
        </div>
        <!--Carousel Wrapper-->
        <div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
            <!--Indicators-->
            <ol class="carousel-indicators">
            <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-2" data-slide-to="1"></li>
            <li data-target="#carousel-example-2" data-slide-to="2"></li>
            <li data-target="#carousel-example-2" data-slide-to="3"></li>
            <li data-target="#carousel-example-2" data-slide-to="4"></li>
            </ol>
            <!--/.Indicators-->
            <!--Slides-->
            <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div class="view">
                <img class="d-block w-100" src="<%=request.getContextPath() %>/images/feature.jpg"
                    alt="First slide">
                <div class="mask rgba-black-light"></div>
                </div>
                <div class="carousel-caption">
                <h3 class="h3-responsive">HOTEL VIEW</h3>
                <p>푸른 제주 바다와 하늘이 맞닿은 곳에 위치한 블루문호텔</p>
                </div>
            </div>
            <div class="carousel-item">
                <!--Mask color-->
                <div class="view">
                <img class="d-block w-100" src="<%=request.getContextPath() %>/images/feature1.jpg"
                    alt="Second slide">
                <div class="mask rgba-black-strong"></div>
                </div>
                <div class="carousel-caption">
                <h3 class="h3-responsive">HOTEL VIEW</h3>
                <p>천국 같은 휴식과 여행의 즐거움을 동시에 누릴 수 있는 대한민국 대표 호텔</p>
                </div>
            </div>
            <div class="carousel-item">
                <!--Mask color-->
                <div class="view">
                <img class="d-block w-100" src="<%=request.getContextPath() %>/images/feature2.jpg"
                    alt="Third slide">
                <div class="mask rgba-black-slight"></div>
                </div>
                <div class="carousel-caption">
                <h3 class="h3-responsive">SCUBA DIVING</h3>
                <p>깨끗한 에메랄드 바닷속에 펼쳐지는 또 다른 세상을 만나보세요</p>
                </div>
            </div>
            <div class="carousel-item">
                <!--Mask color-->
                <div class="view">
                    <img class="d-block w-100" src="<%=request.getContextPath() %>/images/feature3.jpg"
                    alt="Third slide">
                    <div class="mask rgba-black-slight"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive">JEJU BEACH</h3>
                    <p>맑은 하늘 아래 펼쳐진 푸른 바다와 아름다운 해변</p>
                </div>
                </div>
                <div class="carousel-item">
                    <!--Mask color-->
                    <div class="view">
                        <img class="d-block w-100" src="<%=request.getContextPath() %>/images/feature4.jpg"
                        alt="Third slide">
                        <div class="mask rgba-black-slight"></div>
                    </div>
                    <div class="carousel-caption">
                        <h3 class="h3-responsive">MOVIE NIGHT</h3>
                        <p>힘든 하루 일정을 마치고 주간 영화의 밤에 함께하세요</p>
                    </div>
                    </div>
            </div>
            <!--/.Slides-->
            <!--Controls-->
            <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->
    </div>
</div>	

<!-- main image-text container -->
<div class="image-text-container">
    <h2 class="ImageAndTextPanel-title ty-h2">THE WORLD OF BLUE MOON</h2>
    <!-- left content -->
    <div class="image-text-wrapper">
        <div class="image-panel-item-container">
            <div class="image-panel-itemContent">
                    <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-5 offset-lg-1 col-xl-4 offset-xl-start ImageAndTextPanel-columns">
                        <img style="width:370px; height:493px;" src="<%=request.getContextPath() %>/images/hotelroom.jpg" alt="">
                    </div>
                    <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-4 offset-lg-1 col-xl-4 ImageAndTextPanel-columns text-panel">
                        <div class="image-text-pangel-textPanel">
                                <div class="Heading ImageAndTextPanel-Heading">
                                    <span class="Heading-eyebrow ty-h4">Blue Moon at Home Collection</span>
                                    <h3 class="Heading-title ty-h3">Wrap Yourself in Blue Moon Luxury at Home</h3>
                                    <p class="normal Heading-text ty-b2">합리적인 가격에 편안하고 아늑한 객실과 고품격 다이닝을 갖춘 호텔블루문이 제주의 휴양 문화를 한층 높은 격으로 이끌어 나아갑니다. 객실에서 보는 자연과 어우러진 푸른 제주의 조망은 포근한 힐링을 드립니다.</p>
                                </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- right content -->
    <div class="image-text-wrapper">
        <div class="image-panel-item-container">
            <div class="image-panel-itemContent">
                <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-4 offset-lg-1 col-xl-4 ImageAndTextPanel-columns text-panel-left">
                        <div class="image-text-pangel-textPanel">
                                <div class="Heading ImageAndTextPanel-Heading">
                                    <span class="Heading-eyebrow ty-h4">Blue Moon Private Retreats</span>
                                    <h3 class="Heading-title ty-h3">RENT A HOME WITH BLUE MOON</h3>
                                    <p class="normal Heading-text ty-b2">세계자연문화유산인 제주의 아름다운 풍광을 담은 호텔로써 그 명성을 쌓아가고 있는 호텔블루문은 90년 개관 후부터 지금까지 품격과 문화가 있는 휴식지로써 수많은 굵직한 국제행사를 성공적으로 치러온 최고의 호텔입니다.</p>
                                </div>
                        </div>
                    </div>
                <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-5 offset-lg-1 col-xl-4 offset-xl-start ImageAndTextPanel-columns">
                    <img src="<%=request.getContextPath() %>/images/main_detail2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- left content -->
    <div class="image-text-wrapper">
        <div class="image-panel-item-container">
            <div class="image-panel-itemContent">
                <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-5 offset-lg-1 col-xl-4 offset-xl-start ImageAndTextPanel-columns">
                    <img src="<%=request.getContextPath() %>/images/main_Detail3.jpg" alt="">
                </div>
                <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-4 offset-lg-1 col-xl-4 ImageAndTextPanel-columns text-panel">
                    <div class="image-text-pangel-textPanel">
                            <div class="Heading ImageAndTextPanel-Heading">
                                <span class="Heading-eyebrow ty-h4">Residences</span>
                                <h3 class="Heading-title ty-h3">AT HOME WITH BLUE MOON</h3>
                                <p class="normal Heading-text ty-b2">이국적인 분위기와 최고의 시설을 선보이며 고객에게 먼저 다가가는 호텔에 특화된 서비스로 호텔에 다녀간 세계의 국가 수반을 비롯 많은 VIP에게 크나 큰 찬사를 받아 왔습니다.</p>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
        <!-- right content -->
    <div class="image-text-wrapper">
        <div class="image-panel-item-container">
            <div class="image-panel-itemContent">
                <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-4 offset-lg-1 col-xl-4 ImageAndTextPanel-columns text-panel-left">
                        <div class="image-text-pangel-textPanel">
                            <div class="Heading ImageAndTextPanel-Heading">
                                <span class="Heading-eyebrow ty-h4">Blue Moon Private Jet</span>
                                <h3 class="Heading-title ty-h3">PREVIEW OUR NEW JET TAKING FLIGHT 2021</h3>
                                <p class="normal Heading-text ty-b2">한국의 전통미와 현대적 감각을 겸비하고 있는 세계 속의 명문호텔 블루문호텔은 세계 최고의 어번(Urban)라이프스타일 호텔로 고객들에게 최고급 Hospitality 서비스를 제공합니다.</p>
                            </div>
                        </div>
                    </div>
                <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-5 offset-lg-1 col-xl-4 offset-xl-start ImageAndTextPanel-columns">
                    <img style="width:370px; height:493px;" src="<%=request.getContextPath() %>/images/hotelImg1.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- left content -->
    <div class="image-text-wrapper">
            <div class="image-panel-item-container">
                <div class="image-panel-itemContent">
                    <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-5 offset-lg-1 col-xl-4 offset-xl-start ImageAndTextPanel-columns">
                        <img src="<%=request.getContextPath() %>/images/main_Detail5.jpg" alt="">
                    </div>
                    <div class="col-sm-10 offset-sm-1 col-md-6 offset-md-start col-lg-4 offset-lg-1 col-xl-4 ImageAndTextPanel-columns text-panel">
                        <div class="image-text-pangel-textPanel">
                            <div class="Heading ImageAndTextPanel-Heading">
                                <span class="Heading-eyebrow ty-h4">Blue Moon at Home Collection</span>
                                <h3 class="Heading-title ty-h3">Wrap Yourself in Blue Moon Luxury at Home</h3>
                                <p class="normal Heading-text ty-b2">한국을 대표하는 럭셔리 호텔로서 '일상이 최고의 순간이 되는 곳'이라는 컨셉을 새롭게 선보이며 휴식은 물론 고급 식문화, 예술, 엔터테인먼트 등 고객의 고품격 라이프스타일을 제안하는 공간으로 거듭나고 있습니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>

