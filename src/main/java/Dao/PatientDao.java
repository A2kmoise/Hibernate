package Dao;

import model.Patient;

import java.util.List;

public interface PatientDao {
    void save(Patient patient);
    List<Patient> findAll();
}
