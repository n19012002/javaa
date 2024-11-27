<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp" %>

<div class="wrapper">
    <%@ include file="../layout/sidebar.jsp" %>
    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">
                        ${product == null ? "Thêm sản phẩm mới" : "Cập nhật sản phẩm"}
                    </h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/admin/product/${product == null ? 'add' : 'edit'}" 
                                      method="post" enctype="multipart/form-data">
                                    <c:if test="${product != null}">
                                        <input type="hidden" name="id" value="${product.id}">
                                    </c:if>
                                    
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input type="text" class="form-control" name="name" 
                                               value="${product.name}" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Mô tả</label>
                                        <textarea class="form-control" name="description" 
                                                  rows="3">${product.description}</textarea>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Giá</label>
                                                <input type="number" class="form-control" name="price" 
                                                       value="${product.price}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Giá khuyến mãi</label>
                                                <input type="number" class="form-control" 
                                                       name="discountPrice" 
                                                       value="${product.discountPrice}">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Hình ảnh</label>
                                        <input type="file" class="form-control" name="image" 
                                               accept="image/*" ${product == null ? 'required' : ''}>
                                        <c:if test="${product != null && product.image != null}">
                                            <img src="${pageContext.request.contextPath}/${product.image}" 
                                                 alt="${product.name}" 
                                                 style="width: 100px; margin-top: 10px;">
                                            <input type="hidden" name="currentImage" value="${product.image}">
                                        </c:if>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Danh mục</label>
                                                <select class="form-control" name="categoryId" required>
                                                    <option value="">Chọn danh mục</option>
                                                    <c:forEach var="category" items="${categories}">
                                                        <option value="${category.id}" 
                                                            ${product.categoryId == category.id ? 'selected' : ''}>
                                                            ${category.name} (${category.productCount} sản phẩm)
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Thương hiệu</label>
                                                <select class="form-control" name="brandId" required>
                                                    <option value="">Chọn thương hiệu</option>
                                                    <c:forEach var="brand" items="${brands}">
                                                        <option value="${brand.id}" 
                                                            ${product.brandId == brand.id ? 'selected' : ''}>
                                                            ${brand.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Màu sắc</label>
                                                <select class="form-control" name="colorId" required>
                                                    <option value="">Chọn màu sắc</option>
                                                    <c:forEach var="color" items="${colors}">
                                                        <option value="${color.id}" 
                                                            ${product.colorId == color.id ? 'selected' : ''}>
                                                            ${color.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary">
                                        ${product == null ? "Thêm mới" : "Cập nhật"}
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/product" 
                                       class="btn btn-danger">Hủy</a>
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