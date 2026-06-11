# Database Design

## Introduction

This document defines the database design for the Sport Tracker application.

The system uses a local SQLite database to store all user data, including endurance activities, strength workouts, exercises, and goals.

The design follows a relational model optimized for simplicity, performance, and offline usage.

---

# Design Approach

The database follows a **local-first relational structure** with the following principles:

- Each user owns their data.
- Workouts act as the central entity.
- Endurance and strength training are modeled separately.
- Strength training uses a hierarchical structure (Workout → Exercise → Sets).
- No external server dependency.

---

# Entity Relationship Model

## High-Level Diagram

```text
User
 |
 | 1
 |
 | N
Workout
 |
 +----------------------+
 |                      |
 |                      |
EnduranceActivity   StrengthExercise
                          |
                          |
                          N
                      ExerciseSet

User
 |
 N
Goal

User
 |
 1
 |
 1
StravaConnection
```

---

# Tables Definition

## User

Stores user profile information.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| name | TEXT | Username or nickname |
| preferred_sports | TEXT | Preferred sports (comma-separated or JSON) |

---

## Workout

Represents a training session.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| user_id | INTEGER (FK) | Owner of the workout |
| date | DATETIME | Training date |
| duration | INTEGER | Duration in minutes |
| type | TEXT | endurance / strength |
| notes | TEXT | Optional comments |

---

## EnduranceActivity

Stores endurance-specific metrics.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| workout_id | INTEGER (FK) | Related workout |
| sport | TEXT | Running, cycling, etc. |
| distance | REAL | Distance in km |
| pace | REAL | Average pace |
| elevation | REAL | Elevation gain |

---

## StrengthExercise

Represents an exercise inside a workout.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| workout_id | INTEGER (FK) | Related workout |
| name | TEXT | Exercise name |
| muscle_group | TEXT | Target muscle group |

---

## ExerciseSet

Represents a set of an exercise.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| exercise_id | INTEGER (FK) | Related exercise |
| set_number | INTEGER | Order of the set |
| repetitions | INTEGER | Number of reps |
| weight | REAL | Weight used (kg) |

---

## Goal

Stores user objectives.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| user_id | INTEGER (FK) | Owner |
| title | TEXT | Goal description |
| target_value | REAL | Target value |
| current_value | REAL | Progress |
| deadline | DATETIME | Goal deadline |

---

## StravaConnection

Stores OAuth authentication data.

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER (PK) | Unique identifier |
| user_id | INTEGER (FK) | Owner |
| access_token | TEXT | OAuth access token |
| refresh_token | TEXT | OAuth refresh token |
| expires_at | DATETIME | Token expiration |

---

# Relationships Summary

- A **User** has many **Workouts**
- A **Workout** can be:
  - One **EnduranceActivity**
  - Or multiple **StrengthExercises**
- A **StrengthExercise** has many **ExerciseSets**
- A **User** has many **Goals**
- A **User** has one **StravaConnection**

---

# Design Decisions

## 1. Workout as central entity
All training sessions are grouped under a single Workout entity to simplify history and statistics.

## 2. Separation of training types
Endurance and strength training require different data structures, so they are modeled separately.

## 3. Local SQLite storage
The application does not require a backend server in the MVP phase.

## 4. Extensibility
The model allows future additions such as:

- Swimming workouts
- CrossFit sessions
- Advanced analytics
- Cloud synchronization

---

# Conclusion

This database design supports both endurance and strength training in a unified and scalable structure while maintaining simplicity and offline-first operation.