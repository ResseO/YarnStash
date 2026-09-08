# 🧶 YarnStash

A personal yarn inventory management system built with **PostgreSQL**. Tracks yarn brands, yarn types, colorways, dye lots, quantities, and scrap weights across a fully relational database schema.

---

## 📋 Project Overview

YarnStash is a relational database designed to manage a personal yarn stash. Instead of spreadsheets or handwritten notes, this project uses structured SQL to organize inventory in a way that's queryable, scalable, and easy to update.

This project demonstrates:
- Relational database design with foreign key constraints
- Schema creation and iterative `ALTER TABLE` modifications
- Real-world `INSERT` data management
- Use of `NULL` handling, boolean flags, and decimal precision
- PostgreSQL-specific syntax and data types

---

## 🗂️ Schema

The database consists of three related tables:

### `Brands`
Stores yarn brand information including purchase location and notes.

| Column | Type | Notes |
|--------|------|-------|
| ID | INT | Primary Key |
| Brand | VARCHAR(30) | Brand name |
| Purchase_Place | VARCHAR(30) | Where to buy |
| Website | TEXT | Brand website |
| Notes | TEXT | Optional notes |

---

### `Yarn`
Stores yarn product details. References `Brands` via foreign key.

| Column | Type | Notes |
|--------|------|-------|
| ID | INT | Primary Key |
| Brand_ID | INT | Foreign Key → Brands |
| Yarn_Name | VARCHAR(30) | Product name |
| Yarn_Weight | INT | Weight category (1–7) |
| Yardage | INT | Yards per skein |
| Skein_Weight | DECIMAL(4,2) | Weight in ounces |
| Needle_Size | DECIMAL(4,2) | Recommended needle size in mm |

---

### `Stash`
Tracks individual inventory entries by color and dye lot. References `Yarn` via foreign key.

| Column | Type | Notes |
|--------|------|-------|
| ID | INT | Primary Key |
| YARN_ID | INT | Foreign Key → Yarn |
| COLOR_NAME | VARCHAR(45) | Colorway name |
| DYE_LOT | VARCHAR(30) | Dye lot number |
| QTY | INT | Full skeins on hand |
| SCRAP_WEIGHT | DECIMAL(4,2) | Scrap weight in ounces |
| AVAILABLE | BOOLEAN | Available for use |
| Notes | TEXT | Colorway or stash notes |

---

## 🔗 Entity Relationship

```
Brands (1) ──── (many) Yarn (1) ──── (many) Stash
```

---

## 🚀 How to Use

1. Clone the repo:
   ```bash
   git clone https://github.com/ResseO/YarnStash.git
   ```

2. Open your PostgreSQL client and run:
   ```bash
   psql -U your_username -d your_database -f yarn_stash.sql
   ```

3. Query away! Example:
   ```sql
   SELECT b.Brand, y.Yarn_Name, s.COLOR_NAME, s.QTY
   FROM Stash s
   JOIN Yarn y ON s.YARN_ID = y.ID
   JOIN Brands b ON y.Brand_ID = b.ID
   WHERE s.AVAILABLE = TRUE
   ORDER BY b.Brand, y.Yarn_Name;
   ```

---

## 📦 Current Inventory Stats

| Brands | Yarn Types | Stash Entries |
|--------|-----------|---------------|
| 6 | 11 | 53 |

**Brands tracked:** Loops and Threads, Caron, Premier, Velvet, Lion Brand, Yarn Bee

---

## 🛠️ Built With

- PostgreSQL v18
- Hand-written SQL (no ORM)

---

## 👩🏽‍💻 Author

**Resse Ochoa**  
Data Analyst | ML Ops Specialist  
[LinkedIn](https://www.linkedin.com/in/) • [GitHub](https://github.com/ResseO)
