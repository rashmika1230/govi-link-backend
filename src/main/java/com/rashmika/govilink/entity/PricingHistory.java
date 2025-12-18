package com.rashmika.govilink.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "pricing_history")
public class PricingHistory {
    @Id
    @Size(max = 36)
    @Column(name = "id", nullable = false, length = 36)
    private String id;

    @Size(max = 100)
    @NotNull
    @Column(name = "produce_type", nullable = false, length = 100)
    private String produceType;

    @Size(max = 100)
    @NotNull
    @Column(name = "district", nullable = false, length = 100)
    private String district;

    @NotNull
    @Column(name = "date", nullable = false)
    private LocalDate date;

    @NotNull
    @Column(name = "avg_price_per_kg", nullable = false, precision = 10, scale = 2)
    private BigDecimal avgPricePerKg;

    @Column(name = "min_price_per_kg", precision = 10, scale = 2)
    private BigDecimal minPricePerKg;

    @Column(name = "max_price_per_kg", precision = 10, scale = 2)
    private BigDecimal maxPricePerKg;

}