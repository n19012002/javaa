<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Menu" %>
<%@ page import="util.MenuUtil" %>
<%@ page import="util.MenuRenderer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Menu> menus = (List<Menu>) request.getAttribute("menus");
    if (menus == null) {
        System.out.println("No menus found in request");
    }
    List<Menu> rootMenus = (menus != null) ? MenuUtil.buildMenuHierarchy(menus) : new ArrayList<>();
%>

<!-- Start Header Area -->
<header class="header_area sticky-header">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light main_box">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand logo_h" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/static/img/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <%= MenuRenderer.renderMenu(rootMenus) %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/cart" class="cart">
                                <span class="ti-bag"></span>
                                <c:if test="${not empty sessionScope.cart and not empty sessionScope.cart.items}">
                                    <span class="cart-count">${sessionScope.cart.items.size()}</span>
                                </c:if>
                            </a>
                        </li>
                        
                        <!-- Kiểm tra đăng nhập -->
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <!-- Menu cho người dùng đã đăng nhập -->
                                <c:if test="${not empty user}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            <i class="fa fa-user"></i> ${user.fullname}
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item">

                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="${pageContext.request.contextPath}/profile">
                                                    <i class="fa fa-user-circle"></i> Thông tin cá nhân
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="${pageContext.request.contextPath}/order/history">
                                                    <i class="fa fa-history"></i> Lịch sử đơn hàng
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="${pageContext.request.contextPath}/profile/change-password">
                                                    <i class="fa fa-key"></i> Đổi mật khẩu
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                                                    <i class="fa fa-sign-out"></i> Đăng xuất
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <!-- Menu cho người dùng chưa đăng nhập -->
                                <li class="nav-item auth-item">
                                    <a href="${pageContext.request.contextPath}/login" class="nav-link auth-link login-link">
                                        <i class="fa fa-sign-in-alt"></i> Đăng nhập
                                    </a>
                                </li>
                                <li class="nav-item auth-item">
                                    <a href="${pageContext.request.contextPath}/register" class="nav-link auth-link register-link">
                                        <i class="fa fa-user-plus"></i> Đăng ký
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        
                        <li class="nav-item">
                            <button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="search_input" id="search_input_box">
        <div class="container">
            <form class="d-flex justify-content-between">
                <input type="text" class="form-control" id="search_input" placeholder="Tìm kiếm...">
                <button type="submit" class="btn"></button>
                <span class="lnr lnr-cross" id="close_search" title="Đóng"></span>
            </form>
        </div>
    </div>
</header>
<!-- End Header Area -->

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
/* Navbar container styles */
.main_box {
    padding: 10px 0;
    background: white;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.navbar-brand {
    padding: 0;
    margin-right: 30px;
}

.navbar-brand img {
    max-height: 40px;
}

/* Menu nav styles */
.menu_nav {
    display: flex;
    align-items: center;
    margin: 0;
    padding: 0;
}

.menu_nav > li {
    position: relative;
    margin: 0 5px;
}

.menu_nav > li > a {
    padding: 8px 15px;
    color: #333;
    font-weight: 500;
    font-size: 14px;
    border-radius: 20px;
    transition: all 0.3s ease;
}

/* Right navbar styles - Updated */
.navbar-right {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 20px;
    height: 100%;
}

.navbar-right .nav-item {
    display: flex;
    align-items: center;
    height: 100%;
    margin: 0 5px;
}

/* Cart icon styles - Updated */
.cart {
    position: relative;
    padding: 8px 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #333;
    transition: all 0.3s ease;
    height: 36px;
}

.cart .ti-bag {
    font-size: 18px;
}

/* Auth buttons container */
.auth-buttons {
    display: flex;
    align-items: center;
    margin: 0 10px;
}

/* Auth button styles - Updated */
.auth-item {
    display: flex;
    align-items: center;
    height: 36px;
}

.auth-link {
    padding: 0 20px !important;
    border-radius: 20px !important;
    font-size: 13px !important;
    font-weight: 500 !important;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    display: flex !important;
    align-items: center;
    justify-content: center;
    min-width: 120px;
    height: 36px;
    transition: all 0.3s ease !important;
}

.login-link {
    background: linear-gradient(45deg, #ff6b6b, #ff8787) !important;
    color: white !important;
    border: 2px solid #ff6b6b !important;
}

.login-link:hover {
    background: white !important;
    color: #ff6b6b !important;
}

.register-link {
    background: linear-gradient(45deg, #4ecdc4, #45b7af) !important;
    color: white !important;
    border: 2px solid #4ecdc4 !important;
}

.register-link:hover {
    background: white !important;
    color: #4ecdc4 !important;
}

/* Search button styles - Updated */
.search {
    background: none;
    border: none;
    padding: 0 15px;
    height: 36px;
    font-size: 18px;
    color: #333;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
}

.search:hover {
    color: #ff6b6b;
}

/* Responsive styles */
@media (max-width: 991px) {
    .navbar-right {
        margin-left: 0;
        flex-direction: column;
        width: 100%;
    }
    
    .auth-item {
        width: 100%;
        margin: 5px 0;
    }
    
    .auth-link {
        width: 100%;
        justify-content: center;
    }
    
    .menu_nav {
        padding: 10px 0;
    }
    
    .menu_nav > li {
        width: 100%;
        margin: 0;
    }
    
    .menu_nav > li > a {
        width: 100%;
        border-radius: 0;
        padding: 12px 15px;
    }
}

/* Cart styles - Updated */
.cart {
    position: relative;
    padding: 8px 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #333;
    transition: all 0.3s ease;
    height: 36px;
}

.cart .ti-bag {
    font-size: 18px;
}

.cart-count {
    position: absolute;
    top: 0;
    right: 5px;
    background: #ff6b6b;
    color: white;
    border-radius: 50%;
    width: 18px;
    height: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 11px;
    font-weight: bold;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
}

/* User dropdown styles - Updated */
.user-dropdown {
    position: relative;
}

.user-dropdown .user-link {
    color: #333;
    padding: 8px 15px;
    border-radius: 20px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    white-space: nowrap;
    min-width: 160px;
}

.user-dropdown .user-link i {
    margin-right: 8px;
    font-size: 16px;
}

.user-menu {
    position: absolute;
    right: 0;
    background: white;
    border: none;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    padding: 8px 0;
    min-width: 200px;
    margin-top: 10px;
    z-index: 1000;
}

.user-menu .nav-item {
    margin: 0;
    width: 100%;
}

.user-menu .nav-link {
    color: #333;
    padding: 10px 15px;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
    white-space: nowrap;
    font-size: 13px;
    width: 100%;
}

.user-menu .nav-link i {
    width: 20px;
    margin-right: 8px;
    font-size: 14px;
    text-align: center;
    color: #666;
}

.user-menu .nav-link:hover {
    background-color: #f8f9fa;
    color: #ff6b6b;
    padding-left: 20px;
}

.user-menu .nav-link:hover i {
    color: #ff6b6b;
}

/* Logout link style - Updated */
.logout-link {
    color: #dc3545 !important;
    border-top: 1px solid #eee;
    margin-top: 5px;
    padding-top: 12px !important;
}

.logout-link:hover {
    background-color: #fff1f1 !important;
}

.logout-link i {
    color: #dc3545 !important;
}

/* Responsive adjustments for user menu */
@media (max-width: 991px) {
    .user-dropdown {
        width: 100%;
    }
    
    .user-dropdown .user-link {
        width: 100%;
        padding: 10px 15px;
        border-radius: 0;
        justify-content: flex-start;
    }
    
    .user-menu {
        position: static;
        box-shadow: none;
        border: 1px solid #eee;
        margin-top: 0;
        width: 100%;
    }
    
    .user-menu .nav-link {
        padding: 12px 15px;
    }
}

/* Submenu Styles */
.menu_nav .submenu {
    position: relative;
}

.menu_nav .submenu > ul {
    position: absolute;
    top: 100%;
    left: 0;
    background: white;
    min-width: 200px;
    padding: 8px 0;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    opacity: 0;
    visibility: hidden;
    transform: translateY(10px);
    transition: all 0.3s ease;
    z-index: 1000;
}

.menu_nav .submenu:hover > ul {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.menu_nav .submenu > ul > li {
    padding: 0;
}

.menu_nav .submenu > ul > li > a {
    display: block;
    padding: 10px 20px;
    color: #333;
    transition: all 0.2s ease;
    white-space: nowrap;
}

.menu_nav .submenu > ul > li > a:hover {
    background-color: #f8f9fa;
    color: #ff6b6b;
    transform: translateX(5px);
}

/* Active Menu Item */
.menu_nav > li.active > a {
    color: #ff6b6b;
    background-color: #fff1f1;
}

/* Responsive Menu */
@media (max-width: 991px) {
    .menu_nav {
        padding: 10px 0;
    }

    .menu_nav > li {
        margin: 0;
    }

    .menu_nav > li > a {
        border-radius: 0;
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
    }

    .menu_nav .submenu > ul {
        position: static;
        box-shadow: none;
        padding-left: 20px;
        opacity: 1;
        visibility: visible;
        transform: none;
        background: transparent;
    }

    .menu_nav .submenu > ul > li > a {
        padding: 8px 15px;
    }

    .menu_nav .submenu > ul > li > a:hover {
        transform: none;
    }
}

/* Navbar Toggle Button */
.navbar-toggler {
    border: none;
    padding: 0;
}

.navbar-toggler:focus {
    outline: none;
    box-shadow: none;
}

.icon-bar {
    display: block;
    width: 22px;
    height: 2px;
    background-color: #333;
    transition: all 0.3s ease;
    margin: 4px 0;
}

.navbar-toggler:not(.collapsed) .icon-bar:nth-child(1) {
    transform: rotate(45deg) translate(5px, 5px);
}

.navbar-toggler:not(.collapsed) .icon-bar:nth-child(2) {
    opacity: 0;
}

.navbar-toggler:not(.collapsed) .icon-bar:nth-child(3) {
    transform: rotate(-45deg) translate(5px, -5px);
}

/* Search Input Box */
.search_input {
    background: rgba(255, 255, 255, 0.95);
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

#search_input {
    border: none;
    background: transparent;
    padding: 15px;
    font-size: 16px;
}

#search_input:focus {
    outline: none;
}

#close_search {
    cursor: pointer;
    padding: 15px;
    color: #333;
    transition: all 0.3s ease;
}

#close_search:hover {
    color: #ff6b6b;
}
</style>
 