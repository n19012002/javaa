<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp" %>

<div class="wrapper">
    <%@ include file="../layout/sidebar.jsp" %>
    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">${category == null ? "Thêm danh mục mới" : "Cập nhật danh mục"}</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/admin/product-category/${category == null ? 'add' : 'edit'}" method="post">
                                    <c:if test="${category != null}">
                                        <input type="hidden" name="id" value="${category.id}" />
                                    </c:if>
                                    <div class="form-group">
                                        <label for="name">Tên danh mục</label>
                                        <input type="text" class="form-control" id="name" name="name" value="${category != null ? category.name : ''}" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">${category == null ? "Thêm mới" : "Cập nhật"}</button>
                                    <a href="${pageContext.request.contextPath}/admin/product-category/list" class="btn btn-danger">Hủy</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
<%@ include file="../layout/scripts.jsp" %>