-- Users table
CREATE TABLE users (
                       id CHAR(36) PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       role VARCHAR(50) NOT NULL CHECK (role IN ('FARMER', 'BUYER', 'ADMIN')),
                       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       INDEX idx_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Produce table
CREATE TABLE produce (
                         id CHAR(36) PRIMARY KEY,
                         farmer_id CHAR(36) NOT NULL,
                         title VARCHAR(200) NOT NULL,
                         description TEXT,
                         produce_type VARCHAR(100) NOT NULL,
                         expected_price_per_kg DECIMAL(10,2) NOT NULL,
                         quantity_kg DOUBLE NOT NULL,
                         district VARCHAR(100) NOT NULL,
                         city VARCHAR(100) NOT NULL,
                         available_date DATE NOT NULL,
                         status VARCHAR(50) NOT NULL CHECK (status IN ('AVAILABLE', 'PARTIALLY_BOOKED', 'FULLY_BOOKED', 'SOLD', 'EXPIRED')),
                         image_url TEXT,
                         created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         version BIGINT NOT NULL DEFAULT 0,
                         INDEX idx_produce_farmer (farmer_id),
                         INDEX idx_produce_status (status),
                         INDEX idx_produce_district (district),
                         INDEX idx_produce_type (produce_type),
                         INDEX idx_produce_date (available_date),
                         FOREIGN KEY (farmer_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bookings table
CREATE TABLE bookings (
                          id CHAR(36) PRIMARY KEY,
                          produce_id CHAR(36) NOT NULL,
                          buyer_id CHAR(36) NOT NULL,
                          quantity_kg DOUBLE NOT NULL,
                          total_price DECIMAL(10,2) NOT NULL,
                          status VARCHAR(50) NOT NULL CHECK (status IN ('PENDING', 'CONFIRMED', 'CANCELLED', 'COMPLETED')),
                          created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          INDEX idx_booking_produce (produce_id),
                          INDEX idx_booking_buyer (buyer_id),
                          FOREIGN KEY (produce_id) REFERENCES produce(id),
                          FOREIGN KEY (buyer_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Pricing history table
CREATE TABLE pricing_history (
                                 id CHAR(36) PRIMARY KEY,
                                 produce_type VARCHAR(100) NOT NULL,
                                 district VARCHAR(100) NOT NULL,
                                 date DATE NOT NULL,
                                 avg_price_per_kg DECIMAL(10,2) NOT NULL,
                                 min_price_per_kg DECIMAL(10,2),
                                 max_price_per_kg DECIMAL(10,2),
                                 INDEX idx_pricing_type_date (produce_type, date),
                                 INDEX idx_pricing_district (district)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
