# 🏘️ Property Rental Platform

A simplified backend schema and seed setup for a vacation rental system inspired by platforms like Airbnb.

---

## 📚 Contents

- `README-SCHEMA.md`: Details of the database schema and normalization
- `README-SEED.md`: Seed data with realistic records
- `README-FEATURES.md`: Functional features of the platform

---

## ⚙️ Technologies

- PostgreSQL / MySQL (Generic SQL syntax)
- UUID-based primary keys
- Normalized to 3NF
- Indexed for performance

---

## 🏗️ Schema Overview

- 6 core tables:
  - `Users`
  - `Properties`
  - `Bookings`
  - `Payments`
  - `Reviews`
  - `Messages`
- Foreign keys ensure relational integrity
- ENUMs used for roles and statuses

---

## 🚀 Getting Started

1. Run the `CREATE TABLE` SQL scripts
2. Populate the DB using the `INSERT` seed data
3. Query and test features (booking, review, messaging)

---

## 📈 Future Improvements

- Add availability calendar
- Integrate real payment gateways
- Role-based authentication system
- Admin dashboard

---

## 📄 License

MIT License (or as per your preference)

---

## ✍️ Author

Developed by Dandy Herko – Information Science | Backend Enthusiast
