# 📦 Database Schema - Property Rental Platform

This document outlines the **Entity-Relationship (ER) schema** used in the Property Rental System, covering all entities, attributes, relationships, and constraints.

---

## 🧱 Entities & Attributes

### 1. `Users`
| Column         | Type       | Constraint                  |
|----------------|------------|-----------------------------|
| user_id        | UUID       | PK, Indexed                 |
| first_name     | VARCHAR    | NOT NULL                   |
| last_name      | VARCHAR    | NOT NULL                   |
| email          | VARCHAR    | UNIQUE, NOT NULL           |
| password_hash  | VARCHAR    | NOT NULL                   |
| phone_number   | VARCHAR    | NULL                       |
| role           | ENUM       | (guest, host, admin)       |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP  |

### 2. `Properties`
| Column         | Type       | Constraint                          |
|----------------|------------|-------------------------------------|
| property_id    | UUID       | PK, Indexed                         |
| host_id        | UUID       | FK → Users(user_id)                |
| name           | VARCHAR    | NOT NULL                            |
| description    | TEXT       | NOT NULL                            |
| location       | VARCHAR    | NOT NULL                            |
| price_per_night| DECIMAL    | NOT NULL                            |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP           |
| updated_at     | TIMESTAMP  | ON UPDATE CURRENT_TIMESTAMP         |

### 3. `Bookings`
| Column       | Type       | Constraint                             |
|--------------|------------|----------------------------------------|
| booking_id   | UUID       | PK, Indexed                            |
| property_id  | UUID       | FK → Properties(property_id)          |
| user_id      | UUID       | FK → Users(user_id)                   |
| start_date   | DATE       | NOT NULL                               |
| end_date     | DATE       | NOT NULL                               |
| total_price  | DECIMAL    | NOT NULL                               |
| status       | ENUM       | (pending, confirmed, canceled)         |
| created_at   | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP              |

### 4. `Payments`
| Column        | Type       | Constraint                          |
|---------------|------------|-------------------------------------|
| payment_id    | UUID       | PK, Indexed                         |
| booking_id    | UUID       | FK → Bookings(booking_id)          |
| amount        | DECIMAL    | NOT NULL                            |
| payment_date  | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP           |
| payment_method| ENUM       | (credit_card, paypal, stripe)       |

### 5. `Reviews`
| Column     | Type    | Constraint                                 |
|------------|---------|--------------------------------------------|
| review_id  | UUID    | PK, Indexed                                |
| property_id| UUID    | FK → Properties(property_id)              |
| user_id    | UUID    | FK → Users(user_id)                       |
| rating     | INTEGER | CHECK rating BETWEEN 1 AND 5              |
| comment    | TEXT    | NOT NULL                                  |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP               |

### 6. `Messages`
| Column        | Type     | Constraint                           |
|---------------|----------|--------------------------------------|
| message_id    | UUID     | PK, Indexed                          |
| sender_id     | UUID     | FK → Users(user_id)                 |
| recipient_id  | UUID     | FK → Users(user_id)                 |
| message_body  | TEXT     | NOT NULL                             |
| sent_at       | TIMESTAMP| DEFAULT CURRENT_TIMESTAMP            |

---

## 🧩 Indexing & Optimization

- Primary keys are indexed automatically.
- Additional indexes:
  - `Users.email` (for login queries)
  - `Properties.property_id`
  - `Bookings.booking_id`
  - Foreign keys are implicitly indexed for JOIN operations.

---

## ✅ Normalization

The schema follows **Third Normal Form (3NF)**:
- No duplicate or repeating groups.
- No transitive dependencies.
- All non-key attributes depend only on primary keys.
