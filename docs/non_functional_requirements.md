# Non-Functional Requirements

## Introduction

This document defines the non-functional requirements of the Sport Tracker application.

Non-functional requirements describe quality attributes, constraints and technical characteristics of the system.

---

# NFR-01 - Usability

The application shall provide an intuitive and easy-to-use interface.

Users should be able to:

- Register workouts with minimal effort.
- Access training history quickly.
- Navigate between screens without complexity.

---

# NFR-02 - Performance

The application shall provide acceptable performance on modern mobile devices.

The system should:

- Load screens in less than 2 seconds.
- Store and retrieve local data efficiently.
- Handle large training histories without significant degradation.

---

# NFR-03 - Offline Availability

The application shall operate without an internet connection.

Users must be able to:

- View stored workouts.
- Register new workouts.
- Access statistics.

Internet access is only required for Strava synchronization.

---

# NFR-04 - Reliability

The application shall ensure data consistency and integrity.

The system should:

- Prevent data corruption.
- Recover gracefully from unexpected failures.
- Validate user input before storage.

---

# NFR-05 - Maintainability

The application shall follow a modular architecture.

The codebase should:

- Be organized into logical layers.
- Follow Flutter development best practices.
- Be easy to extend and modify.

---

# NFR-06 - Scalability

The architecture shall support future growth.

Potential future extensions include:

- Cloud synchronization
- Social features
- Advanced analytics
- Additional third-party integrations

The MVP should not prevent these future developments.

---

# NFR-07 - Portability

The application shall be compatible with:

- Android
- iOS

A single Flutter codebase shall be used whenever possible.

---

# NFR-08 - Security

The application shall protect user information.

The system should:

- Store authentication tokens securely.
- Use OAuth 2.0 for Strava authentication.
- Avoid exposing sensitive information.

---

# NFR-09 - Cost Efficiency

The MVP shall minimize operational costs.

Requirements:

- No backend servers.
- No cloud databases.
- No mandatory monthly subscriptions.

The target operational cost is approximately 0€ per month.

---

# NFR-10 - Data Persistence

The application shall store user information locally using SQLite.

Stored information includes:

- User profile
- Endurance activities
- Strength workouts
- Exercises
- Goals

Data should remain available between application sessions.

---

# NFR-11 - Compatibility

The application should support a wide range of Android devices.

The MVP will prioritize Android deployment.

iOS compatibility should be maintained through Flutter.

---

# Conclusion

The Sport Tracker application prioritizes usability, low operational cost, offline availability and maintainability while providing a scalable foundation for future improvements.