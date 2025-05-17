# ✨ Core Features & Functionalities

This document outlines the core features supported by the system.

---

## 🔐 User Management

- **Registration** for guests, hosts, and admins
- **Login via email and password**
- **Roles**:
  - Guest: Can book properties
  - Host: Can list properties
  - Admin: System management

---

## 🏠 Property Management

- Hosts can:
  - Create, update, delete properties
  - View their listings
- Properties include:
  - Name, location, description
  - Price per night

---

## 📅 Booking System

- Guests can:
  - View availability
  - Book properties
- Bookings include:
  - Start/end dates, total price
  - Status: pending, confirmed, canceled

---

## 💳 Payment Processing

- Guests can pay via:
  - Credit Card, PayPal, Stripe (enum only)
- Linked to confirmed bookings
- Stores payment date and method

---

## 🌟 Reviews & Ratings

- Guests can rate properties after staying
- Rating scale: 1–5 stars
- Reviews include a comment and timestamp

---

## 💬 Messaging System

- Direct messaging between users (host ↔ guest)
- Timestamped communication
- Enables property-related Q&A
