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
public class EditCategoryServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditCategoryServlet.class);

    public EditCategoryServlet() {
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
            String brand_id = newJson.get("brand_id").toString();
            String user_id = newJson.get("user").toString();
            String outlet_id = newJson.get("outlet_id_edit_cate").toString();
            String category_id_edit = newJson.get("category_id_edit").toString();
            String category_nameold_edit = newJson.get("category_nameold_edit").toString();
            String category_name_edit = newJson.get("category_name_edit").toString();
            String img_cate_edit = newJson.get("img_cate_edit").toString();

            req.put("procCode", "17");
            req.put(FieldParameterMatapos.category, category_nameold_edit.toUpperCase());
            req.put("new_category", category_name_edit.toUpperCase());
            req.put("fullid", brand_id + outlet_id);
            req.put("image", img_cate_edit);
            req.put("userlogin", user_id);

            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.getWriter().print(resp);
            response.setContentType("application/json");
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            ht = null;
            br = null;
        }
    }
}
