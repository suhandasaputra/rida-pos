/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

//import java.io.File;
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
///**
// * Servlet to handle File upload request from Client
// *
// * @author suhanda
// */
//public class FileUploadHandler_item extends HttpServlet {
//
//    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(FileUploadHandler_item.class);
//
//    public FileUploadHandler_item() {
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession(true);
//        String brand_id = session.getAttribute("brand_id").toString();
//        String category = session.getAttribute("category_name_item").toString();
//        String message;
//
//        File f = new File("C:\\xampp\\htdocs\\freemium\\"+brand_id+"\\"+category);
//        if (!f.exists()) {
//            f.mkdir();
//        }
//        if (ServletFileUpload.isMultipartContent(request)) {
//            try {
//                List<FileItem> multiparts = new ServletFileUpload(
//                        new DiskFileItemFactory()).parseRequest(request);
//                for (FileItem item : multiparts) {
//                    if (!item.isFormField()) {
//                        String name = session.getAttribute("item_name").toString();
//                        item.write(new File(f.getAbsolutePath() + File.separator + name+".png"));
//                    }
//                }
//                //File uploaded successfully
//                message = "00";
////                System.out.println("berhasil");
//            } catch (Exception ex) {
////                System.out.println("gagal");
//                message = "01";
//            }
//        } else {
////            System.out.println("gagal2");
//            message = "02";
//        }
//        response.setContentType("text/plain");
//        response.getWriter().write(message);
//    }
//}
