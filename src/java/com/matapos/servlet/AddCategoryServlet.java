/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.bo.parameter.FieldParameterMatapos;
import com.freemium.function.MessageProcess;
import com.freemium.function.impl.HTTPProcessImpl;
import com.freemium.function.impl.MessageProcessImpl;
import com.matapos.parameter.StaticParameter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet to handle File upload request from Client
 *
 * @author suhanda
 */
public class AddCategoryServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(AddCategoryServlet.class);

    public AddCategoryServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();
        try {
            String json = "";
            json = br.readLine();
            HashMap newJson = JsonProcess.decodeJson(json);
            String category_name = newJson.get("category_name").toString();
            String img_cate = newJson.get("img_cate").toString();
            String brand_id = newJson.get("brand_id").toString();
            String outlet_id = newJson.get("outlet_id_add_cate").toString();
            String user = newJson.get("user").toString();

            req.put("procCode", "16");
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.category, category_name);
            req.put("fullid", brand_id + outlet_id.substring(16));
            req.put("outlet_id", outlet_id.substring(16));
            req.put("image", img_cate);
            req.put("userlogin", user);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp);
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            br = null;
            req = null;
            mp = null;
            ht = null;
        }
    }
}
