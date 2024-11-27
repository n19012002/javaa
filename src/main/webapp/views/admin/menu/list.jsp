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
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow">
                            <div class="page-header">
                                
                                <a href="add" class="btn btn-primary btn-round ml-auto">
                                    Thêm mới
                                </a>
                            </div>
                            <h4 class="card-title mb-0">Danh sách Menu</h4>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên menu</th>
                                                <th>URL</th>
                                                <th>Menu cha</th>
                                                <th>Thứ tự</th>
                                                <th>Trạng thái</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="menu" items="${listMenu}">
                                                <tr>
                                                    <td>${menu.id}</td>
                                                    <td>${menu.name}</td>
                                                    <td>${menu.url}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${menu.parentId == 0}">
                                                                Menu gốc
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach var="parent" items="${listMenu}">
                                                                    <c:if test="${parent.id == menu.parentId}">
                                                                        ${parent.name}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${menu.sortOrder}</td>
                                                    <td>
                                                        <span class="badge ${menu.active ? 'bg-success' : 'bg-danger'}">
                                                            ${menu.active ? 'Hoạt động' : 'Vô hiệu'}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a href="edit?id=${menu.id}" class="btn btn-primary btn-sm">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                        <a href="delete?id=${menu.id}" class="btn btn-danger btn-sm" 
                                                           onclick="return confirm('Bạn có chắc muốn xóa menu này?')">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
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
        </div>
        
        <!-- Include footer -->
        <%@ include file="../layout/footer.jsp" %>
    </div>
</div>

<!-- Include scripts -->
<%@ include file="../layout/scripts.jsp" %>

</body>
</html>