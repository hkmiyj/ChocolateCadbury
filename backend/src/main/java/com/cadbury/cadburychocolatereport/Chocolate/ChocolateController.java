package com.cadbury.cadburychocolatereport.Chocolate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping(path = "/chocolate")
public class ChocolateController {

    private final ChocolateService chocolateService;

    @Autowired
    public ChocolateController(ChocolateService chocolateService) {
        this.chocolateService = chocolateService;
    }

    @GetMapping
    public List<Chocolate> getChocolate(
            @RequestParam(name = "chocolate_type", required = false) String chocolateType,
            @RequestParam(name = "production_date", required = false) LocalDate  productionDate) {
        if (chocolateType != null) {
            return chocolateService.getChocolateByType(chocolateType);
        }
        if(productionDate!=null){
            return chocolateService.getChocolateByDate(productionDate);
        }
        else {
            return chocolateService.getChocolate();
        }
    }

    @PostMapping
    public void addChocolate(@RequestBody Chocolate chocolate) {
        chocolateService.addChocolate(chocolate);
    }

}
