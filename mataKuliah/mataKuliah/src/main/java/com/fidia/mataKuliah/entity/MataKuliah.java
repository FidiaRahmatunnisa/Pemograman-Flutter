/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.mataKuliah.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author Fidya
 */
@Entity
@Table
public class MataKuliah {
    @Id
    @GeneratedValue
    private Long kode;
    private String nama;
    private String sks;

    public MataKuliah() {
    }

    public MataKuliah(Long kode, String nama, String sks) {
        this.kode = kode;
        this.nama = nama;
        this.sks = sks;
    }

    public Long getKode() {
        return kode;
    }

    public void setKode(Long kode) {
        this.kode = kode;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getSks() {
        return sks;
    }

    public void setSks(String sks) {
        this.sks = sks;
    }

    @Override
    public String toString() {
        return "MataKuliah{" + "kode=" + kode + ", nama=" + nama + ", sks=" + sks + '}';
    }
    
    
}
