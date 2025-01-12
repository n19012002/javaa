<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="model.Comment" %>

<!DOCTYPE html>
<html lang="vi" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Chi tiết bài viết</title>

    <!--
        CSS
        ============================================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/linearicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body>
    <%@ include file="/views/home/includes/menu.jsp" %>

    <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                    <div class="single-post row">
                        <div class="col-lg-12">
                            <div class="feature-img">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/<%= ((Post) request.getAttribute("post")).getImage() %>" alt="">
                            </div>
                        </div>
                        <div class="col-lg-3  col-md-3">
                            <div class="blog_info text-right">
                                <div class="post_tag">
                                    <a href="#">Thời trang</a>
                                    <a class="active" href="#">Công nghệ</a>
                                    <a href="#">Phong cách sống</a>
                                    <a href="#">Thiết kế</a>
                                </div>
                                <ul class="blog_meta list">
                                    <li><a href="#"><%= ((Post) request.getAttribute("post")).getAuthorName() %><i class="lnr lnr-user"></i></a></li>
                                    <li><a href="#"><%= ((Post) request.getAttribute("post")).getCreatedAt() %><i class="lnr lnr-calendar-full"></i></a></li>
                                    <li><a href="#"><%= ((Post) request.getAttribute("post")).getViews() %> Lượt xem<i class="lnr lnr-eye"></i></a></li>
                                    <li><a href="#"><%= ((Post) request.getAttribute("post")).getCommentsCount() %> Bình luận<i class="lnr lnr-bubble"></i></a></li>
                                </ul>
                                <ul class="social-links">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-github"></i></a></li>
                                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9 blog_details">
                            <h2><%= ((Post) request.getAttribute("post")).getTitle() %></h2>
                            <p class="excert">
                                <%= ((Post) request.getAttribute("post")).getContent() %>
                            </p>
                        </div>
                        <div class="col-lg-12">
                            <div class="quotes">
                                <%= ((Post) request.getAttribute("post")).getContent() %>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/static/img/blog/post-img1.jpg" alt="">
                                </div>
                                <div class="col-6">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/static/img/blog/post-img2.jpg" alt="">
                                </div>
                                <div class="col-lg-12 mt-25">
                                    <p>
                                        <%= ((Post) request.getAttribute("post")).getContent() %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comments-area">
                        <h4><%= ((List<Comment>) request.getAttribute("comments")).size() %> Bình luận</h4>
                        <%
                            List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                            for (Comment comment : comments) {
                        %>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="${pageContext.request.contextPath}/static/img/blog/c1.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#"><%= comment.getAuthorName() %></a></h5>
                                        <p class="date"><%= comment.getCreatedAt() %></p>
                                        <p class="comment">
                                            <%= comment.getContent() %>
                                        </p>
                                    </div>
                                </div>
                                <div class="reply-btn">
                                    <a href="" class="btn-reply text-uppercase">Trả lời</a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="comment-form">
                        <h4>Để lại bình luận</h4>
                        <form>
                            <div class="form-group form-inline">
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <input type="text" class="form-control" id="name" placeholder="Nhập tên" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Nhập tên'">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 email">
                                    <input type="email" class="form-control" id="email" placeholder="Nhập địa chỉ email"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nhập địa chỉ email'">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="subject" placeholder="Tiêu đề" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Tiêu đề'">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control mb-10" rows="5" name="message" placeholder="Nội dung"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nội dung'" required=""></textarea>
                            </div>
                            <a href="#" class="primary-btn submit_btn">Gửi bình luận</a>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Tìm kiếm bài viết" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tìm kiếm bài viết'">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
                                </span>
                            </div>
                            <div class="br"></div>
                        </aside>
                        <aside class="single_sidebar_widget author_widget">
                            <img class="author_img rounded-circle" src="${pageContext.request.contextPath}/static/img/blog/author.png" alt="">
                            <h4>Tác giả</h4>
                            <p>Biên tập viên cao cấp</p>
                            <div class="social_icon">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-github"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                            <p>Chúng tôi luôn cập nhật những xu hướng mới nhất về giày dép và thời trang. Theo dõi blog của chúng tôi để không bỏ lỡ bất kỳ thông tin hữu ích nào.</p>
                            <div class="br"></div>
                        </aside>
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Bài viết nổi bật</h3>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post1.jpg" alt="post">
                                <div class="media-body">
                                    <a href="blog-details.html">
                                        <h3>Xu hướng giày thể thao 2024</h3>
                                    </a>
                                    <p>2 giờ trước</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post2.jpg" alt="post">
                                <div class="media-body">
                                    <a href="blog-details.html">
                                        <h3>Cách chọn giày phù hợp</h3>
                                    </a>
                                    <p>2 giờ trước</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post3.jpg" alt="post">
                                <div class="media-body">
                                    <a href="blog-details.html">
                                        <h3>Bảo quản giày đúng cách</h3>
                                    </a>
                                    <p>3 giờ trước</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post4.jpg" alt="post">
                                <div class="media-body">
                                    <a href="blog-details.html">
                                        <h3>Phối đồ với giày thể thao</h3>
                                    </a>
                                    <p>1 giờ trước</p>
                                </div>
                            </div>
                            <div class="br"></div>
                        </aside>
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Danh mục bài viết</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Công nghệ</p>
                                        <p>37</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Phong cách sống</p>
                                        <p>24</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Thời trang</p>
                                        <p>59</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Nghệ thuật</p>
                                        <p>29</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Thực phẩm</p>
                                        <p>15</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Kiến trúc</p>
                                        <p>09</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Phiêu lưu</p>
                                        <p>44</p>
                                    </a>
                                </li>
                            </ul>
                            <div class="br"></div>
                        </aside>
                        <aside class="single-sidebar-widget newsletter_widget">
                            <h4 class="widget_title">Đăng ký nhận tin</h4>
                            <p>
                                Đăng ký để nhận những thông tin mới nhất về xu hướng giày và thời trang.
                            </p>
                            <div class="form-group d-flex flex-row">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                                    </div>
                                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Nhập email"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nhập email'">
                                </div>
                                <a href="#" class="bbtns">Đăng ký</a>
                            </div>
                            <p class="text-bottom">Bạn có thể hủy đăng ký bất cứ lúc nào</p>
                            <div class="br"></div>
                        </aside>
                        <aside class="single-sidebar-widget tag_cloud_widget">
                            <h4 class="widget_title">Thẻ</h4>
                            <ul class="list">
                                <li><a href="#">Công nghệ</a></li>
                                <li><a href="#">Thời trang</a></li>
                                <li><a href="#">Kiến trúc</a></li>
                                <li><a href="#">Thời trang</a></li>
                                <li><a href="#">Thực phẩm</a></li>
                                <li><a href="#">Công nghệ</a></li>
                                <li><a href="#">Phong cách sống</a></li>
                                <li><a href="#">Nghệ thuật</a></li>
                                <li><a href="#">Phiêu lưu</a></li>
                                <li><a href="#">Thực phẩm</a></li>
                                <li><a href="#">Phong cách sống</a></li>
                                <li><a href="#">Phiêu lưu</a></li>
                            </ul>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
    <%@ include file="/views/home/includes/footer.jsp" %>

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
</body>
</html>