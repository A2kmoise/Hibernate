package Controller;

import Dao.PatientDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.PatientService;
import service.PatientServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = "/patients", loadOnStartup = 1)
public class PatientController extends HttpServlet {

    private PatientService patientService;

    @Override
    public void init(){
        patientService = new PatientServiceImpl(new PatientDaoImpl());
        // Trigger Hibernate initialization to create tables on startup
        try {
            patientService.getAllPatients();
            System.out.println("Hibernate successfully initialized and tables checked.");
        } catch (Exception e) {
            System.err.println("Error initializing Hibernate: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String name = req.getParameter("name");
        System.out.println("Attempting to register patient: " + name);
        
        if (name != null && !name.trim().isEmpty()) {
            patientService.registerPatient(name);
            System.out.println("Patient " + name + " saved successfully.");
        } else {
            System.out.println("Patient name was empty, skipping save.");
        }

        // Redirect back to the GET method of this servlet
        res.sendRedirect(req.getContextPath() + "/patients");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws  ServletException, IOException{
        req.setAttribute("patients", patientService.getAllPatients());
        req.getRequestDispatcher("patient.jsp").forward(req, res);
    }


}
