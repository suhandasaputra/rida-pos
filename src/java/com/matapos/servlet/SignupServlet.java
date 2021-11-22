/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.matapos.parameter.StaticParameter;
import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
//import com.bo.parameter.FieldParameter;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
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

/**
 *
 * @author suhanda
 */
public class SignupServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(SignupServlet.class);

    public SignupServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HashMap req = new HashMap();
//        MessageProcess mp = new MessageProcessImpl();
//        SendHttpProcess http = new SendHttpProcess();
//        String brand_category = request.getParameter("brand_category");
//        String username = request.getParameter("username");
//        String brandname = request.getParameter("brandname");
//        String phonenumber = request.getParameter("phonenumber");
//        String user_id = request.getParameter("email");
//        String pass = request.getParameter("pass");
//        String cpass = request.getParameter("cpass");
//        req.put(FieldParameterMatapos.proccode, ProcessingCode.signupowner);
//        req.put(FieldParameterMatapos.brand_category, brand_category);
//        req.put(FieldParameterMatapos.user_name, username);
//        req.put(FieldParameterMatapos.brand_name, brandname);
//        req.put(FieldParameterMatapos.user_id, user_id);
//        req.put(FieldParameterMatapos.phonenumber, phonenumber);
//        req.put(FieldParameterMatapos.password, pass);
//
//        String reqMsg = mp.encryptMessage(req);
//        String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//        HashMap resp = mp.decryptMessage(responseWeb);
//        if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//            RequestDispatcher rd = request.getRequestDispatcher("ho");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-success status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Success Create User ID " + user_id + " \n"
//                    + "</div>");
//            rd.include(request, response);
//        } else if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0001")) {
//            RequestDispatcher rd = request.getRequestDispatcher("ho");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-danger status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Failed Create User ID " + user_id + " \n"
//                    + "</div>");
//            rd.include(request, response);
//        } else if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0002")) {
//            RequestDispatcher rd = request.getRequestDispatcher("ho");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-danger status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Duplicate User ID " + user_id + " \n"
//                    + "</div>");
//            rd.include(request, response);
//        }

        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        SendHttpProcess http = new SendHttpProcess();

        try {
            String json = "";
            json = br.readLine();
            HashMap newJson = JsonProcess.decodeJson(json);

            String brand_category = newJson.get("brand_category").toString();
            String username = newJson.get("username").toString();
            String brandname = newJson.get("brandname").toString();
            String phonenumber = newJson.get("phonenumber").toString();
            String user_id = newJson.get("email").toString();
            String pass = newJson.get("pass").toString();

            req.put(FieldParameterMatapos.proccode, ProcessingCode.signupowner);
            req.put(FieldParameterMatapos.brand_category, brand_category);
            req.put(FieldParameterMatapos.user_name, username);
            req.put(FieldParameterMatapos.brand_name, brandname);
            req.put(FieldParameterMatapos.user_id, user_id);
            req.put(FieldParameterMatapos.phonenumber, phonenumber);
            req.put(FieldParameterMatapos.password, pass);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp);
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            http = null;
            br = null;
        }
    }
}
