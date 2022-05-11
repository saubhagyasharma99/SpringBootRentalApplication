package com.findaroom.app.controller;

import com.findaroom.app.model.PetDetailsDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api/pet/")
public class PetController {

    private static final List<PetDetailsDTO> PET_DETAILS = Arrays.asList(
            new PetDetailsDTO(1, "Room1", "Flate"),
            new PetDetailsDTO(2, "Room2", "Single"),
            new PetDetailsDTO(3, "Room3", "Apartment")
    );

    @GetMapping
    public ResponseEntity<List<PetDetailsDTO>> getAllPets() {
        return ResponseEntity.ok(PET_DETAILS);
    }

    @GetMapping("/{id}")
    public ResponseEntity<PetDetailsDTO> getByPetId(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(PET_DETAILS.stream()
                .filter(petDetailsDTO -> id.equals(petDetailsDTO.getId()))
                .findFirst()
                .orElseThrow(null));
    }




}
