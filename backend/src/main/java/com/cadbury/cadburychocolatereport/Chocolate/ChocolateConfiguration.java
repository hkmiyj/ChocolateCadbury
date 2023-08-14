package com.cadbury.cadburychocolatereport.Chocolate;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Configuration
public class ChocolateConfiguration {

    @Bean
    CommandLineRunner commandLineRunner(ChocolateRepository repository) {
        return args -> {
            List<Chocolate> chocolates = loadCsvData();
            repository.saveAll(chocolates);
        };
    }

    private List<Chocolate> loadCsvData() {
        List<Chocolate> chocolates = new ArrayList<>();

        InputStream inputStream = getClass().getResourceAsStream("/Cadbury_Chocolate_v1.csv");
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));

        try {
            chocolates = reader.lines().skip(1)
                    .map(line -> {
                        String[] row = line.split(",");

                        String chocolateType = row[0];
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
                        LocalDate productionDate = LocalDate.parse(row[1] + "-"+Year.now().getValue(), formatter);
                        String volume = row[2];
                        return new Chocolate(chocolateType, productionDate, volume);
                    }).collect(Collectors.toList());

            reader.close();


        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
        }
        return chocolates;
    }
}
