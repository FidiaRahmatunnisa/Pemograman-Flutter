/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.mataKuliah.controller;

import com.fidia.mataKuliah.entity.MataKuliah;
import com.fidia.mataKuliah.service.MataKuliahService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Fidya
 */
@RestController
@RequestMapping("api/v2/mataKuliah")
public class MataKuliahController {
    private MataKuliahService mataKuliahService;
    
    @Autowired
    public List<MataKuliah> getAll(){
        return mataKuliahService.getAll();
    }
    
    @PostMapping
    public void insert(@RequestBody MataKuliah mataKuliah){
        mataKuliahService.insert(mataKuliah);
    }
    
}
