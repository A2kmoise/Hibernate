package service;

import Dao.StudentDao;
import Dao.StudentDaoImpl;
import model.Student;
import java.util.List;

public class StudentServiceImpl implements StudentService {

    private final StudentDao studentDao = new StudentDaoImpl();

    @Override
    public void saveStudent(Student student) {
        studentDao.saveStudent(student);
    }

    @Override
    public List<Student> getAllStudents() {
        return studentDao.getAllStudents();
    }

    @Override
    public Student getStudentById(Long id) {
        return studentDao.getStudentById(id);
    }

    @Override
    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    @Override
    public void deleteStudent(Long id) {
        studentDao.deleteStudent(id);
    }
}
