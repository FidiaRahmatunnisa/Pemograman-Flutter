/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.mataKuliah.service;

import com.fidia.mataKuliah.Repository.MataKuliahRepository;
import com.fidia.mataKuliah.entity.MataKuliah;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Fidya
 */
@Service
public class MataKuliahService {
    private final MataKuliahRepository mataKuliahRepository;
    
    @Autowired

    public MataKuliahService(MataKuliahRepository mataKuliahRepository) {
        this.mataKuliahRepository = mataKuliahRepository;
    }
    
    public List<MataKuliah> getAll(){
        return mataKuliahRepository.findAll();
    } 
    
    public void insert(MataKuliah mataKuliah){
        Optional<MataKuliah> mataKuliahOptional =
                mataKuliahRepository.findMataKuliahBySks(mataKuliah.getSks());
        if(mataKuliahOptional.isPresent()){
            throw new IllegalStateException("sks telah terisi");
        }
       mataKuliahRepository.save(mataKuliah);
    }
    
//    public void delele(Long )
           
    
    
}
