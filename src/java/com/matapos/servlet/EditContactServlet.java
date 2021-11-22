/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
import com.bo.parameter.FieldParameterMatapos;
//import static com.bo.parameter.FieldParameterMatapos.productname;
import com.bo.parameter.ProcessingCode;
import com.matapos.parameter.StaticParameter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet to handle File upload request from Client
 *
 * @author suhanda
 */
public class EditContactServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditContactServlet.class);

    public EditContactServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String email = request.getParameter("email").toString();
//        HashMap req = new HashMap();
//        MessageProcess mp = new MessageProcessImpl();
//        SendHttpProcess http = new SendHttpProcess();
//        HttpSession session = request.getSession(true);
//
//        req.put(FieldParameterMatapos.proccode, ProcessingCode.edit_email);
//        req.put(FieldParameterMatapos.brand_id, session.getAttribute("brand_id"));
//        req.put(FieldParameterMatapos.user_id, session.getAttribute("user_id"));
//        req.put(FieldParameterMatapos.email, email);
//        String reqMsg = mp.encryptMessage(req);
//        String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//        HashMap resp = mp.decryptMessage(responseWeb);
//        if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//            session.removeAttribute("user_id");
//            session.setAttribute("user_id", email);
////            System.out.println("qqqqq");
//            RequestDispatcher rd = request.getRequestDispatcher("/acc");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-success status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Success Change email to " + email + " \n"
//                    + "</div>");
//            rd.include(request, response);
//        } else {
////            System.out.println("pppp");
//        }
    }
}
