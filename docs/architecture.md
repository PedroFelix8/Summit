# System Architecture

## Introduction

This document describes the architecture of the Sport Tracker application.

The architecture follows a local-first approach and prioritizes simplicity, low operational cost and maintainability.

---

# Architecture Overview

The application consists of four main layers:

1. Presentation Layer
2. Business Logic Layer
3. Data Layer
4. External Services Layer

---

# Presentation Layer

Responsible for user interaction.

Components:

- Home Screen
- Training History Screen
- Statistics Screen
- Goals Screen
- Profile Screen

Responsibilities:

- Display information
- Receive user input
- Trigger actions

---

# Business Logic Layer

Responsible for application rules and data processing.

Components:

- Training Service
- Statistics Service
- Goal Service
- Strava Service

Responsibilities:

- Validate data
- Process calculations
- Coordinate data flow

---

# Data Layer

Responsible for data persistence.

Components:

- SQLite Database
- Repositories

Responsibilities:

- Store information
- Retrieve information
- Update information

---

# External Services Layer

Responsible for third-party integrations.

Components:

- Strava API

Responsibilities:

- Authentication
- Activity synchronization
- Data import

---

# Architecture Diagram

```text
+----------------------+
|     Presentation     |
|       (Flutter)      |
+----------+-----------+
           |
           v
+----------------------+
|    Business Logic    |
|      Services        |
+----------+-----------+
           |
           v
+----------------------+
|      Data Layer      |
| SQLite + Repository  |
+----------+-----------+
           |
           v
+----------------------+
|    External APIs     |
|       Strava         |
+----------------------+
```

---

# Advantages

- Low complexity
- Easy maintenance
- No backend required
- Offline-first approach
- Future scalability

---

# Future Extensions

Possible future improvements:

- Cloud synchronization
- Firebase integration
- Social features
- Additional sports APIs

The architecture should support these extensions without requiring a complete redesign.