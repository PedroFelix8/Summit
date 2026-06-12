# Flutter Project Structure

## Introduction

This document defines the folder structure of the Flutter application.

The architecture follows a feature-based approach combined with a layered separation of concerns.

---

# Root Structure

```text
lib/
│
├── core/
├── features/
├── shared/
├── main.dart
```

---

# Core Layer

Contains application-wide utilities and shared infrastructure.

```text
core/
├── database/
├── network/
├── constants/
├── utils/
```

### Responsibilities

- SQLite configuration
- API clients (Strava)
- Global constants
- Helper functions

---

# Shared Layer

Reusable components used across multiple features.

```text
shared/
├── widgets/
├── models/
├── services/
```

### Examples

- Buttons
- Charts
- Loading indicators
- Common models

---

# Features Layer

Each feature is isolated and self-contained.

```text
features/
├── workout/
├── endurance/
├── strength/
├── goals/
├── profile/
├── strava/
```

---

## Feature Structure Example

Each feature follows the same structure:

```text
workout/
├── data/
│   ├── models/
│   ├── repositories/
│   ├── datasources/
│
├── domain/
│   ├── entities/
│   ├── usecases/
│
├── presentation/
│   ├── screens/
│   ├── widgets/
│   ├── controllers/
```

---

# Feature Responsibilities

## Data Layer

- SQLite operations
- API communication
- Data mapping

## Domain Layer

- Business logic
- Entities
- Use cases

## Presentation Layer

- UI screens
- State management
- User interaction

---

# Example Features

## Workout Feature

Handles general training sessions.

## Endurance Feature

Handles:

- Running
- Cycling
- Trail

## Strength Feature

Handles:

- Exercises
- Sets
- Repetitions
- Weight tracking

## Strava Feature

Handles:

- OAuth authentication
- Activity import
- Synchronization

---

# State Management

The project will use:

```text id="q2m8zv"
Provider / Riverpod (recommended)
```

Reason:

- Lightweight
- Easy to maintain
- Good for MVP
- Scales well enough for future features

---

# Data Flow

```text
UI (Presentation)
   ↓
Controller / State
   ↓
Use Cases (Domain)
   ↓
Repositories
   ↓
SQLite / API
```

---

# Benefits of This Structure

- Clear separation of concerns
- Easy scalability
- Independent features
- Easy testing
- Suitable for TFG evaluation
- Supports future growth (cloud, social features)

---

# Future Improvements

If the project grows:

- Migration to full Clean Architecture
- Introduction of dependency injection (GetIt / Riverpod providers)
- Modularization per feature package

---

# Conclusion

This structure ensures a maintainable, scalable and testable Flutter application while keeping complexity low for MVP development.