# Airbnb Database – Sample Data Seeding

## Directory
`database-script-0x02/`

## Files
- `seed.sql` – SQL script to populate tables with sample data
- `README.md` – Instructions and documentation

## Description
This script adds sample records to all database entities:
- 4 users (including a host and admin)
- 2 properties listed by a host
- 2 bookings by different users
- 1 confirmed payment
- 2 user reviews
- 2 messages between host and guest

## How to Use

1. Ensure the schema is already created:
```bash
psql -U your_user -d your_database -f ../database-script-0x01/schema.sql
