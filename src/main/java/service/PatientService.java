package service;

import model.Patient;

import java.util.List;

public interface PatientService {
    void registerPatient(String name);
    List<Patient> getAllPatients();

}