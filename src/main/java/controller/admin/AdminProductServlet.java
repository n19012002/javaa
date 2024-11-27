package controller.admin;

import dal.admin.AdminProductDAO;
import dal.admin.AdminCategoryDAO;
import dal.admin.AdminBrandDAO;
import dal.admin.AdminColorDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.http.Part;

@WebServlet({"/admin/product/*", "/admin/product"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 30 // 30 MB
)
public class AdminProductServlet extends HttpServlet {
    private AdminProductDAO productDAO;
    private AdminCategoryDAO categoryDAO;
    private AdminBrandDAO brandDAO;
    private AdminColorDAO colorDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new AdminProductDAO();
        categoryDAO = new AdminCategoryDAO();
        brandDAO = new AdminBrandDAO();
        colorDAO = new AdminColorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        try {
            if (pathInfo == null || pathInfo.equals("/") || pathInfo.equals("/list")) {
                listProducts(request, response);
            } else if (pathInfo.equals("/add")) {
                showAddForm(request, response);
            } else if (pathInfo.equals("/edit")) {
                showEditForm(request, response);
            } else if (pathInfo.equals("/delete")) {
                deleteProduct(request, response);
            } else if (pathInfo.equals("/search")) {
                searchProducts(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pathInfo = request.getPathInfo();
        try {
            if (pathInfo.equals("/add")) {
                addProduct(request, response);
            } else if (pathInfo.equals("/edit")) {
                updateProduct(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        List<Product> products = productDAO.getAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/views/admin/product/list.jsp")
               .forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException, SQLException {
        request.setAttribute("categories", categoryDAO.getAll());
        request.setAttribute("brands", brandDAO.getAll());
        request.setAttribute("colors", colorDAO.getAll());
        request.getRequestDispatcher("/views/admin/product/form.jsp")
               .forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.getById(id);
        request.setAttribute("product", product);
        request.setAttribute("categories", categoryDAO.getAll());
        request.setAttribute("brands", brandDAO.getAll());
        request.setAttribute("colors", colorDAO.getAll());
        request.getRequestDispatcher("/views/admin/product/form.jsp")
               .forward(request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        Product product = new Product();
        populateProduct(product, request);
        productDAO.insert(product);
        response.sendRedirect(request.getContextPath() + "/admin/product");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = new Product();
        product.setId(id);
        
        // Giữ lại ảnh cũ nếu không upload ảnh mới
        Part filePart = request.getPart("image");
        if (filePart == null || filePart.getSize() == 0) {
            String currentImage = request.getParameter("currentImage");
            if (currentImage != null && !currentImage.isEmpty()) {
                product.setImage(currentImage);
            }
        }
        
        populateProduct(product, request);
        productDAO.update(product);
        response.sendRedirect(request.getContextPath() + "/admin/product");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDAO.delete(id);
        response.sendRedirect(request.getContextPath() + "/admin/product");
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> products = productDAO.search(keyword);
        request.setAttribute("products", products);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/views/admin/product/list.jsp")
               .forward(request, response);
    }

    private void populateProduct(Product product, HttpServletRequest request) 
            throws ServletException, IOException {
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setDiscountPrice(Double.parseDouble(request.getParameter("discountPrice")));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setBrandId(Integer.parseInt(request.getParameter("brandId")));
        product.setColorId(Integer.parseInt(request.getParameter("colorId")));

        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + 
                            filePart.getSubmittedFileName();
            String uploadPath = request.getServletContext()
                                     .getRealPath("/static/img/product");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            filePart.write(uploadPath + File.separator + fileName);
            product.setImage("static/img/product/" + fileName);
        }
    }
}