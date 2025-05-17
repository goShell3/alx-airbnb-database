# 📋 Total Requirements - Property Rental Platform

This document summarizes all the **requirements** for the Property Rental System, covering technical specs, functional and non-functional expectations, database standards, and user interactions.

---

## 🔧 Technical Requirements

- ✅ Backend: SQL-based RDBMS (PostgreSQL / MySQL)
- ✅ Unique identifiers (UUID) for all entities
- ✅ Use of ENUMs for fields like `role`, `booking_status`, `payment_method`
- ✅ Timestamps for audit/logging (created_at, updated_at)
- ✅ 3NF-compliant schema
- ✅ Indexed foreign keys for JOIN performance
- ✅ Referential integrity via `ON DELETE CASCADE` or `SET NULL` policies

---

## 📌 Functional Requirements

### 🔐 Authentication & Authorization

- Register users with role: guest, host, or admin
- Login system (via email + password)
- Access controls:
  - Guests: book, review, message
  - Hosts: manage listings, communicate with guests
  - Admin: manage users, view system-wide data

### 🏠 Property Management

- Hosts can:
  - Add new properties (name, location, price, description)
  - Update and delete existing listings
  - View their own property list

### 📅 Booking & Availability

- Guests can:
  - Search for properties by location
  - View availability (based on dates)
  - Make bookings with start & end dates
- Bookings contain:
  - Auto-calculated total price (based on date range and nightly price)
  - Status: `pending`, `confirmed`, `cancelled`

### 💳 Payments

- Process payments linked to bookings
- Track:
  - Amount
  - Payment method (credit card, PayPal, Stripe)
  - Timestamp of payment

### 🌟 Ratings & Reviews

- Guests can rate properties (1–5 stars)
- Provide a written comment
- Only after a stay is completed

### 💬 Messaging

- Host and guest direct messaging
- Stores:
  - Sender
  - Recipient
  - Body
  - Sent timestamp

---

## 📂 Database Requirements

- ✅ Use appropriate data types (`UUID`, `VARCHAR`, `ENUM`, `DECIMAL`, `TIMESTAMP`)
- ✅ All tables must have a primary key
- ✅ Foreign keys with referential integrity
- ✅ Indexes on primary & foreign key columns
- ✅ No partial, transitive, or duplicate dependencies (3NF)
- ✅ Seed data must cover edge cases (e.g., canceled bookings, missing reviews)

---

## ⚙️ Non-Functional Requirements

- 🧠 Readable and maintainable SQL schema
- ⚡ Fast lookup for frequent operations (search, filter, join)
- 🔒 Secure storage of user information (hashed passwords)
- 📝 Auditable operations via timestamps
- 🚀 Easily extensible for future features (availability calendar, pricing strategies)

---

## 📈 Optional Enhancements (Future Work)

- Admin dashboard for managing system-wide data
- Real-time notifications for new messages or bookings
- Availability calendar with blackout dates
- Multi-language support

---

## 🧪 Testing Requirements

- All functionalities must be testable with seed data:
  - Booking overlaps
  - Payments for confirmed bookings only
  - Reviews only after completed stays
  - Users sending/receiving messages

---

## ✅ Status

- [x] Database Schema Created
- [x] Data Normalized (3NF)
- [x] SQL `CREATE TABLE` statements written
- [x] Sample `INSERT` data for all entities
- [x] README documentation provided

---

## ✍️ Author

Developed by Dandy Herko
3rd Year @ Addis Ababa University – School of Computer and Information Science  
Focus: Backend Systems, Secure Architecture, Clean Database Design
