package service;

import Dao.PatientDao;
import model.Patient;

import java.util.List;

public class PatientServiceImpl implements PatientService {

    private final PatientDao  patientDao;

    public PatientServiceImpl(PatientDao patientDao){
        this.patientDao = patientDao;
    }

    @Override
    public void registerPatient(String name){
        Patient patient = new Patient(name);
       patientDao.save(patient);
    }

    @Override
    public List<Patient> getAllPatients() {
        return patientDao.findAll();
    }
}
