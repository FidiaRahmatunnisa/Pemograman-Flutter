/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fidia.mataKuliah.Repository;

import com.fidia.mataKuliah.entity.MataKuliah;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author Fidya
 */
public interface MataKuliahRepository {

    public Optional<MataKuliah> findMataKuliahBySks(String sks);

    public List<MataKuliah> findAll();

    public void save(MataKuliah mataKuliah);

    
   
}
