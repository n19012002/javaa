package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dal.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
//LoginServlet.java
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        super.init();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/views/home/home.jsp");
            return;
        }
        
        req.getRequestDispatcher("/views/login/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        try {
            UserDao userDao = new UserDao();
            User user = userDao.checkLogin(username, password);
            
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                
                if (user.hasRole("ADMIN")) {
                    resp.sendRedirect(req.getContextPath() + "/views/admin/home.jsp");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/views/home/home.jsp");
                }
            } else {
                req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
                req.getRequestDispatcher("/views/login/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            req.getRequestDispatcher("/views/login/login.jsp").forward(req, resp);
        }
    }
}