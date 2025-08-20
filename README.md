# tunnel_project1.sql
# 🚧 Tunnel Traffic Management Database

This repository contains the SQL schema and logic for a comprehensive tunnel traffic management system. It models real-time traffic data, user interactions, vehicle tracking, discount handling, transaction processing, tunnel events announcement, audit log and more.

## 📦 Project Overview

The database includes:
- **15+ Tables**: Covering sensors, tunnels, users, vehicles, staff, charges, discounts, exemptions, transactions, tunnel events, real time data, optimazation logs, and avarage charge by congestion.
- **Triggers**: Automate discount and exemption logic during transactions.
- **Views**: Provide dynamic summaries of tunnel charges and discount factors.
- **Sample Data**: Included for testing and demonstration.

## 🧱 Schema Components

| Category             | Tables / Objects                          |
|----------------------|-------------------------------------------|
| Core Entities        | `tunnel`, `users`, `vehicles`             |
| Traffic Monitoring   | `sensor_data`, `realtimedata`             |
| Financials           | `charges`, `transactions`                 |
| Discounts & Exemptions | `discounts`, `discount_exemptions`     |
| Automation           | Triggers for discount logic               |
| Reporting            | Views for dynamic charge summaries        |

## ⚙️ Features

- Auto-generated IDs using identity columns
- Foreign key relationships for data integrity
- Dynamic charge calculation based on exemptions and discounts
- Real-time traffic modeling with congestion indicators
- Retroactive updates for missing fields and masked values

## 🚀 Getting Started

To use this database:
1. Clone the repository.
2. Import the SQL scripts into your preferred SQL environment (e.g., MySQL).
3. Run the schema creation scripts.
4. Populate sample data using provided inserts.
5. Explore views and triggers for dynamic behavior.

## 📈 Use Cases

- Traffic analytics and congestion monitoring
- Automated toll calculation
- Discount eligibility tracking
- Real-time transaction logging

## 👩‍💻 Author

Created by **Rozina Khatun**, a meticulous database designer passionate about SQL optimization, real-world modeling, and clean data architecture.

---

Feel free to fork, contribute, or reach out with suggestions!
