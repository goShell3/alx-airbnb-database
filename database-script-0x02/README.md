# 🌱 Database Seed Data - Property Rental Platform
    
This file explains the purpose and structure of the seed data used to populate the database for testing and development.

---

## 🧪 Sample Entries

### 👥 Users

- 1 host (`Bob Smith`)
- 2 guests (`Alice Johnson`, `Carol Davis`)
- 1 admin user

### 🏡 Properties

- "Sunny Villa" in Miami
- "Mountain Retreat" in Denver
- Both owned by the same host

### 📆 Bookings

- Alice booked Sunny Villa (confirmed)
- Carol booked Mountain Retreat (pending)

### 💳 Payments

- One successful payment for Alice's booking

### 🌟 Reviews

- Alice left a 5-star review for Sunny Villa
- Carol left a 4-star review for Mountain Retreat

### 💬 Messages

- Alice and Bob exchanged messages regarding property availability

---

## 🧰 Usage

To run the seed:
1. Ensure the schema is created.
2. Insert UUIDs if your DB doesn’t generate them automatically.
3. Run the provided `INSERT` statements in order:
   - Users → Properties → Bookings → Payments → Reviews → Messages

---

## 🚀 Goal

The seed data is designed to reflect **real-world usage patterns** for:
- Testing booking logic
- UI previews (host/guest dashboards)
- Message and review flows
