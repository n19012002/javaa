<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="layout/header.jsp" %>

<body>
  <div class="wrapper">
    <!-- Sidebar -->
    <%@ include file="layout/sidebar.jsp" %>
    <!-- End Sidebar -->

    <div class="main-panel">
      <!-- Navbar Header -->

      <!-- End Navbar -->

      <div class="container">
        <div class="page-inner">
          <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
            <div>
              <h3 class="fw-bold mb-3">Thống kê</h3>
              <h6 class="op-7 mb-2">Tổng quan về hoạt động kinh doanh</h6>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6 col-md-3">
              <div class="card card-stats card-round">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-icon">
                      <div class="icon-big text-center icon-primary bubble-shadow-small">
                        <i class="fas fa-shopping-cart"></i>
                      </div>
                    </div>
                    <div class="col col-stats ms-3 ms-sm-0">
                      <div class="numbers">
                        <p class="card-category">Tổng đơn hàng</p>
                        <h4 class="card-title">${totalOrders}</h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="card card-stats card-round">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-icon">
                      <div class="icon-big text-center icon-info bubble-shadow-small">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                    <div class="col col-stats ms-3 ms-sm-0">
                      <div class="numbers">
                        <p class="card-category">Khách hàng</p>
                        <h4 class="card-title">${totalCustomers}</h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="card card-stats card-round">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-icon">
                      <div class="icon-big text-center icon-success bubble-shadow-small">
                        <i class="fas fa-money-bill-wave"></i>
                      </div>
                    </div>
                    <div class="col col-stats ms-3 ms-sm-0">
                      <div class="numbers">
                        <p class="card-category">Doanh thu</p>
                        <h4 class="card-title">${totalRevenue}</h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="card card-stats card-round">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-icon">
                      <div class="icon-big text-center icon-secondary bubble-shadow-small">
                        <i class="fas fa-chart-bar"></i>
                      </div>
                    </div>
                    <div class="col col-stats ms-3 ms-sm-0">
                      <div class="numbers">
                        <p class="card-category">Đơn hàng mới</p>
                        <h4 class="card-title">${ordersByStatus['pending'] != null ? ordersByStatus['pending'] : 0}</h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="card card-round">
                <div class="card-header">
                  <div class="card-head-row">
                    <div class="card-title">Thống kê doanh thu</div>
                    <div class="card-tools">
                      <a href="#" class="btn btn-label-success btn-round btn-sm me-2">
                        <span class="btn-label">
                          <i class="fa fa-file-excel"></i>
                        </span>
                        Xuất Excel
                      </a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="chart-container" style="min-height: 375px">
                    <canvas id="revenueChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card card-round">
                <div class="card-header">
                  <div class="card-head-row">
                    <div class="card-title">Top sản phẩm bán chạy</div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="card-list">
                    <c:forEach items="${topProducts}" var="product">
                      <div class="item-list">
                        <div class="info-user ms-3">
                          <div class="username">${product.name}</div>
                          <div class="status">Đã bán: ${product.totalQuantity}</div>
                        </div>
                        <div class="ms-auto">
                          <span class="badge bg-success">${product.totalSold} đơn</span>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%@ include file="layout/footer.jsp" %>
    </div>
  </div>

  <%@ include file="layout/scripts.jsp" %>
  
  <script>
    // Khởi tạo biểu đồ doanh thu
    var revenueData = {
      labels: [
        <c:forEach items="${revenueByDay}" var="entry" varStatus="status">
          '${entry.key}'${!status.last ? ',' : ''}
        </c:forEach>
      ],
      datasets: [{
        label: 'Doanh thu',
        data: [
          <c:forEach items="${revenueByDay}" var="entry" varStatus="status">
            ${entry.value}${!status.last ? ',' : ''}
          </c:forEach>
        ],
        borderColor: '#1572E8',
        pointBackgroundColor: '#1572E8',
        pointRadius: 4,
        borderWidth: 3,
        fill: true
      }]
    };

    var revenueCtx = document.getElementById('revenueChart').getContext('2d');
    new Chart(revenueCtx, {
      type: 'line',
      data: revenueData,
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              callback: function(value) {
                return new Intl.NumberFormat('vi-VN', {
                  style: 'currency',
                  currency: 'VND'
                }).format(value);
              }
            }
          }
        },
        plugins: {
          tooltip: {
            callbacks: {
              label: function(context) {
                return new Intl.NumberFormat('vi-VN', {
                  style: 'currency',
                  currency: 'VND'
                }).format(context.parsed.y);
              }
            }
          }
        }
      }
    });
  </script>
</body>
</html>
