<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.ProductCategory" %>
<%@ page import="dal.ProductCategoryDAO" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    ProductCategoryDAO categoryDAO = new ProductCategoryDAO();
    List<ProductCategory> categories = categoryDAO.getAllCategoriesWithProductCount();
    String selectedCategoryId = request.getParameter("categoryId");
    String selectedBrandId = request.getParameter("brandId");
    String minPrice = request.getParameter("minPrice");
    String maxPrice = request.getParameter("maxPrice");
    Integer currentPage = (Integer) request.getAttribute("currentPage");
    Integer totalPages = (Integer) request.getAttribute("totalPages");
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Meta tags and CSS links -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/fav.png">
    <meta name="author" content="CodePixar">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <title>Karma Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/linearicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nouislider.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body id="category">
    <%@ include file="/views/home/includes/menu.jsp" %>

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shop Category page</h1>
                    <nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                        <a href="category.html">Fashon Category</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-5">
                <div class="sidebar-categories">
                    <div class="head">Browse Categories</div>
                    <ul class="main-categories">
                        <li class="main-nav-list"><a href="ProductServlet">All products</a></li>
                        
                        <%
                            for (ProductCategory category : categories) {
                        %>
                        <li class="main-nav-list">
                            
                            <a href="ProductServlet?categoryId=<%= category.getId() %><%= selectedBrandId != null ? "&brandId=" + selectedBrandId : "" %><%= minPrice != null ? "&minPrice=" + minPrice : "" %><%= maxPrice != null ? "&maxPrice=" + maxPrice : "" %>">
                                <%= category.getName() %> (<%= category.getProductCount() %>)
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div class="sidebar-filter mt-50">
                    <div class="top-filter-head">Product Filters</div>
                    <div class="common-filter">
                        <div class="head">Brands</div>
                        <form id="brandForm" action="ProductServlet" method="get">
                            <ul>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brandId" value="1" <%= "1".equals(selectedBrandId) ? "checked" : "" %>><label for="apple">Apple</label></li>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brandId" value="2" <%= "2".equals(selectedBrandId) ? "checked" : "" %>><label for="asus">Asus</label></li>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brandId" value="3" <%= "3".equals(selectedBrandId) ? "checked" : "" %>><label for="gionee">Gionee</label></li>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brandId" value="4" <%= "4".equals(selectedBrandId) ? "checked" : "" %>><label for="micromax">Micromax</label></li>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brandId" value="5" <%= "5".equals(selectedBrandId) ? "checked" : "" %>><label for="samsung">Samsung</label></li>
                            </ul>
                            <% if (selectedCategoryId != null && !selectedCategoryId.isEmpty()) { %>
                                <input type="hidden" name="categoryId" value="<%= selectedCategoryId %>">
                            <% } %>
                            <% if (minPrice != null && !minPrice.isEmpty()) { %>
                                <input type="hidden" name="minPrice" value="<%= minPrice %>">
                            <% } %>
                            <% if (maxPrice != null && !maxPrice.isEmpty()) { %>
                                <input type="hidden" name="maxPrice" value="<%= maxPrice %>">
                            <% } %>
                        </form>
                    </div>
                    <div class="common-filter">
                        <div class="head">Price</div>
                        <div class="price-range-area">
                            <div id="price-range"></div>
                            <div class="value-wrapper d-flex">
                                <div class="price">Price:</div>
                                <span>$</span>
                                <div id="lower-value"><%= minPrice != null ? minPrice : "0" %></div>
                                <div class="to">to</div>
                                <span>$</span>
                                <div id="upper-value"><%= maxPrice != null ? maxPrice : "1000" %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-8 col-md-7">
                <!-- Start Filter Bar -->
                <div class="filter-bar d-flex flex-wrap align-items-center">
                    <div class="sorting">
                        <select>
                            <option value="1">Default sorting</option>
                            <option value="1">Default sorting</option>
                            <option value="1">Default sorting</option>
                        </select>
                    </div>
                    <div class="sorting mr-auto">
                        <select>
                            <option value="1">Show 12</option>
                            <option value="1">Show 12</option>
                            <option value="1">Show 12</option>
                        </select>
                    </div>
                    <div class="pagination">
                        <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                        <%
                            for (int i = 1; i <= totalPages; i++) {
                                String pageLink = "ProductServlet?page=" + i;
                                if (selectedCategoryId != null && !selectedCategoryId.equals("null")) {
                                    pageLink += "&categoryId=" + selectedCategoryId;
                                }
                                if (selectedBrandId != null && !selectedBrandId.equals("null")) {
                                    pageLink += "&brandId=" + selectedBrandId;
                                }
                                if (minPrice != null && !minPrice.equals("null")) {
                                    pageLink += "&minPrice=" + minPrice;
                                }
                                if (maxPrice != null && !maxPrice.equals("null")) {
                                    pageLink += "&maxPrice=" + maxPrice;
                                }
                        %>
                        <a href="<%= pageLink %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
                        <%
                            }
                        %>
                        <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!-- End Filter Bar -->

                <!-- Start Best Seller -->
                <section class="lattest-product-area pb-40 category-list">
                    <div class="row">
                        <%
                            for (Product product : products) {
                        %>
                        <!-- single product -->
                        <div class="col-lg-4 col-md-6">
                            <div class="single-product">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/<%= product.getImage() %>" alt="">
                                <div class="product-details">
                                    <h6><%= product.getName() %></h6>
                                    <div class="price">
                                        <h6>$<%= product.getPrice() %></h6>
                                        <h6 class="l-through">$<%= product.getDiscountPrice() %></h6>
                                    </div>
                                    <div class="prd-bottom">
                                        <a href="" class="social-info">
                                            <span class="ti-bag"></span>
                                            <p class="hover-text">add to bag</p>
                                        </a>
                                        <a href="" class="social-info">
                                            <span class="lnr lnr-heart"></span>
                                            <p class="hover-text">Wishlist</p>
                                        </a>
                                        <a href="" class="social-info">
                                            <span class="lnr lnr-sync"></span>
                                            <p class="hover-text">compare</p>
                                        </a>
                                        <a href="DetailProductServlet?productId=<%= product.getId() %>" class="social-info">
                                            <span class="lnr lnr-move"></span>
                                            <p class="hover-text">view more</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- single product -->
                        <%
                            }
                        %>
                    </div>
                </section>
                <!-- End Best Seller -->

                <!-- Start Filter Bar -->
                <div class="filter-bar d-flex flex-wrap align-items-center">
                    <div class="sorting mr-auto">
                        <select>
                            <option value="1">Show 12</option>
                            <option value="1">Show 12</option>
                            <option value="1">Show 12</option>
                        </select>
                    </div>
                    <div class="pagination">
                        <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                        <%
                            for (int i = 1; i <= totalPages; i++) {
                                String pageLink = "ProductServlet?page=" + i;
                                if (selectedCategoryId != null && !selectedCategoryId.equals("null")) {
                                    pageLink += "&categoryId=" + selectedCategoryId;
                                }
                                if (selectedBrandId != null && !selectedBrandId.equals("null")) {
                                    pageLink += "&brandId=" + selectedBrandId;
                                }
                                if (minPrice != null && !minPrice.equals("null")) {
                                    pageLink += "&minPrice=" + minPrice;
                                }
                                if (maxPrice != null && !maxPrice.equals("null")) {
                                    pageLink += "&maxPrice=" + maxPrice;
                                }
                        %>
                        <a href="<%= pageLink %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
                        <%
                            }
                        %>
                        <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!-- End Filter Bar -->
            </div>
        </div>
    </div>

    <%@ include file="/views/home/includes/related-product.jsp" %>
    <%@ include file="/views/home/includes/footer.jsp" %>

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
        $(document).ready(function() {
            // Lọc theo thương hiệu
            $('input[name="brandId"]').change(function() {
                $('#brandForm').submit();
            });

            // Thanh trượt giá
            var priceRange = document.getElementById('price-range');
            if (priceRange) {
                noUiSlider.create(priceRange, {
                    start: [<%= minPrice != null ? minPrice : "0" %>, <%= maxPrice != null ? maxPrice : "1000" %>],
                    step: 10,
                    connect: true,
                    range: {
                        'min': 0,
                        'max': 1000
                    }
                });

                priceRange.noUiSlider.on('update', function(values, handle) {
                    var value = values[handle];
                    if (handle) {
                        $('#upper-value').text(Math.round(value));
                    } else {
                        $('#lower-value').text(Math.round(value));
                    }
                });

                priceRange.noUiSlider.on('change', function(values, handle) {
                    var minPrice = values[0];
                    var maxPrice = values[1];
                    var url = "ProductServlet?";
                    if (minPrice) {
                        url += "minPrice=" + minPrice + "&";
                    }
                    if (maxPrice) {
                        url += "maxPrice=" + maxPrice + "&";
                    }
                    if ("<%= selectedCategoryId %>" && "<%= selectedCategoryId %>" !== "null") {
                        url += "categoryId=" + "<%= selectedCategoryId %>" + "&";
                    }
                    if ("<%= selectedBrandId %>" && "<%= selectedBrandId %>" !== "null") {
                        url += "brandId=" + "<%= selectedBrandId %>" + "&";
                    }
                    window.location.href = url.slice(0, -1); // Remove the last '&'
                });
            }
        });
    </script>
</body>
</html>