<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
    <link rel="icon" href="<c:url value='/static/admin/assets/img/kaiadmin/favicon.ico'/>" type="image/x-icon"/>

    <!-- Fonts and icons -->
    <script src="<c:url value='/static/admin/assets/js/plugin/webfont/webfont.min.js'/>"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular", 
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["<c:url value='/static/admin/assets/css/fonts.min.css'/>"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="<c:url value='/static/admin/assets/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/static/admin/assets/css/plugins.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/static/admin/assets/css/kaiadmin.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/static/admin/assets/css/demo.css'/>" />
  </head>
 