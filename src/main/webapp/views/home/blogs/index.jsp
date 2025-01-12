<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="model.Category" %>
<%@ page import="model.Tag" %>
<%@ page import="dal.CategoryDAO" %>
<%@ page import="dal.TagDAO" %>

<%
    CategoryDAO categoryDAO = new CategoryDAO();
    TagDAO tagDAO = new TagDAO();
    List<Category> categories = categoryDAO.getAllCategories();
    List<Tag> tags = tagDAO.getAllTags();
%>

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
    <title>Tin tức</title>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">

</head>
<body>
    <%@ include file="/views/home/includes/menu.jsp" %>

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Tin tức</h1>
                    <nav class="d-flex align-items-center">
                        <a href="${pageContext.request.contextPath}/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
                        <a href="#">Tin tức</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Blog Categorie Area =================-->
    <section class="blog_categorie_area">
        <div class="container">
            <div class="row">
                <%
                    for (Category category : categories) {
                %>
                <div class="col-lg-4">
                    <div class="categories_post">
                        <img src="${pageContext.request.contextPath}/static/img/blog/cat-post/cat-post-1.jpg" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="category?id=<%= category.getId() %>">
                                    <h5><%= category.getName() %></h5>
                                </a>
                                <div class="border_line"></div>
                                <p>Khám phá <%= category.getName() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </section>
    <!--================End Blog Categorie Area =================-->

    <!--================Blog Area =================-->
    <section class="blog_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog_left_sidebar">
                        <%
                            List<Post> posts = (List<Post>) request.getAttribute("posts");
                            if (posts == null) {
                                posts = (List<Post>) application.getAttribute("allPosts");
                            }
                            for (Post post : posts) {
                        %>
                        <article class="row blog_item">
                            <div class="col-md-3">
                                <div class="blog_info text-right">
                                    <div class="post_tag">
                                        <%
                                            if (post.getTags() != null) {
                                                for (String tag : post.getTags()) {
                                        %>
                                        <a href="tag?id=<%= tag %>"><%= tag %></a>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                    <ul class="blog_meta list">
                                        <li><a href="#"><%= post.getAuthorName() %><i class="lnr lnr-user"></i></a></li>
                                        <li><a href="#"><%= post.getCreatedAt() %><i class="lnr lnr-calendar-full"></i></a></li>
                                        <li><a href="#"><%= post.getViews() %> Lượt xem<i class="lnr lnr-eye"></i></a></li>
                                        <li><a href="#"><%= post.getCommentsCount() %> Bình luận<i class="lnr lnr-bubble"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="blog_post">
                                    <img src="${pageContext.request.contextPath}/<%= post.getImage() %>" alt="">
                                    <div class="blog_details">
                                        <a href="postDetail?id=<%= post.getId() %>">
                                            <h2><%= post.getTitle() %></h2>
                                        </a>
                                        <p><%= post.getContent() %></p>
                                        <a href="postDetail?id=<%= post.getId() %>" class="white_bg_btn">Xem thêm</a>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <%
                            }
                        %>
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <%
                                    int currentPage = (int) request.getAttribute("currentPage");
                                    int totalPages = (int) request.getAttribute("totalPages");
                                    for (int i = 1; i <= totalPages; i++) {
                                %>
                                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                                    <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Tìm kiếm">
                                        <div class="input-group-append">
                                            
                                        </div>
                                    </div>
                                </div>
                                <button class="primary-btn" type="submit">Tìm kiếm</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Danh mục bài viết</h4>
                            <ul class="list cat-list">
                                <%
                                    for (Category category : categories) {
                                %>
                                <li>
                                    <a href="category?id=<%= category.getId() %>" class="d-flex justify-content-between">
                                        <p><%= category.getName() %></p>
                                        <p><%= category.getPostCount() %></p>
                                    </a>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Bài viết nổi bật</h3>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post1.jpg" alt="post">
                                <div class="media-body">
                                    <a href="postDetail?id=1">
                                        <h3>Xu hướng giày thể thao 2024</h3>
                                    </a>
                                    <p>2 giờ trước</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post2.jpg" alt="post">
                                <div class="media-body">
                                    <a href="postDetail?id=2">
                                        <h3>Cách chọn giày phù hợp</h3>
                                    </a>
                                    <p>2 giờ trước</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post3.jpg" alt="post">
                                <div class="media-body">
                                    <a href="postDetail?id=3">
                                        <h3>Bảo quản giày đúng cách</h3>
                                    </a>
                                    <p>3 giờ trước</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="${pageContext.request.contextPath}/static/img/blog/popular-post/post4.jpg" alt="post">
                                <div class="media-body">
                                    <a href="postDetail?id=4">
                                        <h3>Phối đồ với giày thể thao</h3>
                                    </a>
                                    <p>1 giờ trước</p>
                                </div>
                            </div>
                        </aside>

                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Thẻ</h4>
                            <ul class="list">
                                <%
                                    for (Tag tag : tags) {
                                %>
                                <li><a href="tag?id=<%= tag.getId() %>"><%= tag.getName() %></a></li>
                                <%
                                    }
                                %>
                            </ul>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

    <!--================ start footer Area  =================-->
    <footer class="footer-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-6 single-footer-widget">
                    <h4>Sản phẩm hàng đầu</h4>
                    <ul>
                        <li><a href="#">Quản lý website</a></li>
                        <li><a href="#">Quản lý danh tiếng</a></li>
                        <li><a href="#">Công cụ quản lý</a></li>
                        <li><a href="#">Dịch vụ marketing</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 single-footer-widget">
                    <h4>Liên kết nhanh</h4>
                    <ul>
                        <li><a href="#">Việc làm</a></li>
                        <li><a href="#">Thương hiệu</a></li>
                        <li><a href="#">Quan hệ đầu tư</a></li>
                        <li><a href="#">Điều khoản dịch vụ</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 single-footer-widget">
                    <h4>Tính năng</h4>
                    <ul>
                        <li><a href="#">Việc làm</a></li>
                        <li><a href="#">Thương hiệu</a></li>
                        <li><a href="#">Quan hệ đầu tư</a></li>
                        <li><a href="#">Điều khoản dịch vụ</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 single-footer-widget">
                    <h4>Tài nguyên</h4>
                    <ul>
                        <li><a href="#">Hướng dẫn</a></li>
                        <li><a href="#">Nghiên cứu</a></li>
                        <li><a href="#">Chuyên gia</a></li>
                        <li><a href="#">Đại lý</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-6 single-footer-widget">
                    <h4>Bản tin</h4>
                    <p>Bạn có thể tin tưởng chúng tôi. Chúng tôi chỉ gửi các ưu đãi khuyến mãi</p>
                    <div class="form-wrap" id="mc_embed_signup">
                        <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=72f5e7f3c6e6f8a0b6e0e3e6e&amp;id=6156c5a23e"
                              method="get" class="form-inline">
                            <input class="form-control" name="EMAIL" placeholder="Địa chỉ email của bạn" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = 'Địa chỉ email của bạn'" required="" type="email">
                            <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                            <div style="position: absolute; left: -5000px;">
                                <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                            </div>

                            <div class="info"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="footer-bottom row align-items-center justify-content-between">
                <p class="footer-text m-0 col-lg-8 col-md-12">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> Bản quyền thuộc về | Template được thiết kế bởi <i class="fa fa-heart-o"
                                                                                                                                                    aria-hidden="true"></i> <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
                <div class="col-lg-4 col-md-12 footer-social">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-dribbble"></i></a>
                    <a href="#"><i class="fa fa-behance"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <!--================ End footer Area  =================-->

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