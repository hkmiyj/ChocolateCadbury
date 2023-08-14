package com.cadbury.cadburychocolatereport.Chocolate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ChocolateService {
    private final ChocolateRepository chocolateRepository;

    @Autowired
    public ChocolateService(ChocolateRepository chocolateRepository) {
        this.chocolateRepository = chocolateRepository;
    }

    public List<Chocolate> getChocolate() {
        return chocolateRepository.findAll();
    }

    public List<Chocolate> getChocolateByType(String chocolateType) {
        return chocolateRepository.findByChocolateType(chocolateType);
    }

    public List<Chocolate> getChocolateByDate(LocalDate productionDate) {
        return chocolateRepository.findByProductionDate(productionDate);
    }

    public void addChocolate(Chocolate chocolate) {
        if (chocolate.getChocolateType().isEmpty()) {
            throw new IllegalArgumentException("Chocolate Type Is Missing");
        }
        chocolateRepository.save(chocolate);
    }


}
