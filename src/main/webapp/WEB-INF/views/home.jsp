<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="assetsPath" value="${pageContext.request.contextPath }/resources/assets" />
<c:set var="assets_shPath" value="${pageContext.request.contextPath }/resources/assets_sh" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%
	request.setCharacterEncoding("utf-8");
	
	String u_p_id = request.getParameter("u_p_id");
	String u_p_add_id = request.getParameter("u_p_add_id");
	String u_p_address = request.getParameter("u_p_address");
	String u_p_flag = request.getParameter("u_p_flag");


%>

<!doctype html><html lang="en">
<!-- head-->
<%@ include file="include/head.jsp" %>


<body>
<!--====== PRELOADER PART START ======-->
<div class="preloader">
	<div class="loader">
		<div class="ytp-spinner">
			<div class="ytp-spinner-container">
				<div class="ytp-spinner-rotator">
					<div class="ytp-spinner-left">
						<div class="ytp-spinner-circle">
						</div>
					</div>
					<div class="ytp-spinner-right">
						<div class="ytp-spinner-circle">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--====== PRELOADER PART ENDS ======-->
<!--====== HEADER PART START ======-->
<%@ include file="include/header.jsp" %>
<!--====== HEADER PART ENDS ======-->



<!--====== DOWNLOAD PART START ======-->
<section class="download-area">
<div class="container">
	<div class="row justify-content-center">
	   <img src="${assetsPath}/images/푸드트럭.jpg" alt="푸드트럭">
		<div class="col-lg-8">
			<div class="section-title text-center">
				
				<br><br><br><br>
				<c:if test="${sessionScope.user_id == null}">
				<img src="${assetsPath}/images/shape/title-shape-2.png" alt="title">
					<a class="mt-4" href="${contextPath }/login">로그인 후 내주소 보러가기</a><br>
				</c:if>
				
				
				<c:if test="${sessionScope.user_id != null}">
				<img src="${assetsPath}/images/shape/title-shape-2.png" alt="title">
					<a class="mt-4" href="${contextPath }/mypageU/u_Addr_List">내주소 보러가기</a><br>
					<form action="u_Addr_One" method="get">
 							<h6 class="footer-heading mb-4">${u_addr_one.u_p_id} | ${u_addr_one.u_p_add_id} | ${u_addr_one.u_p_address}</h6>
					</form>
				</c:if>

				<img src="${assetsPath}/images/shape/title-shape-2.png" alt="title">
				<a class="mt-4" href="${contextPath }/main/notice_One">공지사항 보러가기</a> <br>
				<form action="notice_One" method="get">
	  				<h6 class="footer-heading mb-4">${notice_one.b_writer} | ${notice_one.b_title} | ${notice_one.b_content}</h6>
				</form>

				
				
			</div>
		  </div>
	  </div>
  </div>
<br>
<!--====== CATEGORY START ======-->
	<section class="site-footer border-top"> <br>
	   <div class="container">
	      <div class="page-title-box text-center">
	      	 <h4 class="title">MENU CATEGOTY</h4> <br>
			     <c:forEach var="ca" items="${catego}"> 
		            <tr>
		              <th><a href="${contextPath }/main/category_One?c_id=${ca.c_id}" class="btn btn-outline-warning btn-fw"> ${ca.c_name }</a></th>
		            </tr>
	             </c:forEach>
		     </div>
	    </div>
	  <br>
	</section>


<!--====== CATEGORY ENDS======-->
<!--====== STORETYPE START======-->
<hr>
<div class="download-item-area bg_cover mt-30">
	<div class="container">
		<div class="row align-items-center">
	
		  <!-- 가게조회 -->
			<div class="card-body">
                  <h4 class="card-title">STORE LIST</h4>
		                <p>
							<i class="fas fa-map-marker-alt"></i>뀨잉
						</p>
                  
                  <div class="table-responsive">
                    
	                  <table class="table">
	                        <tr>
	                          <th>가게명</th>
	                          <th>전화번호</th>
	                          <th>오픈 여부</th>
	                        </tr>
	                      
						<c:forEach var="st" items="${storetype }">
							<tr>
								<td><a href="${contextPath }/store/menu_list?u_s_id=${st.u_s_id }">${st.s_name }</a></td>
								<td>${st.s_number }</td>
									<c:if test="${st.s_state eq '1'}">
										<td><label class="badge badge-warning">OPEN</label></td>
									</c:if>
									
									<c:if test="${st.s_state eq '2'}">
										<td><label class="badge badge-danger">CLOSE</label></td>
									</c:if>
							</tr>
						</c:forEach>
	                      
	                    </table>
                    
               
                  </div>
                </div>	
			 <!-- 가게조회 끝 -->
		</div>
	</div>
</div>
</section>
<!--====== STORETYPE ENDS ======-->


<!--====== FOOTER PART START ======-->
<footer class="footer-area bg_cover" style="background-image: url(${assetsPath}/images/footer-bg.jpg);">
<div class="container">
	<div class="row">
		<div class="col-lg-4 col-md-6">
			<div class="footer-widget mt-30">
				<div class="footer-title">
					<img src="${assetsPath}/images/shape/title-shape-2.png" alt="">
					<h4 class="title">About Rondhon</h4>
				</div>
				<div class="footer-about-info mt-30">
					<p>
						There are many variations of passages of Lorem Ipsum.
					</p>
					<ul>
						<li><i class="fal fa-map-marker-alt"></i>21/3 Soi Saladaeng 1,Silom road,New York,USA</li>
						<li><i class="fal fa-phone"></i>515-708-9386</li>
						<li><i class="fal fa-envelope"></i>deliveyinfo@rondhon.com</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6">
			<div class="footer-widget mt-30">
				<div class="footer-title">
					<img src="${assetsPath}/images/shape/title-shape-2.png" alt="">
					<h4 class="title">Opening Hours</h4>
				</div>
				<div class="footer-list mt-20">
					<ul>
						<li><span>Monday</span>
						<p>
							8.00 - 20.00
						</p>
						</li>
						<li><span>Tuesday</span>
						<p>
							8.00 - 20.00
						</p>
						</li>
						<li><span>Wednesday</span>
						<p>
							8.00 - 20.00
						</p>
						</li>
						<li><span>Thursday</span>
						<p>
							8.00 - 20.00
						</p>
						</li>
						<li><span>Friday</span>
						<p>
							8.00 - 20.00
						</p>
						</li>
						<li><span>Saturday</span>
						<p>
							8.00 - 20.00
						</p>
						</li>
						<li><span>Sunday</span>
						<p>
							closed
						</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6">
			<div class="footer-widget mt-30">
				<div class="footer-title">
					<img src="${assetsPath}/images/shape/title-shape-2.png" alt="">
					<h4 class="title">We Are On Instagram</h4>
				</div>
				<div class="footer-instagram mt-25">
					<ul>
						<li><a href="#"><img src="${assetsPath}/images/ins-1.jpg" alt="ins"><span class="instagram-overlay"><i class="fab fa-instagram"></i></span></a></li>
						<li><a href="#"><img src="${assetsPath}/images/ins-2.jpg" alt="ins"><span class="instagram-overlay"><i class="fab fa-instagram"></i></span></a></li>
						<li><a href="#"><img src="${assetsPath}/images/ins-3.jpg" alt="ins"><span class="instagram-overlay"><i class="fab fa-instagram"></i></span></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="${assetsPath}/images/ins-4.jpg" alt="ins"><span class="instagram-overlay"><i class="fab fa-instagram"></i></span></a></li>
						<li><a href="#"><img src="${assetsPath}/images/ins-5.jpg" alt="ins"><span class="instagram-overlay"><i class="fab fa-instagram"></i></span></a></li>
						<li><a href="#"><img src="${assetsPath}/images/ins-6.jpg" alt="ins"><span class="instagram-overlay"><i class="fab fa-instagram"></i></span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="footer-copyright d-block d-sm-flex justify-content-between align-items-center">
				<p>
					ⓒ 2020 Rondhon All Right <a href="http://www.bootstrapmb.com" title="">Reserved</a>
				</p>
				<a href="#"><img src="${assetsPath}/images/payment.png" alt=""></a>
			</div>
		</div>
	</div>
</div>
</footer>
<!--====== FOOTER PART ENDS ======-->
<!--====== GO TO TOP PART START ======-->
<div class="go-top-area">
	<div class="go-top-wrap">
		<div class="go-top-btn-wrap">
			<div class="go-top go-top-btn">
				<i class="fa fa-angle-double-up"></i><i class="fa fa-angle-double-up"></i>
			</div>
		</div>
	</div>
</div>
<!--====== GO TO TOP PART ENDS ======-->
<!--====== jquery js ======-->
<script src="${assetsPath}/js/vendor/modernizr-3.6.0.min.js"></script>
<script src="${assetsPath}/js/vendor/jquery-3.5.1.min.js"></script>
<!--====== Bootstrap js ======-->
<script src="${assetsPath}/js/bootstrap.min.js"></script>
<script src="${assetsPath}/js/popper.min.js"></script>
<!--====== Slick js ======-->
<script src="${assetsPath}/js/slick.min.js"></script>
<!--====== Isotope js ======-->
<script src="${assetsPath}/js/isotope.pkgd.min.js"></script>
<!--====== Images Loaded js ======-->
<script src="${assetsPath}/js/imagesloaded.pkgd.min.js"></script>
<!--====== parallaxie js ======-->
<script src="${assetsPath}/js/parallaxie.js"></script>
<!--====== nice select js ======-->
<script src="${assetsPath}/js/jquery.nice-select.min.js"></script>
<!--====== odometer js ======-->
<script src="${assetsPath}/js/odometer.min.js"></script>
<script src="${assetsPath}/js/jquery.appear.min.js"></script>
<!--====== Magnific Popup js ======-->
<script src="${assetsPath}/js/jquery.magnific-popup.min.js"></script>
<!--====== Main js ======-->
<script src="${assetsPath}/js/main.js"></script>
</body>
</html>