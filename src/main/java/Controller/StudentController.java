package Controller;

import Dao.StudentDao;
import Dao.StudentDaoImpl;
import model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addStudent")
public class StudentController extends HttpServlet {

    private final StudentDao studentDao = new StudentDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String studentClass = request.getParameter("studentClass");

        if (name != null && !name.trim().isEmpty() && studentClass != null && !studentClass.trim().isEmpty()) {
            Student student = new Student(name, studentClass);
            studentDao.saveStudent(student);
            response.sendRedirect("index.jsp?success=true");
        } else {
            response.sendRedirect("index.jsp?error=missing_fields");
        }
    }
}
