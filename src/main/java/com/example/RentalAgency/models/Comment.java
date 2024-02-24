package com.example.RentalAgency.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;


@Entity
@Table(name = "comments")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Id;
    @Column(name = "author")
    private String author;
    @Column(name = "text", columnDefinition = "text")
    private String text;
    @ManyToOne
    @JoinColumn(name = "ad_id")
    @JsonBackReference
    private Ad ad;
}
