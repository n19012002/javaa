<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Karma Shop</title>
    <!--
        CSS
        ============================================= -->
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

    <%@ include file="/views/home/includes/banner.jsp" %>

    <!-- start features Area -->
    <section class="features-area section_gap">
        <div class="container">
            <div class="row features-inner">
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="${pageContext.request.contextPath}/static/img/features/f-icon1.png" alt="">
                        </div>
                        <h6>Miễn phí vận chuyển</h6>
                        <p>Miễn phí vận chuyển cho mọi đơn hàng</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="${pageContext.request.contextPath}/static/img/features/f-icon2.png" alt="">
                        </div>
                        <h6>Chính sách đổi trả</h6>
                        <p>Đổi trả trong vòng 30 ngày</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="${pageContext.request.contextPath}/static/img/features/f-icon3.png" alt="">
                        </div>
                        <h6>Hỗ trợ 24/7</h6>
                        <p>Luôn sẵn sàng hỗ trợ</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="${pageContext.request.contextPath}/static/img/features/f-icon4.png" alt="">
                        </div>
                        <h6>Thanh toán an toàn</h6>
                        <p>Bảo mật thông tin thanh toán</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end features Area -->

    <!-- Start category Area -->
    <section class="category-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/static/img/category/c1.jpg" alt="">
                                <a href="${pageContext.request.contextPath}/static/img/category/c1.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">Giày thể thao</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/static/img/category/c2.jpg" alt="">
                                <a href="${pageContext.request.contextPath}/static/img/category/c2.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">Giày thể thao</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/static/img/category/c3.jpg" alt="">
                                <a href="${pageContext.request.contextPath}/static/img/category/c3.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">Sản phẩm cho cặp đôi</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/static/img/category/c4.jpg" alt="">
                                <a href="${pageContext.request.contextPath}/static/img/category/c4.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">Giày thể thao</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-deal">
                        <div class="overlay"></div>
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/static/img/category/c5.jpg" alt="">
                        <a href="${pageContext.request.contextPath}/static/img/category/c5.jpg" class="img-pop-up" target="_blank">
                            <div class="deal-details">
                                <h6 class="deal-title">Giày thể thao</h6>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End category Area -->

    <!-- start product Area -->
    <section class="owl-carousel active-product-area section_gap">
        <!-- single product slide -->
        <div class="single-product-slider">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Sản phẩm mới nhất</h1>
                            <p>Khám phá những mẫu giày mới nhất với thiết kế độc đáo và chất lượng hàng đầu.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%
                        List<Product> latestProducts = (List<Product>) request.getAttribute("latestProducts");
                        if (latestProducts != null) {
                            for (Product product : latestProducts) {
                    %>
                    <!-- single product -->
                    <div class="col-lg-3 col-md-6">
                        <div class="single-product">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/<%= product.getImage() %>" alt="">
                            <div class="product-details">
                                <h6><%= product.getName() %></h6>
                                <div class="price">
                                    <h6><%= String.format("%,.0fđ", product.getPrice()) %></h6>
                                    <h6 class="l-through"><%= String.format("%,.0fđ", product.getDiscountPrice()) %></h6>
                                </div>
                                <div class="prd-bottom">
                                    <a href="javascript:void(0)" onclick="addToCart(<%= product.getId() %>, <%= product.getPrice() %>)" class="social-info">
                                        <span class="ti-bag"></span>
                                        <p class="hover-text">thêm vào giỏ</p>
                                    </a>
                                    <a href="" class="social-info">
                                        <span class="lnr lnr-heart"></span>
                                        <p class="hover-text">yêu thích</p>
                                    </a>
                                    <a href="" class="social-info">
                                        <span class="lnr lnr-sync"></span>
                                        <p class="hover-text">so sánh</p>
                                    </a>
                                    <a href="DetailProductServlet?productId=<%= product.getId() %>" class="social-info">
                                        <span class="lnr lnr-move"></span>
                                        <p class="hover-text">xem thêm</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </section>
    <!-- end product Area -->

    <!-- Start exclusive deal Area -->
    <section class="exclusive-deal-area">
        <div class="container-fluid">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-6 no-padding exclusive-left">
                    <div class="row clock_sec clockdiv" id="clockdiv">
                        <div class="col-lg-12">
                            <h1>Ưu đãi độc quyền sắp kết thúc!</h1>
                            <p>Dành cho những người yêu thích phong cách thời trang.</p>
                        </div>
                        <div class="col-lg-12">
                            <div class="row clock-wrap">
                                <div class="col clockinner1 clockinner">
                                    <h1 class="days">150</h1>
                                    <span class="smalltext">Ngày</span>
                                </div>
                                <div class="col clockinner clockinner1">
                                    <h1 class="hours">23</h1>
                                    <span class="smalltext">Giờ</span>
                                </div>
                                <div class="col clockinner clockinner1">
                                    <h1 class="minutes">47</h1>
                                    <span class="smalltext">Phút</span>
                                </div>
                                <div class="col clockinner clockinner1">
                                    <h1 class="seconds">59</h1>
                                    <span class="smalltext">Giây</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="" class="primary-btn">Mua ngay</a>
                </div>
                <div class="col-lg-6 no-padding exclusive-right">
                    <div class="active-exclusive-product-slider">
                        <!-- single exclusive carousel -->
                        <div class="single-exclusive-slider">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/static/img/product/e-p1.png" alt="">
                            <div class="product-details">
                                <div class="price">
                                    <h6>3.750.000đ</h6>
                                    <h6 class="l-through">5.250.000đ</h6>
                                </div>
                                <h4>Giày thể thao Adidas đế mới
                                    dành cho người chơi thể thao</h4>
                                <div class="add-bag d-flex align-items-center justify-content-center">
                                    <a class="add-btn" href=""><span class="ti-bag"></span></a>
                                    <span class="add-text text-uppercase">Thêm vào giỏ</span>
                                </div>
                            </div>
                        </div>
                        <!-- single exclusive carousel -->
                        <div class="single-exclusive-slider">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/static/img/product/e-p1.png" alt="">
                            <div class="product-details">
                                <div class="price">
                                    <h6>3.750.000đ</h6>
                                    <h6 class="l-through">5.250.000đ</h6>
                                </div>
                                <h4>Giày thể thao Adidas đế mới
                                    dành cho người chơi thể thao</h4>
                                <div class="add-bag d-flex align-items-center justify-content-center">
                                    <a class="add-btn" href=""><span class="ti-bag"></span></a>
                                    <span class="add-text text-uppercase">Thêm vào giỏ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End exclusive deal Area -->

    <!-- Start brand Area -->
    <section class="brand-area section_gap">
        <div class="container">
            <div class="row">
                <a class="col single-img" href="#">
                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/static/img/brand/1.png" alt="">
                </a>
                <a class="col single-img" href="#">
                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/static/img/brand/2.png" alt="">
                </a>
                <a class="col single-img" href="#">
                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/static/img/brand/3.png" alt="">
                </a>
                <a class="col single-img" href="#">
                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/static/img/brand/4.png" alt="">
                </a>
                <a class="col single-img" href="#">
                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/static/img/brand/5.png" alt="">
                </a>
            </div>
        </div>
    </section>
    <!-- End brand Area -->

    <%@ include file="/views/home/includes/related-product.jsp" %>

    <%@ include file="/views/home/includes/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
     crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/static/js/vendor/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/nouislider.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/countdown.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/owl.carousel.min.js"></script>
    <!--gmaps Js-->
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="${pageContext.request.contextPath}/static/js/gmaps.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/main.js"></script>
    <script>
    function addToCart(productId, price) {
        // Kiểm tra đăng nhập
        <% if (session.getAttribute("user") == null) { %>
            if(confirm('Bạn cần đăng nhập để thêm vào giỏ hàng. Đăng nhập ngay?')) {
                window.location.href = '${pageContext.request.contextPath}/login';
            }
            return;
        <% } %>
        
        console.log('Adding to cart:', productId, price);
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/add',
            type: 'POST',
            data: {
                productId: productId,
                price: price
            },
            success: function(response) {
                console.log('Response:', response);
                if(response.success) {
                    alert('Đã thêm sản phẩm vào giỏ hàng!');
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

    // Hiển thị số lượng sản phẩm trong giỏ hàng khi tải trang
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