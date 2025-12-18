-- Password is 'password123' hashed with BCrypt
INSERT INTO users (id, name, email, password_hash, role, created_at) VALUES
                                                                         ('11111111-1111-1111-1111-111111111111', 'Sunil Perera', 'farmer@govilink.lk', '$2a$10$N9qo8uLOickgx2ZMRZoMye1YJ5BIVvzFxzXEn8Q0HZx0Xt0L9.GTO', 'FARMER', NOW()),
                                                                         ('22222222-2222-2222-2222-222222222222', 'Nimal Silva', 'buyer@govilink.lk', '$2a$10$N9qo8uLOickgx2ZMRZoMye1YJ5BIVvzFxzXEn8Q0HZx0Xt0L9.GTO', 'BUYER', NOW()),
                                                                         ('33333333-3333-3333-3333-333333333333', 'Admin User', 'admin@govilink.lk', '$2a$10$N9qo8uLOickgx2ZMRZoMye1YJ5BIVvzFxzXEn8Q0HZx0Xt0L9.GTO', 'ADMIN', NOW());

-- Sample produce listings
INSERT INTO produce (id, farmer_id, title, description, produce_type, expected_price_per_kg, quantity_kg, district, city, available_date, status, created_at, version) VALUES
                                                                                                                                                                           ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111',
                                                                                                                                                                            'Fresh Organic Carrots', 'High quality carrots grown without pesticides', 'Carrot',
                                                                                                                                                                            150.00, 500.0, 'Nuwara Eliya', 'Nuwara Eliya', '2025-12-20', 'AVAILABLE', NOW(), 0),

                                                                                                                                                                           ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111',
                                                                                                                                                                            'Premium Tomatoes', 'Fresh red tomatoes perfect for salads', 'Tomato',
                                                                                                                                                                            180.00, 300.0, 'Matale', 'Matale', '2025-12-22', 'AVAILABLE', NOW(), 0),

                                                                                                                                                                           ('cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111',
                                                                                                                                                                            'Organic Green Beans', 'Tender green beans harvested fresh', 'Green Beans',
                                                                                                                                                                            200.00, 150.0, 'Badulla', 'Bandarawela', '2025-12-25', 'AVAILABLE', NOW(), 0);

-- Sample pricing history (last 90 days)
INSERT INTO pricing_history (id, produce_type, district, date, avg_price_per_kg, min_price_per_kg, max_price_per_kg) VALUES
                                                                                                                         (UUID(), 'Carrot', 'Nuwara Eliya', DATE_SUB(CURDATE(), INTERVAL 7 DAY), 145.00, 130.00, 160.00),
                                                                                                                         (UUID(), 'Carrot', 'Nuwara Eliya', DATE_SUB(CURDATE(), INTERVAL 14 DAY), 150.00, 135.00, 165.00),
                                                                                                                         (UUID(), 'Carrot', 'Nuwara Eliya', DATE_SUB(CURDATE(), INTERVAL 30 DAY), 140.00, 125.00, 155.00),
                                                                                                                         (UUID(), 'Tomato', 'Matale', DATE_SUB(CURDATE(), INTERVAL 7 DAY), 175.00, 160.00, 190.00),
                                                                                                                         (UUID(), 'Tomato', 'Matale', DATE_SUB(CURDATE(), INTERVAL 14 DAY), 180.00, 165.00, 195.00),
                                                                                                                         (UUID(), 'Green Beans', 'Badulla', DATE_SUB(CURDATE(), INTERVAL 7 DAY), 195.00, 180.00, 210.00);