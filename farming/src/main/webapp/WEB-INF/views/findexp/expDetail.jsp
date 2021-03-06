<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/expDetail.css">
<section>
      <!-- Slider main container-->
      <div class="swiper-container detail-slider slider-gallery">
        <!-- Additional required wrapper-->
        <div class="swiper-wrapper">
          <!-- Slides-->
          <div class="swiper-slide"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1426122402199-be02db90eb90.jpg" data-toggle="gallery-top" title="Our street"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Our street"></a></div>
          <div class="swiper-slide"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" data-toggle="gallery-top" title="Outside"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Outside"></a></div>
          <div class="swiper-slide"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1494526585095-c41746248156.jpg" data-toggle="gallery-top" title="Rear entrance"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1494526585095-c41746248156.jpg" alt="Rear entrance"></a></div>
          <div class="swiper-slide"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1484154218962-a197022b5858.jpg" data-toggle="gallery-top" title="Kitchen"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Kitchen"></a></div>
          <div class="swiper-slide"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" data-toggle="gallery-top" title="Bedroom"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Bedroom"></a></div>
          <div class="swiper-slide"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" data-toggle="gallery-top" title="Bedroom"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Bedroom"></a></div>
        </div>
        <div class="swiper-pagination swiper-pagination-white"></div>
        <div class="swiper-button-prev swiper-button-white"></div>
        <div class="swiper-button-next swiper-button-white"></div>
      </div>
    </section>
    
    <div class="container py-5">
      <div class="row">
        <div class="col-lg-8"> 
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item"><a class="nav-link active" id="tab1" data-bs-toggle="tab" href="#tab1-content" role="tab" aria-controls="tab1-content" aria-selected="true">????????? ??????</a></li>
            <li class="nav-item"><a class="nav-link" id="tab2" href="#review" role="tab" aria-controls="tab2-content">????????? ??????</a></li>
            <li class="nav-item"><a class="nav-link" id="tab3" data-bs-toggle="tab" href="#tab3-content" role="tab" aria-controls="tab3-content" aria-selected="false">?????? ??????</a></li>
          </ul>
          <div class="tab-content py-5 px-3">
          <div class="text-block">
          	<input type="hidden" name="expertNo" value="${expNo }">
            <h1 class="mb-4">${expVo.name }</h1>
            <h6 class="mb-3">?????? ??????</h6>
            <p id="introBox" class="text-muted fw-light">${infoVo.intro}</p>
            
          </div>
          <div class="text-block">
            <h4 class="mb-4">????????????</h4>
            <div class="row"> 
              <div class="col-md-6">
                <ul class="list-unstyled text-muted">
                  <li class="mb-2"> 
	                  <i class="fas fa-user text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">????????????</span>
                  </li>
                  <li class="mb-2"> 
	                  <i class="far fa-star text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">?????????</span>
                  </li>
                  <li class="mb-2"> 
	                  <i class="fas fa-map-marker-alt text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">${fn:substring(expVo.address1,0,6)}</span>
                  </li>
                  <li class="mb-2"> 
                  	<c:if test="${infoVo.contactTime!='N'}">
	                  <i class="far fa-clock text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">?????? ?????? ?????? : ${infoVo.contactTime }</span>
	                 </c:if>
                  </li>
                  <li class="mb-2"> 
                  	<c:if test="${infoVo.payMethod!='N'}">
	                  <i class="far fa-credit-card text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">${infoVo.payMethod}</span>
	                </c:if>
                  </li>
                </ul>
              </div>
              <div class="col-md-6">
                <ul class="list-unstyled text-muted">
                  <li class="mb-2"> 
	                  <i class="fas fa-briefcase text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">${infoVo.career }</span>
                  </li>
                  <li class="mb-2"> 
	                  <i class="fas fa-user-friends text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">${infoVo.staff }</span>
                  </li>
                  <li class="mb-2"> 
                  	<c:if test="${infoVo.businessLicense!='N'}">
	                  <i class="far fa-building text-primary w-0rem me-3 text-center"></i>
	                  <span class="text-sm">${infoVo.businessLicense }</span>
	                 </c:if>
                  </li>
                  <li class="mb-2"> 
	                  <c:if test="${!empty infoVo.license}">
	                  	<i class="far fa-id-badge text-primary w-0rem me-3 text-center"></i>
		                <span class="text-sm">????????? ????????????</span>
	                  </c:if>
                  </li>
                  <li class="mb-2"> 
	                  <i class="fas fa-file-invoice-dollar text-primary w-0rem me-3 text-center"></i>
	                  <c:if test="${infoVo.taxInvoice=='N' }">
	                  	<span class="text-sm">??????????????? ?????? ??????</span>
	                  </c:if>
	                  <c:if test="${infoVo.taxInvoice=='Y' }">
	                  	<span class="text-sm">??????????????? ?????? ??????</span>
	                  </c:if>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="text-block">
            <h4 class="mb-4">?????? ?????????</h4>
            <ul class="list-inline">
            	<c:forEach var="fieldVo" items="${fieldList }">
	              <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">${fieldVo.detail }</span></li>
            	</c:forEach>
            </ul>
          </div>
          <div class="text-block">
            <h4 class="mb-4">????????? ?????? ??????</h4>
            <p class="text-muted fw-light">${infoVo.detailInfo}</p>
          </div>
          <div class="text-block">
            <h5 class="mb-4">Listing location</h5>
            <div class="map-wrapper-300 mb-3">
           	  <input type="hidden" id="address" value="${expVo.address1}">
              <div class="h-100 " id="map"></div>
		        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ab27a9b343549c3f2b304d54c5e1a7&libraries=services"></script>
				<script type="text/javascript">
					var mapContainer = document.getElementById('map'), // ????????? ????????? div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
				        level: 3 // ????????? ?????? ??????
				    };  
			
					// ????????? ???????????????    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
				
					// ??????-?????? ?????? ????????? ???????????????
					var geocoder = new kakao.maps.services.Geocoder();
				
					var address=$('#address').val();
					// ????????? ????????? ???????????????
					geocoder.addressSearch(address, function(result, status) {
						//console.log("search ????????? ??????=>"+address);
				
					    // ??????????????? ????????? ??????????????? 
					     if (status === kakao.maps.services.Status.OK) {
				
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
					        // ??????????????? ?????? ????????? ????????? ???????????????
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
				
				
					        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
					        map.setCenter(coords);
					    } 
					});
				</script>
	            </div>
	          </div>
	          <div class="text-block">
	            <h5 class="mb-4">??????</h5>
	            <div class="row gallery mb-3 ms-n1 me-n1">
	              <div class="col-lg-4 col-6 px-1 mb-2"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1426122402199-be02db90eb90.jpg" data-fancybox="gallery" title="Our street"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="..."></a></div>
	              <div class="col-lg-4 col-6 px-1 mb-2"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" data-fancybox="gallery" title="Outside"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="..."></a></div>
	              <div class="col-lg-4 col-6 px-1 mb-2"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1494526585095-c41746248156.jpg" data-fancybox="gallery" title="Rear entrance"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1494526585095-c41746248156.jpg" alt="..."></a></div>
	              <div class="col-lg-4 col-6 px-1 mb-2"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1484154218962-a197022b5858.jpg" data-fancybox="gallery" title="Kitchen"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="..."></a></div>
	              <div class="col-lg-4 col-6 px-1 mb-2"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" data-fancybox="gallery" title="Bedroom"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="..."></a></div>
	              <div class="col-lg-4 col-6 px-1 mb-2"><a href="${pageContext.request.contextPath }/resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" data-fancybox="gallery" title="Bedroom"><img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="..."></a></div>
	            </div>
	          </div>
	          </div>
	          <div class="text-block" id="review">
	          	<!-- include ????????? -->
	            <p class="subtitle text-sm text-primary">Reviews    </p>
	            <h5 class="mb-4">????????? ??????</h5>
	            <c:import url="/reviewList?expertNo=${expVo.expertNo }"/>
            
            <div class="py-5">
              <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview">????????? ?????? ?????????</button>
              <div class="collapse mt-4" id="leaveReview">
                <h5 class="mb-4">????????? ?????? ??????</h5>
                <form class="form" id="contact-form" method="post" action="<c:url value='/reviewWrite'/>">
	                <input type="hidden" name="memberNo" value="${userNo }">
	                <input type="hidden" name="name" value="${name }">
					<input type="hidden" name="expertNo" value="${expVo.expertNo }">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="mb-4">
                        <label class="form-label" for="rating">?????? ??????</label>
                        <div class="chk_list">
						    <input type="radio" name="rate" value="5" id="rate1"><label for="rate1"></label>
						    <input type="radio" name="rate" value="4" id="rate2"><label for="rate2"></label>
						    <input type="radio" name="rate" value="3" id="rate3"><label for="rate3"></label>
						    <input type="radio" name="rate" value="2" id="rate4"><label for="rate4"></label>
						    <input type="radio" name="rate" value="1" id="rate5"><label for="rate5"></label>
						</div>
                      </div>
                    </div>
                  </div>
                  <div class="mb-4">
                    <label class="form-label" for="review">?????? ??????</label>
                    <textarea class="form-control" rows="4" name="content" id="content" placeholder="????????? ?????? ????????? ??????????????????." required="required"></textarea>
                  </div>
                  <div class="mb-3">
					  <label for="formFile" class="form-label">????????? ?????????</label>
					  <input class="form-control" type="file" id="formFile" name="fileName" >
					</div>
                  <button class="btn btn-primary" type="submit">?????? ??????</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="p-4 shadow ms-lg-4 rounded sticky-top" style="top: 100px;">
            <p class="text-muted">${expVo.name } ??????????????? ????????? ???????????? ????????? ??????????????? </p>
            <form class="form" id="requestForm" method="get" action="<c:url value='/request/requestWrite'/>">
            <input type="hidden" name="categoryNo" value="${infoVo.categoryNo }" >
            <input type="hidden" name="expertNo" value="${expVo.expertNo }" >
            
             <div class="mb-4">
              </div>
              <!-- <div class="mb-4">
                <label class="form-label" for="guests">Guests *</label>
                <select class="form-control" name="guests" id="guests">
                  <option value="1">1 Guest</option>
                  <option value="2">2 Guests</option>
                  <option value="3">3 Guests</option>
                  <option value="4">4 Guests</option>
                  <option value="5">5 Guests</option>
                </select> 
              </div> -->
              <div class="d-grid mb-4">
                <button type="submit" class="btn btn-primary btn-lg" >??????????????????</button>
              </div>
	            <p class="text-muted text-sm text-center">?????????????????? 1????????? ???????????? ?????????????????????.</p>
            </form>
            <hr class="my-4">
            <div class="text-center">
              <p> <a class="text-warning text-sm" href="#"> <i class="fa fa-heart"></i>?????????/????????????</a></p>
              <p class="text-muted text-sm">79 ?????? ??????????????? ???????????? ???????????????.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="py-6 bg-gray-100"> 
      <div class="container">
        <h5 class="mb-0">????????? ?????????</h5>
        <p class="subtitle text-sm text-primary mb-4">Find another expert       </p>
        <!-- Slider main container-->
        <div class="swiper-container swiper-container-mx-negative swiper-init pt-3" data-swiper="{&quot;slidesPerView&quot;:4,&quot;spaceBetween&quot;:20,&quot;loop&quot;:true,&quot;roundLengths&quot;:true,&quot;breakpoints&quot;:{&quot;1200&quot;:{&quot;slidesPerView&quot;:3},&quot;991&quot;:{&quot;slidesPerView&quot;:2},&quot;565&quot;:{&quot;slidesPerView&quot;:1}},&quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;,&quot;clickable&quot;:true,&quot;dynamicBullets&quot;:true}}">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
          
            <!-- ?????????????????? ???????????? ?????? -->
            <c:forEach var="map" items="${expList }">
            	<c:if test="${map['EXPERT_NO']!=param.expertNo }">
	            <div class="swiper-slide h-auto px-2">
	              <!-- place item-->
	              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
	                <div class="card h-100 border-0 shadow">
	                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/>
	                  	<a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=${map[\'EXPERT_NO\'] }'/>"></a>
	                    <div class="card-img-overlay-bottom z-index-20">
	                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/userImg/${map['FILENAME']}" alt=""/>
	                        <div>${map['NAME'] }</div>
	                      </div>
	                    </div>
	                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
	                        <svg class="svg-icon text-white">
	                          <use xlink:href="#heart-1"> </use>
	                        </svg></a></div>
	                  </div>
	                  <div class="card-body d-flex align-items-center">
	                    <div class="w-100">
	                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">${map['INTRO'] }</a></h6>
	                      <div class="d-flex card-subtitle mb-3">
	                        <p class="flex-grow-1 mb-0 text-muted text-sm">${fn:substring(map['ADDRESS1'],0,6)}</p>
	                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
	                        </p>
	                      </div>
	                      <p class="card-text text-muted"><strong>${map['EMP_COUNT'] }</strong>??? ??????</p>
	                    </div>
	                  </div>
	                </div> 
	              </div>
	            </div>
	           </c:if>
            </c:forEach>
            <!--  -->
          </div>
          <!-- If we need pagination-->
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </div>
    
<%@ include file="../inc/bottom.jsp" %>