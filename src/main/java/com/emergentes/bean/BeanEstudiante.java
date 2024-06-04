
package com.emergentes.bean;

import com.emergentes.entidades.Estudiante;
import com.emergentes.jpa.EstudianteJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanEstudiante {
    private EntityManagerFactory emf;
    private EstudianteJpaController daoEstudiante;

    public BeanEstudiante() {
        emf = Persistence.createEntityManagerFactory("UPseguimiento");
        daoEstudiante = new EstudianteJpaController(emf);
    }
    public List<Estudiante> listarTodos(){
        return daoEstudiante.findEstudianteEntities();
    }
    public void insertar(Estudiante e){
        daoEstudiante.create(e);
    }
    public void editar(Estudiante e){
       
        try {
            daoEstudiante.edit(e);
        } catch (Exception ex) {
            Logger.getLogger(BeanEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public void eliminar(Integer id){
        
        try {
            daoEstudiante.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public Estudiante buscar(Integer id){
        return daoEstudiante.findEstudiante(id);
    }
}
