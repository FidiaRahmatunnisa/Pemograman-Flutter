/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.nilai.nilai.service;

import com.fidia.nilai.nilai.entity.Nilai;
import com.fidia.nilai.nilai.repository.NilaiRepository;
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
public class NilaiService {
     private final NilaiRepository nilaiRepository ;
    
    @Autowired
    public NilaiService(NilaiRepository nilaiRepository) {
        this.nilaiRepository = nilaiRepository;
    }
    
    public List<Nilai> getAll(){
        return nilaiRepository.findAll();
    }
    
    public void insert(Nilai nilai){
        Optional<Nilai> nilaiOptional = 
                nilaiRepository.findMahasiswaByNilai(nilai.getNilai());
        if(nilaiOptional.isPresent()){
            throw new IllegalStateException("nilai sudah ada");
        }
        nilaiRepository.save(nilai);
    }
    
    public void delete(Long nilaiId){
        boolean ada = nilaiRepository.existsById(nilaiId);
        if(!ada){
            throw new IllegalStateException("nilai ini tidak ada");
        }
        nilaiRepository.deleteById(nilaiId);
    }
    
public void update(Long nilaiId, String idmahasiswa, String idmatakuliah){
    // Mencari nilai berdasarkan ID
    Optional<Nilai> nilaiOptional = (Optional<Nilai>) nilaiRepository.findById(nilaiId);
    
    // Memeriksa apakah nilai ditemukan
    if (nilaiOptional.isPresent()) {
        Nilai nilai = nilaiOptional.get(); // Mendapatkan nilai dari Optional

        // Melakukan pembaruan nilai jika perlu
        if(idmahasiswa!=null && idmahasiswa.length()>0 && !Objects.equals(nilai.getIdmahasiswa(), idmahasiswa)){
            nilai.setIdmahasiswa(idmahasiswa);
        }

        if(idmatakuliah!=null && idmatakuliah.length()>0 && !Objects.equals(nilai.getIdmatakuliah(), idmatakuliah)){
            Optional<Nilai> nilaiOptionalDuplicate = nilaiRepository.findMahasiswaByIdmahasiswa(idmahasiswa);
            if(nilaiOptionalDuplicate.isPresent()){
                throw new IllegalStateException("nilai sudah ada");
            }
            nilai.setIdmatakuliah(idmatakuliah);
        }
    } else {
        // Melemparkan exception jika nilai tidak ditemukan
        throw new IllegalStateException("nilai tidak ada");
    }
}

}
