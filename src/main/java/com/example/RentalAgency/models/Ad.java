package com.example.RentalAgency.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "ads")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ad {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Id;
    @Column(name = "title")
    private String title;
    @Column(name = "description", columnDefinition = "text")
    private String description;
    @Column(name = "price")
    private int price;
    @Column(name = "city")
    private String city;
    @Column(name = "author")
    private String author;
    @Column(name = "phone")
    private String phone;
    @Column(name = "area")
    private int area;
    @Column(name = "views", nullable = false)
    @ColumnDefault("0")
    private int views;
    private LocalDateTime dateOfCreate;
    @PrePersist
    private void init() {
        dateOfCreate = LocalDateTime.now();
    }
    @OneToMany(mappedBy = "ad")
    @JsonManagedReference
    private List<Comment> comments;
    @ManyToOne
    @JoinColumn(name = "category_id")
    @JsonBackReference
    private Category category;
    @OneToMany(mappedBy = "ad")
    @JsonManagedReference
    private List<Image> images;
    @Transient
    private String imagePath;
}
