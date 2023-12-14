/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.nilai.nilai.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;

/**
 *
 * @author Fidya
 */
@Table
@Entity
public class Nilai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String idmahasiswa;
    private String idmatakuliah;
    private int nilai;

    public Nilai() {
    }

    public Nilai(Long id, String idmahasiswa, String idmatakuliah, int nilai) {
        this.id = id;
        this.idmahasiswa = idmahasiswa;
        this.idmatakuliah = idmatakuliah;
        this.nilai = nilai;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdmahasiswa() {
        return idmahasiswa;
    }

//    public void setIdmahasiswa(String idmahasiswa) {
//        this.idmahasiswa = idmahasiswa;
//    }

    public String getIdmatakuliah() {
        return idmatakuliah;
    }

    public void setIdmatakuliah(String idmatakuliah) {
        this.idmatakuliah = idmatakuliah;
    }

    public int getNilai() {
        return nilai;
    }

    public void setNilai(int nilai) {
        this.nilai = nilai;
    }

   
    @Override
    public String toString() {
        return "Nilai{" + "id=" + id + ", idmahasiswa=" + idmahasiswa + ", idmatakuliah=" + idmatakuliah + ", nilai=" + nilai + '}';
    } 
//    ini namanya entiti

    public void setIdmahasiswa(String idmahasiswa) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
  
}
