<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi" class="no-js">

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="CodePixar">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Chi tiết sản phẩm</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/linearicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nouislider.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ion.rangeSlider.skinFlat.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>

<body>
    <%@ include file="/views/home/includes/menu.jsp" %>
    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Chi tiết sản phẩm</h1>
                    <nav class="d-flex align-items-center">
                        <a href="${pageContext.request.contextPath}/">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
                        <a href="${pageContext.request.contextPath}/ProductServlet">Cửa hàng<span class="lnr lnr-arrow-right"></span></a>
                        <a href="#">Chi tiết sản phẩm</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Single Product Area =================-->
    <div class="product_image_area">
        <div class="container">
            <div class="row s_product_inner">
                <div class="col-lg-6">
					<div class="s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="${pageContext.request.contextPath}/${product.image}" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="${pageContext.request.contextPath}/${product.image}" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="${pageContext.request.contextPath}/${product.image}" alt="">
						</div>
					</div>
                </div>
                <div class="col-lg-5 offset-lg-1">
                    <div class="s_product_text">
                        <h3>${product.name}</h3>
                        <h2><%= String.format("%,.0fđ", ((model.Product)request.getAttribute("product")).getPrice()) %></h2>
                        <ul class="list">
                            <li><a class="active" href="#"><span>Danh mục</span> : ${categoryName}</a></li>
                            <li><a href="#"><span>Tình trạng</span> : Còn hàng</a></li>
                        </ul>
                        <p>${product.description}</p>
                        <div class="product_count">
                            <label for="qty">Số lượng:</label>
                            <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Số lượng:" class="input-text qty">
                            <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                            <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                        </div>
                        <div class="card_area d-flex align-items-center">
                            <a class="primary-btn" href="javascript:void(0)" onclick="addToCart(${product.id}, ${product.price}, document.getElementById('sst').value)">Thêm vào giỏ</a>
                            <a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
                            <a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

    <!--================Product Description Area =================-->
    <section class="product_description_area">
        <div class="container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Mô tả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                        aria-selected="false">Thông số kỹ thuật</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                        aria-selected="false">Bình luận</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                        aria-selected="false">Đánh giá</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <p>${product.description}</p>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                        <h5>Chiều rộng</h5>
                                    </td>
                                    <td>
                                        <h5>128mm</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Chiều cao</h5>
                                    </td>
                                    <td>
                                        <h5>508mm</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Chiều sâu</h5>
                                    </td>
                                    <td>
                                        <h5>85mm</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Trọng lượng</h5>
                                    </td>
                                    <td>
                                        <h5>52g</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Kiểm tra chất lượng</h5>
                                    </td>
                                    <td>
                                        <h5>Có</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Thời gian bảo hành</h5>
                                    </td>
                                    <td>
                                        <h5>12 tháng</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Đóng gói</h5>
                                    </td>
                                    <td>
                                        <h5>Hộp carton</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>Phụ kiện kèm theo</h5>
                                    </td>
                                    <td>
                                        <h5>Hộp, sách hướng dẫn</h5>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="row">
                        <div class="col-lg-6">
                            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                            <!-- Vòng lặp để hiển thị từng bình luận -->
                            <div class="comment_list">
                                <c:forEach var="comment" items="${comments}">
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="${pageContext.request.contextPath}/static/img/product/review-1.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4>${comment.authorName}</h4>
                                                <h5>${comment.createdAt}</h5>
                                                <a class="reply_btn" href="#">Trả lời</a>
                                            </div>
                                        </div>
                                        <p>${comment.content}</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="review_box">
                                <h4>Viết bình luận</h4>
                                <form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Địa chỉ email">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="number" name="number" placeholder="Số điện thoại">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea class="form-control" name="message" id="message" rows="1" placeholder="Nội dung bình luận"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-right">
                                        <button type="submit" value="submit" class="btn primary-btn">Gửi bình luận</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- <div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-3.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div> -->
						</div>
                        <div class="col-lg-6">
                            <div class="review_box">
                                <h4>Add a Review</h4>
                                <p>Your Rating:</p>
                                <ul class="list">
                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                </ul>
                                <p>Outstanding</p>
                                <form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Your Full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Full name'">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="number" name="number" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea class="form-control" name="message" id="message" rows="1" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-right">
                                        <button type="submit" value="submit" class="btn primary-btn">Submit Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Product Description Area =================-->

    <!--================ start footer Area  =================-->
    <%@ include file="/views/home/includes/footer.jsp" %>
    <!--================ End footer Area  =================-->

    <!-- Modal Quick Product View -->
    <script src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
     crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/static/js/vendor/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/nouislider.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/owl.carousel.min.js"></script>
    <!--gmaps Js-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="${pageContext.request.contextPath}/static/js/gmaps.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/main.js"></script>
    <script>
    function addToCart(productId, price, quantity) {
        // Kiểm tra đăng nhập
        <% if (session.getAttribute("user") == null) { %>
            if(confirm('Bạn cần đăng nhập để thêm vào giỏ hàng. Đăng nhập ngay?')) {
                window.location.href = '${pageContext.request.contextPath}/login';
            }
            return;
        <% } %>
        
        // Chuyển đổi quantity từ string sang number
        quantity = parseInt(quantity);
        if (isNaN(quantity) || quantity < 1) {
            alert('Vui lòng nhập số lượng hợp lệ');
            return;
        }
        
        console.log('Adding to cart:', productId, price, quantity);
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/add',
            type: 'POST',
            data: {
                productId: productId,
                price: price,
                quantity: quantity
            },
            success: function(response) {
                console.log('Response:', response);
                if(response.success) {
                    alert('Đã thêm ' + quantity + ' sản phẩm vào giỏ hàng!');
                    updateCartCount(response.cartCount);
                } else {
                    if(response.error === 'NOT_LOGGED_IN') {
                        if(confirm('Bạn cần đăng nhập để thêm vào giỏ hàng. Đăng nhập ngay?')) {
                            window.location.href = '${pageContext.request.contextPath}/login';
                        }
                    } else {
                        alert('Có lỗi xảy ra: ' + (response.message || 'Không thể thêm vào giỏ hàng'));
                    }
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                console.error('Status:', status);
                console.error('Response:', xhr.responseText);
                try {
                    var response = JSON.parse(xhr.responseText);
                    alert('Có lỗi xảy ra: ' + (response.message || 'Không thể thêm vào giỏ hàng'));
                } catch(e) {
                    alert('Có lỗi xảy ra khi thêm vào giỏ hàng!');
                }
            }
        });
    }

    $(document).ready(function() {
        <% if (session.getAttribute("user") != null) { %>
            $.get('${pageContext.request.contextPath}/cart/count', function(response) {
                if(response.success) {
                    updateCartCount(response.cartCount);
                }
            });
        <% } %>
    });

    function updateCartCount(count) {
        $('.cart-count').text(count || '0');
    }
    </script>
</body>
</html>