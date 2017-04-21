/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CustomersDAO;
import entity.Customes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.Customers;

/**
 *
 * @author Do Tien Dung
 */
public class ControllerCustomers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String action = request.getParameter("action");
           
            if (action.equals("Login")) {
                String user = request.getParameter("txtUser");
                String pass = request.getParameter("txtPass");
                Customers cus = new Customers();
                boolean exist = cus.checkLogin(user, pass);
                String url = "login.jsp";
                
                
                if (exist) {
//                    JOptionPane.showMessageDialog(null, "Welcome :  "+user+"");
                    url = "logincus.jsp";
                    HttpSession sesson = request.getSession(true);
                    sesson.setAttribute("USER", user);
                }if (user.equals("admin") && pass.equals("123")) {
                    
                    url = "trangchu.jsp";
                    HttpSession sesson = request.getSession(true);
                    sesson.setAttribute("USER", user);
                }
              //  JOptionPane.showMessageDialog(null, "Welcome :  "+user+"");
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }else if (action.equals("Search")) {
                String tenkh = request.getParameter("txtTenKH");
                List<Customes> list = CustomersDAO.layDanhSachKH(tenkh);
                request.setAttribute("listKH", list);
                String url = "DanhsachCustomer.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Delete")) {
                String makh = request.getParameter("txtMaKH");
                boolean daxoa = CustomersDAO.xoaKhachHang(makh);
                if (daxoa) {
                    String url = "ControllerCustomers?txtTenKH=&action=Search";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
