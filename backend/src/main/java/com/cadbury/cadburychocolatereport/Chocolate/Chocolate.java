package com.cadbury.cadburychocolatereport.Chocolate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Entity
@Table(uniqueConstraints = {
        @UniqueConstraint(name = "UniqueTypeAndDate", columnNames = { "chocolateType", "productionDate" })
})
public class Chocolate {
    @Id
    @SequenceGenerator(name = "chocolate_sequence", sequenceName = "chocolate_sequence", allocationSize = 1)

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "chocolate_sequence")
    private Long id;

    @JsonProperty("chocolate_type")
    private String chocolateType;

    @JsonProperty("production_date")
    private LocalDate productionDate;

    private String volume;

    public Chocolate() {

    }

    public Chocolate(Long id, String chocolateType, LocalDate production_date, String volume) {
        this.id = id;
        this.chocolateType = chocolateType;
        this.productionDate = production_date;
        this.volume = volume;
    }

    public Chocolate(String chocolateType, LocalDate production_date, String volume) {
        this.chocolateType = chocolateType;
        this.productionDate = production_date;
        this.volume = volume;
    }

    @JsonIgnore
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getChocolateType() {
        return chocolateType;
    }

    public void setChocolateType(String chocolateType) {
        this.chocolateType = chocolateType;
    }

    public String getProductionDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM");
        return productionDate.format(formatter);
    }

    public void setProductionDate(LocalDate productionDate) {
        this.productionDate = productionDate;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    @Override
    public String toString() {
        return "chocolate{" + "id=" + id + ", chocolate_type='" + chocolateType + '\'' + ", production_date=" + productionDate + ", volume='" + volume + '\'' + '}';
    }

}


