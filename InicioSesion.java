/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Cotrolador.Consultas;
import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vecto
 */
public class InicioSesion extends HttpServlet {

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

        final String Host = "127.0.0.1";
        final int Puerto = 5000;

        DataInputStream in;
        DataOutputStream ou;

        List<String> Datos = new ArrayList<>();

        String Tipo = "Iniciar";
        Datos.add(Tipo);

        String Name = request.getParameter("USER");
        Datos.add(Name);

        String Password = request.getParameter("PASS");
        Datos.add(Password);

        String MensajeS = String.join(",", Datos);
        System.out.println(MensajeS);

        try {
            Socket SocketCliente = new Socket(Host, Puerto);

            in = new DataInputStream(SocketCliente.getInputStream());
            ou = new DataOutputStream(SocketCliente.getOutputStream());
            // ENVIO DE DATOS
            ou.writeUTF(MensajeS);

            // RECIBO DE DATOS
            String Mensaje = in.readUTF();

            if (Mensaje.equals("Datos_Incorrectos")) {
                response.sendRedirect("IniciarS.jsp");
            } else {
                // Obtener Información

                HttpSession objsesion = request.getSession();
                objsesion.setAttribute("NAMEU", NAMEU);
                objsesion.setAttribute("PASSU", PASSU);
                objsesion.setAttribute("INSTU", INSTU);
                objsesion.setAttribute("EMAILU", EMAILU);

                objsesion.setAttribute("FORO1", FORO1);
                objsesion.setAttribute("FORO2", FORO2);
                objsesion.setAttribute("FORO3", FORO3);

                response.sendRedirect("Navegacion.jsp");

                SocketCliente.close();
            }
        } catch (Exception e) {

        }

        /**
         * String usuario = request.getParameter("USER"); String contraseña =
         * request.getParameter("PASS");
         *
         * Consultas co = new Consultas();
         *
         * if (co.autentificacion(usuario, contraseña)) {
         *
         * HttpSession objsesion = request.getSession();
         * objsesion.setAttribute("Name", usuario);
         *
         * response.sendRedirect("Navegacion.jsp"); } else {
         * response.sendRedirect("IniciarS.jsp"); }*
         */
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
