package com.example.RentalAgency.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;


@Entity
@Table(name = "categories")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Id;
    @Column(name = "name")
    private String name;
    @OneToMany(mappedBy = "category")
    @JsonManagedReference
    private List<Ad> ads;
}
