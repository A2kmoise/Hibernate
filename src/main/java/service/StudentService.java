package service;

import model.Student;
import java.util.List;

public interface StudentService {
    void saveStudent(Student student);
    List<Student> getAllStudents();
    Student getStudentById(Long id);
    void updateStudent(Student student);
    void deleteStudent(Long id);
}
