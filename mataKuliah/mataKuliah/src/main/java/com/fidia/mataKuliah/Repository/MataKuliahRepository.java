/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fidia.mataKuliah.repository;

import com.fidia.mataKuliah.entity.MataKuliah;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Fidya
 */
@Repository

public interface MataKuliahRepository {

    public Optional<MataKuliah> findMataKuliahBySks(String kode);
    
}
