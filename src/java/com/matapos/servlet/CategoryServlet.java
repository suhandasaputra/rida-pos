/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.matapos.parameter.StaticParameter;
import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
//import com.bo.parameter.FieldParameter;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suhanda
 */
public class CategoryServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CategoryServlet.class);

    public CategoryServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        HttpSession session = request.getSession(true);
//
//        HashMap req = new HashMap();
//        MessageProcess mp = new MessageProcessImpl();
//        SendHttpProcess http = new SendHttpProcess();
//        String brand_id = session.getAttribute("brand_id").toString();
//        String category_name = request.getParameter("category_name").toUpperCase();
//
//        req.put(FieldParameterMatapos.proccode, ProcessingCode.addcategory);
//        req.put(FieldParameterMatapos.category_name, category_name);
//        req.put(FieldParameterMatapos.img_url, category_name);
//        req.put(FieldParameterMatapos.brand_id, brand_id);
//        String reqMsg = mp.encryptMessage(req);
//        String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//        HashMap resp = mp.decryptMessage(responseWeb);
//        if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//            RequestDispatcher rd = request.getRequestDispatcher("pdl");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-success status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Success add category "+ category_name+" \n"
//                    + "</div>");
//            rd.include(request, response);
//        } else {
//            System.out.println("no");
////            RequestDispatcher rd = request.getRequestDispatcher("/ho");
////            PrintWriter out = response.getWriter();
////            out.println("<div class=\"alert alert-danger status-custom\">\n"
////                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
////                    + "     <i class=\"icon fa fa-check\"></i>Incorrect Username / Password \n"
////                    + "</div>");
////            rd.include(request, response);
////            log.info("\n" + "Incorrect Username / Password" + "\n");
//        }
//        session.removeAttribute("file_name");
    }
}
