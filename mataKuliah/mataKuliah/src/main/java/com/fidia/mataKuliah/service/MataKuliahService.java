/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.mataKuliah.service;

import com.fidia.mataKuliah.entity.MataKuliah;
import com.fidia.mataKuliah.repository.MataKuliahRepository;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Fidya
 */
@Service
public class MataKuliahService {
    private final MataKuliahRepository mataKuliahRepository ;
    
    @Autowired
    public MataKuliahService(MataKuliahRepository mataKuliahRepository) {
        this.mataKuliahRepository = mataKuliahRepository;
    }
    
    public List<MataKuliah> getAll(){
        return (List<MataKuliah>) mataKuliahRepository..findAll();
    }
    
    public void insert(MataKuliah mataKuliah){
        Optional<MataKuliah> mataKuliahOptional = 
                mataKuliahRepository.findMataKuliahBySks(mataKuliah.getKode());
        if(mataKuliahOptional.isPresent()){
            throw new IllegalStateException("kode sudah ada");
        }
        mataKuliahRepository.save(mataKuliah);
    }
    
    public void delete(Long mataKuliahId){
        boolean ada = mataKuliahRepository.existsById(mataKuliahId);
        if(!ada){
            throw new IllegalStateException("MataKuliah ini tidak ada");
        }
        mataKuliahRepository.deleteById(mataKuliahId);
    }
    
    
    public void update(Long mataKuliahId, String kode, String nama){
    // Mencari MataKuliah berdasarkan ID
    Optional<MataKuliah> mataKuliahOptional = mataKuliahRepository.findById(mataKuliahId);

    // Memeriksa apakah MataKuliah ditemukan
    if (mataKuliahOptional.isPresent()) {
        MataKuliah mataKuliah = mataKuliahOptional.get(); // Mendapatkan MataKuliah dari Optional

        // Melakukan pembaruan MataKuliah jika perlu
        if (nama != null && nama.length() > 0 && !Objects.equals(mataKuliah.getNama(), nama)) {
            mataKuliah.setNama(nama);
        }

        if (kode != null && kode.length() > 0 && !Objects.equals(mataKuliah.getKode(), kode)) {
            Optional<MataKuliah> mataKuliahOptionalDuplicate = mataKuliahRepository.findMataKuliahBySks(kode);
            if (mataKuliahOptionalDuplicate.isPresent()) {
                throw new IllegalStateException("sks sudah ada");
            }
            mataKuliah.setKode(kode);
        }
    } else {
        // Melemparkan exception jika MataKuliah tidak ditemukan
        throw new IllegalStateException("MataKuliah tidak ada");
    }
}
    
}

    
    

