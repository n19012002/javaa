<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="sidebar">
    <div class="sidebar-header">
        <div class="app-brand">
            <a href="${pageContext.request.contextPath}/admin" class="brand-link">
                <span class="brand-text">Admin Panel</span>
            </a>
        </div>
    </div>

    <div class="sidebar-body">
        <ul class="nav">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">
                    <i class="fas fa-home"></i>
                    <span>Trang chủ</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/product/list" class="nav-link">
                    <i class="fas fa-box"></i>
                    <span>Quản lý sản phẩm</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/product-category/list" class="nav-link">
                    <i class="fas fa-tags"></i>
                    <span>Danh mục sản phẩm</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/order/list" class="nav-link">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Quản lý đơn hàng</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/posts/" class="nav-link">
                    <i class="fas fa-newspaper"></i>
                    <span>Quản lý bài viết</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/post-category/list" class="nav-link">
                    <i class="fas fa-list"></i>
                    <span>Danh mục bài viết</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/menu/list" class="nav-link">
                    <i class="fas fa-bars"></i>
                    <span>Quản lý menu</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/user/list" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Quản lý người dùng</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/setting" class="nav-link">
                    <i class="fas fa-cog"></i>
                    <span>Cài đặt</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<style>
.sidebar {
    width: 260px;
    background: #fff;
    box-shadow: 0 0 15px rgba(0,0,0,.05);
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

.sidebar-header {
    padding: 1rem;
    border-bottom: 1px solid #eee;
}

.app-brand {
    display: flex;
    align-items: center;
}

.brand-link {
    color: #333;
    font-size: 1.25rem;
    font-weight: 600;
    text-decoration: none;
}

.brand-text {
    margin-left: 0.5rem;
}

.sidebar-body {
    padding: 1rem 0;
}

.nav {
    list-style: none;
    padding: 0;
    margin: 0;
}

.nav-item {
    margin-bottom: 0.25rem;
}

.nav-link {
    display: flex;
    align-items: center;
    padding: 0.75rem 1.5rem;
    color: #6c757d;
    text-decoration: none;
    transition: all 0.3s;
}

.nav-link:hover,
.nav-link.active {
    color: #007bff;
    background: #f8f9fa;
}

.nav-link i {
    width: 20px;
    margin-right: 0.75rem;
    font-size: 1rem;
}

.nav-link span {
    font-size: 0.875rem;
}

/* Responsive */
@media (max-width: 991.98px) {
    .sidebar {
        transform: translateX(-100%);
        transition: transform 0.3s;
    }
    
    .sidebar.show {
        transform: translateX(0);
    }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Highlight active menu item
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        if (currentPath.includes(link.getAttribute('href'))) {
            link.classList.add('active');
        }
    });
});
</script>