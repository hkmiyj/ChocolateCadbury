package com.cadbury.cadburychocolatereport.Chocolate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ChocolateRepository extends JpaRepository<Chocolate, Long> {


    List<Chocolate> findByChocolateType(String chocolateType);

    List<Chocolate> findByProductionDate(LocalDate productionDate);

}
