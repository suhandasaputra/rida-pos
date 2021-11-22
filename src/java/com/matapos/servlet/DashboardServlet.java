/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import javax.servlet.http.HttpServlet;

/**
 *
 * @author suhanda
 */
public class DashboardServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DashboardServlet.class);

    public DashboardServlet() {
    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession(true);
//        session.removeAttribute("total_sales");
//        session.removeAttribute("total_earnings");
//        session.removeAttribute("total_customers");
//        session.removeAttribute("total_item_sold");
//
//        HashMap req = new HashMap();
//        MessageProcess mp = new MessageProcessImpl();
//        SendHttpProcess http = new SendHttpProcess();
//
//        req.put(FieldParameterMatapos.proccode, ProcessingCode.getdashboard);
//        req.put(FieldParameterMatapos.brand_id, session.getAttribute("brand_id").toString());
////        req.put(FieldParameterMatapos.outlet_id, session.getAttribute("outlet_id").toString());
//        String reqMsg = mp.encryptMessage(req);
//        String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//        HashMap resp = mp.decryptMessage(responseWeb);
//        String message;
//        if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//            session.setAttribute("total_sales", resp.get(FieldParameterMatapos.total_sales).toString());
//            session.setAttribute("total_earnings", resp.get(FieldParameterMatapos.total_earnings).toString());
//            session.setAttribute("total_customers", resp.get(FieldParameterMatapos.total_customers).toString());
//            session.setAttribute("total_item_sold", resp.get(FieldParameterMatapos.total_item_sold).toString());
//            response.getWriter().print(resp.get(FieldParameterMatapos.resp_code));
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//        } else {
//            RequestDispatcher rd = request.getRequestDispatcher("/db");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-danger status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Failed retrieve Data\n"
//                    + "</div>");
//            rd.include(request, response);
//            System.out.println("Failed retrieve Data");
//            log.info("\n" + "Failed retrieve Data" + "\n");
//        }
//    }
}
