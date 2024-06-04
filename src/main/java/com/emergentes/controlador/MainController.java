
package com.emergentes.controlador;

import com.emergentes.bean.BeanEstudiante;
import com.emergentes.entidades.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        BeanEstudiante daoEstudiante = new BeanEstudiante();
        Estudiante e = new Estudiante();
        
        String action = (request.getParameter("action")!=null)? request.getParameter("action"): "view";
        
        switch(action){
            case "add":
                request.setAttribute("estudiante", e);
                request.getRequestDispatcher("estudiante-edit.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                e = daoEstudiante.buscar(id);
                request.setAttribute("estudiante", e);
                request.getRequestDispatcher("estudiante-edit.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                daoEstudiante.eliminar(id);
                response.sendRedirect("MainController");
                break;
            case "view":
                List<Estudiante> lista = daoEstudiante.listarTodos();
                request.setAttribute("estudiantes", lista);
                request.getRequestDispatcher("estudiantes.jsp").forward(request, response);
                break;
        }      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanEstudiante daoEstudiante = new BeanEstudiante();
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellidos= request.getParameter("apellidos");
        String email = request.getParameter("email");
        String fechaNacimiento=request.getParameter("fechaNacimiento");
        //Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));
        
        Estudiante e = new Estudiante();
        e.setId(id);
        e.setNombre(nombre);
        e.setApellidos(apellidos);
        e.setEmail(email);
        e.setFechaNacimiento(convierteFecha(fechaNacimiento));
        //e.setFechaNacimiento(fechaNacimiento);
        
        if(id > 0){
            daoEstudiante.editar(e);
        }else{
            daoEstudiante.insertar(e);
        }
        response.sendRedirect("MainController");
        
    }
    Date convierteFecha(String fechaNacimiento) {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fechaNacimiento);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            System.out.println("Error" + ex.getMessage());
        }
        return fechaBD;
    }
    
    
    
}
