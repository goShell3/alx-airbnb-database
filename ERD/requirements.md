## 🧾 **Entities and Attributes**

### 1. **User**

Represents individuals using the system (guests, hosts, admins).

| Attribute       | Description                             |
| --------------- | --------------------------------------- |
| `user_id`       | Primary key, unique identifier (UUID).  |
| `first_name`    | First name of the user (required).      |
| `last_name`     | Last name of the user (required).       |
| `email`         | Unique email address (required).        |
| `password_hash` | Hashed password (required).             |
| `phone_number`  | Optional phone number.                  |
| `role`          | ENUM: guest, host, or admin (required). |
| `created_at`    | Timestamp of account creation.          |

---

### 2. **Property**

Represents accommodations listed by hosts.

| Attribute       | Description                              |
| --------------- | ---------------------------------------- |
| `property_id`   | Primary key (UUID).                      |
| `host_id`       | Foreign key referencing `User(user_id)`. |
| `name`          | Property name (required).                |
| `description`   | Description of the property (required).  |
| `location`      | Location of the property (required).     |
| `pricepernight` | Nightly rate (required).                 |
| `created_at`    | Timestamp of creation.                   |
| `updated_at`    | Timestamp of last update.                |

---

### 3. **Booking**

Represents a reservation of a property by a user.

| Attribute     | Description                                      |
| ------------- | ------------------------------------------------ |
| `booking_id`  | Primary key (UUID).                              |
| `property_id` | Foreign key referencing `Property(property_id)`. |
| `user_id`     | Foreign key referencing `User(user_id)`.         |
| `start_date`  | Start date of booking.                           |
| `end_date`    | End date of booking.                             |
| `total_price` | Total cost of the booking.                       |
| `status`      | ENUM: pending, confirmed, canceled.              |
| `created_at`  | Timestamp of booking creation.                   |

---

### 4. **Payment**

Represents a payment made for a booking.

| Attribute        | Description                                    |
| ---------------- | ---------------------------------------------- |
| `payment_id`     | Primary key (UUID).                            |
| `booking_id`     | Foreign key referencing `Booking(booking_id)`. |
| `amount`         | Amount paid.                                   |
| `payment_date`   | Timestamp of payment.                          |
| `payment_method` | ENUM: credit\_card, paypal, stripe.            |

---

### 5. **Review**

Represents user feedback on a property.

| Attribute     | Description                                      |
| ------------- | ------------------------------------------------ |
| `review_id`   | Primary key (UUID).                              |
| `property_id` | Foreign key referencing `Property(property_id)`. |
| `user_id`     | Foreign key referencing `User(user_id)`.         |
| `rating`      | Integer between 1 and 5.                         |
| `comment`     | Textual feedback.                                |
| `created_at`  | Timestamp of review submission.                  |

---

### 6. **Message**

Represents communication between users.

| Attribute      | Description                              |
| -------------- | ---------------------------------------- |
| `message_id`   | Primary key (UUID).                      |
| `sender_id`    | Foreign key referencing `User(user_id)`. |
| `recipient_id` | Foreign key referencing `User(user_id)`. |
| `message_body` | Text content of the message.             |
| `sent_at`      | Timestamp of when the message was sent.  |

---

## 🔗 **Relationships Between Entities**

| Relationship                   | Cardinality | Description                                                 |
| ------------------------------ | ----------- | ----------------------------------------------------------- |
| **User → Property**            | One-to-Many | A host (User with role "host") can own multiple Properties. |
| **User → Booking**             | One-to-Many | A guest (User) can book many Properties.                    |
| **Property → Booking**         | One-to-Many | A Property can be booked many times by different Users.     |
| **Booking → Payment**          | One-to-One  | A Booking can have only one Payment.                        |
| **User → Review**              | One-to-Many | A User can write multiple Reviews.                          |
| **Property → Review**          | One-to-Many | A Property can receive multiple Reviews.                    |
| **User → Message (sender)**    | One-to-Many | A User can send many Messages.                              |
| **User → Message (recipient)** | One-to-Many | A User can receive many Messages.                           |

---

