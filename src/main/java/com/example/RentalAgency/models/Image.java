package com.example.RentalAgency.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "images")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Id;
    @Column(name = "path")
    private String path;
    @ManyToOne
    @JoinColumn(name = "ad_id")
    @JsonBackReference
    private Ad ad;
    @Column(name = "isPreviewImage")
    @ColumnDefault("false")
    private boolean isPreviewImage;
}
