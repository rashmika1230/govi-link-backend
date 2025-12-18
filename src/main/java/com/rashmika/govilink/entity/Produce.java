package com.rashmika.govilink.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "produce", indexes = {
        @Index(name = "idx_produce_farmer", columnList = "farmer_id"),
        @Index(name = "idx_produce_status", columnList = "status"),
        @Index(name = "idx_produce_district", columnList = "district")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Produce {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", nullable = false)
    private UUID id;

    @Column(name = "farmer_id", nullable = false)
    private UUID farmerId;

    @Column(name = "title", nullable = false, length = 200)
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "produce_type", nullable = false, length = 100)
    private String produceType;

    @Column(name = "expected_price_per_kg", nullable = false, precision = 10, scale = 2)
    private BigDecimal expectedPricePerKg;

    @Column(name = "quantity_kg", nullable = false)
    private Double quantityKg;

    @Column(name = "district", nullable = false, length = 100)
    private String district;

    @Column(name = "city", nullable = false, length = 100)
    private String city;

    @Column(name = "available_date", nullable = false)
    private LocalDate availableDate;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 50)
    private ProduceStatus status;

    @Column(name = "image_url")
    private String imageUrl;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Version
    @Column(name = "version", nullable = false)
    private Long version;

    @PrePersist
    protected void onCreate() {
        createdAt = Instant.now();
        if (status == null) {
            status = ProduceStatus.AVAILABLE;
        }
    }

    public enum ProduceStatus {
        AVAILABLE, PARTIALLY_BOOKED, FULLY_BOOKED, SOLD, EXPIRED
    }

}