# Database Normalization to 3NF

## 🎯 Objective
Normalize the given database schema to **Third Normal Form (3NF)** to eliminate redundancy, ensure data integrity, and optimize design.

---

## 📌 Original Design Issues

### 1. **User Table**
- ✅ Already in 3NF — no transitive dependencies or partial dependencies.

### 2. **Property Table**
- 🚩 `host_id` refers to `User(user_id)` with role = host, which is acceptable but relies on `role` filtering logic rather than structure.
- ✅ Otherwise, conforms to 3NF.

### 3. **Booking Table**
- ✅ All non-key attributes depend fully on the primary key.
- 🚩 Potential risk if `total_price` is calculated (e.g., based on date range × price), it may become **derived data** → violates normalization.

### 4. **Payment Table**
- 🚩 `amount` may duplicate `Booking.total_price` → if so, it's **redundant** and violates 3NF.

### 5. **Review Table**
- ✅ Complies with 3NF.

### 6. **Message Table**
- ✅ Complies with 3NF.

---

## 🛠️ Normalization Steps

### 🔄 Step 1: Remove Derived Attributes

#### Booking Table
- 🔸 **Issue**: `total_price` is derived (e.g., `pricepernight × number of nights`).
- ✅ **Fix**: Remove `total_price` and calculate it dynamically via query logic.



### After 3NF Normalization 

## User 
user_id (PK)
first_name
last_name
email (UNIQUE)
password_hash
phone_number
role
created_at

## Property 
property_id (PK)
host_id (FK → User(user_id), must be role='host')
name
description
location
pricepernight
created_at
updated_at


## Booking 
booking_id (PK)
property_id (FK → Property)
user_id (FK → User)
start_date
end_date
status
created_at

## Payment 
payment_id (PK)
booking_id (FK → Booking)
amount (retain only if independent of price calculation)
payment_date
payment_method

## Review 
review_id (PK)
property_id (FK → Property)
user_id (FK → User)
rating
comment
created_at

##Message 
message_id (PK)
sender_id (FK → User)
recipient_id (FK → User)
message_body
sent_at
