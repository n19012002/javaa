<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp" %>

<div class="wrapper">
    <%@ include file="../layout/sidebar.jsp" %>
    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    
                    <a href="${pageContext.request.contextPath}/admin/product-category/add" class="btn btn-primary btn-round ml-auto">
                        Thêm mới
                    </a>
                </div>
                <h4 class="page-title">Danh sách danh mục sản phẩm</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên danh mục</th>
                                                <th>Số lượng sản phẩm</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="category" items="${categories}">
                                                <tr>
                                                    <td>${category.id}</td>
                                                    <td>${category.name}</td>
                                                    <td>${category.productCount}</td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/admin/product-category/edit?id=${category.id}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                                        <a href="${pageContext.request.contextPath}/admin/product-category/delete?id=${category.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');"><i class="fa fa-trash"></i></a>
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
            </div>
            <%@ include file="../layout/footer.jsp" %>
        </div>
    </div>
</div>


<%@ include file="../layout/scripts.jsp" %>