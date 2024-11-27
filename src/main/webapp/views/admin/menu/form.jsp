<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header -->
<%@ include file="../layout/header.jsp" %>

<div class="wrapper">
    <!-- Include sidebar -->
    <%@ include file="../layout/sidebar.jsp" %>

    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">${menu == null ? "Thêm mới" : "Cập nhật"} Menu</h4>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow">
                            <div class="card-header bg-primary text-white">
                                <h4 class="card-title mb-0">${menu == null ? "Thêm mới" : "Cập nhật"} Menu</h4>
                            </div>
                            <div class="card-body">
                                <form action="${menu == null ? 'add' : 'edit'}" method="post" class="needs-validation" novalidate>
                                    <c:if test="${menu != null}">
                                        <input type="hidden" name="id" value="${menu.id}" />
                                    </c:if>
                                    
                                    <div class="form-group">
                                        <label>Tên menu</label>
                                        <input type="text" class="form-control" name="name" 
                                               value="${menu.name}" required>
                                        <div class="invalid-feedback">
                                            Vui lòng nhập tên menu
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>URL</label>
                                        <input type="text" class="form-control" name="url" 
                                               value="${menu.url}">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Menu cha</label>
                                        <select class="form-select" name="parentId">
                                            <option value="0" ${menu.parentId == 0 ? 'selected' : ''}>-- Menu gốc --</option>
                                            <c:forEach var="parent" items="${parentMenus}">
                                                <option value="${parent.id}" 
                                                        ${menu.parentId == parent.id ? 'selected' : ''}>
                                                    ${parent.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Thứ tự</label>
                                        <input type="number" class="form-control" name="sortOrder" 
                                               value="${menu.sortOrder}" required>
                                        <div class="invalid-feedback">
                                            Vui lòng nhập thứ tự
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" class="custom-control-input" 
                                                   id="isActive" name="isActive" 
                                                   ${menu.active ? 'checked' : ''}>
                                            <label class="custom-control-label" for="isActive">Kích hoạt</label>
                                        </div>
                                    </div>
                                    
                                    <div class="card-action">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fa fa-save"></i> ${menu == null ? "Thêm mới" : "Cập nhật"}
                                        </button>
                                        <a href="list" class="btn btn-danger">
                                            <i class="fa fa-times"></i> Hủy
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
 
    </div>
           <!-- Include footer -->
           <%@ include file="../layout/footer.jsp" %>
</div>

<!-- Include scripts -->
<%@ include file="../layout/scripts.jsp" %>

</body>
</html>