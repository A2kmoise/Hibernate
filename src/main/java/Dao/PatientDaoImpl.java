package Dao;

import model.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class PatientDaoImpl implements PatientDao {

    @Override
    public  void save (Patient patient){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction Tx = session.beginTransaction();

        session.persist(patient);

        Tx.commit();
        session.close();
    }

    @Override
    public List<Patient> findAll() {
        Session session =HibernateUtil.getSessionFactory().openSession();
        List<Patient> patients = session.createQuery("from Patient", Patient.class).list();

        session.close();
        return patients;
    }
}
