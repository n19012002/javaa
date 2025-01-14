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
            <div class="nav-tabs-wrapper">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link" onclick="openTab('description', event)">Mô tả</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" onclick="openTab('specification', event)">Thông số kỹ thuật</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link active" onclick="openTab('review', event)">Đánh giá</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" onclick="openTab('comment', event)">Bình luận</button>
                    </li>
                </ul>
            </div>

            <div class="tab-content">
                <div id="description" class="tab-pane" style="display: none;">
                    <p>${product.description}</p>
                </div>

                <div id="specification" class="tab-pane" style="display: none;">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><h5>Chiều rộng</h5></td>
                                    <td><h5>128mm</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Chiều cao</h5></td>
                                    <td><h5>508mm</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Chiều sâu</h5></td>
                                    <td><h5>85mm</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Trọng lượng</h5></td>
                                    <td><h5>52g</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Kiểm tra chất lượng</h5></td>
                                    <td><h5>Có</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Thời gian bảo hành</h5></td>
                                    <td><h5>12 tháng</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Đóng gói</h5></td>
                                    <td><h5>Hộp carton</h5></td>
                                </tr>
                                <tr>
                                    <td><h5>Phụ kiện kèm theo</h5></td>
                                    <td><h5>Hộp, sách hướng dẫn</h5></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="review" class="tab-pane" style="display: block;">
                    <%@ include file="review.jsp" %>
                </div>

                <div id="comment" class="tab-pane" style="display: none;">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="comment-section">
                                <!-- Form bình luận -->
                                <div class="comment-form mb-5">
                                    <div class="section-title">
                                        <h4>Viết bình luận</h4>
                                        <div class="title-line"></div>
                                    </div>
                                    <form id="commentForm" class="mt-4">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-user"></i></span>
                                                <input type="text" class="form-control" id="authorName" name="authorName" 
                                                    placeholder="Tên của bạn" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-comment"></i></span>
                                                <textarea class="form-control" id="content" name="content" rows="4" 
                                                    placeholder="Chia sẻ suy nghĩ của bạn về sản phẩm..." required></textarea>
                                            </div>
                                        </div>
                                        <button type="submit" class="primary-btn">
                                            <i class="fa fa-paper-plane"></i> Gửi bình luận
                                        </button>
                                    </form>
                                </div>

                                <!-- Danh sách bình luận -->
                                <div class="comments-list">
                                    <div class="section-title">
                                        <h4>Bình luận (${comments.size()})</h4>
                                        <div class="title-line"></div>
                                    </div>
                                    <c:forEach items="${comments}" var="comment">
                                        <div class="single-comment">
                                            <div class="comment-header">
                                                <div class="user-avatar">
                                                    <i class="fa fa-user-circle"></i>
                                                </div>
                                                <div class="user-info">
                                                    <h5>${comment.authorName}</h5>
                                                    <p class="date">
                                                        <i class="fa fa-clock-o"></i>
                                                        <fmt:formatDate value="${comment.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="comment-body">
                                                <p class="comment-text">${comment.content}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
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

    <style>
    .comment-section {
        padding: 30px 0;
    }

    .section-title {
        margin-bottom: 25px;
        position: relative;
    }

    .section-title h4 {
        color: #333;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .title-line {
        width: 50px;
        height: 2px;
        background: #ff6b6b;
        margin-bottom: 20px;
    }

    .comment-form {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group-text {
        background: #f8f9fa;
        border: 1px solid #ced4da;
        color: #666;
    }

    .form-control {
        border: 1px solid #ced4da;
        padding: 12px;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #ff6b6b;
        box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.25);
    }

    .primary-btn {
        background: #ff6b6b;
        color: #fff;
        padding: 12px 25px;
        border: none;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .primary-btn:hover {
        background: #ff5252;
        transform: translateY(-2px);
    }

    .primary-btn i {
        margin-right: 8px;
    }

    .single-comment {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
    }

    .single-comment:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .comment-header {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .user-avatar {
        width: 40px;
        height: 40px;
        background: #f8f9fa;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
    }

    .user-avatar i {
        font-size: 24px;
        color: #666;
    }

    .user-info h5 {
        color: #333;
        font-weight: 600;
        margin: 0 0 5px 0;
    }

    .date {
        color: #888;
        font-size: 0.85em;
        margin: 0;
    }

    .date i {
        margin-right: 5px;
    }

    .comment-body {
        padding-left: 55px;
    }

    .comment-text {
        color: #555;
        line-height: 1.6;
        margin: 0;
    }

    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .single-comment {
        animation: fadeIn 0.5s ease-out;
    }

    .nav-tabs-wrapper {
        border-bottom: 1px solid #ddd;
        margin-bottom: 30px;
    }

    .nav-tabs {
        border: none;
        display: flex;
        gap: 10px;
    }

    .nav-item {
        margin: 0;
    }

    .nav-link {
        border: none;
        background: none;
        color: #777;
        padding: 15px 25px;
        font-size: 16px;
        font-weight: 500;
        position: relative;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        color: #ff6b6b;
    }

    .nav-link.active {
        color: #ff6b6b;
    }

    .nav-link.active:after {
        content: '';
        position: absolute;
        bottom: -1px;
        left: 0;
        width: 100%;
        height: 2px;
        background: #ff6b6b;
    }

    .tab-content {
        padding: 30px 0;
    }

    .tab-pane {
        animation: fadeEffect 0.5s;
    }

    @keyframes fadeEffect {
        from {opacity: 0;}
        to {opacity: 1;}
    }
    </style>

    <script type="text/javascript">
        function openTab(tabName, event) {
            // Ẩn tất cả các tab
            var tabPanes = document.getElementsByClassName('tab-pane');
            for (var i = 0; i < tabPanes.length; i++) {
                tabPanes[i].style.display = 'none';
            }

            // Bỏ active tất cả các nút
            var tabButtons = document.getElementsByClassName('nav-link');
            for (var i = 0; i < tabButtons.length; i++) {
                tabButtons[i].classList.remove('active');
            }

            // Hiển thị tab được chọn
            document.getElementById(tabName).style.display = 'block';
            
            // Active nút được chọn
            if (event && event.currentTarget) {
                event.currentTarget.classList.add('active');
            }
        }

        // Mặc định hiển thị tab đánh giá
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('review').style.display = 'block';
            // Active nút đánh giá
            var reviewButton = document.querySelector('button[onclick*="review"]');
            if (reviewButton) {
                reviewButton.classList.add('active');
            }
        });
    </script>

    <script>
    $(document).ready(function() {
        $('#commentForm').on('submit', function(e) {
            e.preventDefault();
            
            // Kiểm tra đăng nhập
            <% if (session.getAttribute("user") == null) { %>
                if(confirm('Bạn cần đăng nhập để bình luận. Đăng nhập ngay?')) {
                    window.location.href = '${pageContext.request.contextPath}/login';
                }
                return;
            <% } %>
            
            $.ajax({
                url: '${pageContext.request.contextPath}/comment/add',
                type: 'POST',
                data: $(this).serialize(),
                success: function(response) {
                    if(response.success) {
                        alert('Bình luận của bạn đã được gửi thành công!');
                        location.reload();
                    } else {
                        alert('Có lỗi xảy ra: ' + response.message);
                    }
                },
                error: function() {
                    alert('Có lỗi xảy ra khi gửi bình luận. Vui lòng thử lại sau.');
                }
            });
        });
    });
    </script>
</body>
</html>