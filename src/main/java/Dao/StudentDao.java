package Dao;

import model.Student;

import java.util.List;

public interface StudentDao {
    void saveStudent(Student student);
    List<Student> getAllStudents();
    Student getStudentById(Long id);
    void updateStudent(Student student);
    void deleteStudent(Long id);
}
