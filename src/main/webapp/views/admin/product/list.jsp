<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp" %>

<div class="wrapper">
    <%@ include file="../layout/sidebar.jsp" %>
    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">Quản lý sản phẩm</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    
                                    <a href="${pageContext.request.contextPath}/admin/product/add" 
                                       class="btn btn-primary btn-round ml-auto">
                                        <i class="fa fa-plus"></i> Thêm mới
                                    </a>
                                </div>
                                <h4 class="card-title">Danh sách sản phẩm</h4>
                            </div>
                            <div class="card-body">
                                <!-- Tìm kiếm -->
                                <form action="${pageContext.request.contextPath}/admin/product/search" 
                                      method="get" class="mb-3">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="keyword" 
                                               placeholder="Tìm kiếm sản phẩm..." 
                                               value="${keyword}">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                                <!-- Bảng sản phẩm -->
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Hình ảnh</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Giá</th>
                                                <th>Giá KM</th>
                                                <th>Danh mục</th>
                                                <th>Thương hiệu</th>
                                                <th>Màu sắc</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td>
                                                        <img src="${pageContext.request.contextPath}/${product.image}" 
                                                             alt="${product.name}" 
                                                             style="width: 50px;">
                                                    </td>
                                                    <td>${product.name}</td>
                                                    <td>${product.price}</td>
                                                    <td>${product.discountPrice}</td>
                                                    <td>${product.categoryName}</td>
                                                    <td>${product.brandName}</td>
                                                    <td>${product.colorName}</td>
                                                    <td>
                                                        <div class="form-button-action">
                                                            <a href="edit?id=${product.id}" 
                                                            class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                                            </a>
                                                            <a href="delete?id=${product.id}" 
                                                            class="btn btn-danger btn-sm"
                                                               onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">
                                                               <i class="fa fa-trash"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="../layout/footer.jsp" %>
            </div>
        </div>
    </div>
</div>


<%@ include file="../layout/scripts.jsp" %>