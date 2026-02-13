package Controller;

import service.StudentService;
import service.StudentServiceImpl;
import model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class StudentController extends HttpServlet {

    private final StudentService studentService = new StudentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/delete":
                    deleteStudent(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateStudent(request, response);
                    break;
                case "/index.jsp":
                    listStudents(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        if ("/add".equals(action) || "/addStudent".equals(action)) {
            addStudent(request, response);
        } else if ("/update".equals(action)) {
            updateStudent(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> listStudent = studentService.getAllStudents();
        request.setAttribute("listStudent", listStudent);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String studentClass = request.getParameter("studentClass");

        if (name != null && !name.trim().isEmpty() && studentClass != null && !studentClass.trim().isEmpty()) {
            Student student = new Student(name, studentClass);
            studentService.saveStudent(student);
            response.sendRedirect(request.getContextPath() + "/?success=true");
        } else {
            response.sendRedirect(request.getContextPath() + "/?error=missing_fields");
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Student existingStudent = studentService.getStudentById(id);
        request.setAttribute("student", existingStudent);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String studentClass = request.getParameter("studentClass");

        Student student = new Student(name, studentClass);
        student.setId(id);
        studentService.updateStudent(student);
        response.sendRedirect(request.getContextPath() + "/?updated=true");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        studentService.deleteStudent(id);
        response.sendRedirect(request.getContextPath() + "/?deleted=true");
    }
}
