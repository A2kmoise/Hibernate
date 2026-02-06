package model;

import jakarta.persistence.*;

@Entity
@Table(name = "patients")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ID;

    String name;

    public Patient () {}

    public Patient(String name){
        this.name = name;
    }

    public Long getId() {return ID;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}
}
