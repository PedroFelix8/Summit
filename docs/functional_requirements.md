# Functional Requirements

## Introduction

This document defines the functional requirements of the Sport Tracker application.

Functional requirements describe the features and actions that the system must provide to users.

The application focuses on personal training management, supporting both endurance activities and strength training.

---

# User Management

## FR-01 - Create User Profile

The system shall allow users to create a basic personal profile.

The profile should contain:

- Name or nickname
- Preferred sports
- Training preferences

---

## FR-02 - View User Profile

The system shall allow users to view and edit their personal information.

---

# Training Management

## FR-03 - Register Training Session

The system shall allow users to manually register a training session.

A training session should include:

- Date
- Training type
- Duration
- Notes

Training types include:

- Endurance training
- Strength training

---

## FR-04 - Store Training Sessions

The system shall store training sessions locally on the device using SQLite.

The stored information should be available without an internet connection.

---

## FR-05 - View Training History

The system shall allow users to access previous training sessions.

Users should be able to view:

- Date
- Training type
- Duration
- Performance information

---

## FR-06 - View Training Details

The system shall display detailed information about a selected training session.

---

# Endurance Training

## FR-07 - Register Endurance Activity

The system shall allow users to record endurance activities.

Supported activities may include:

- Running
- Cycling
- Trail running
- Other endurance sports

The activity should include:

- Distance
- Duration
- Pace
- Elevation

---

# Strength Training

## FR-08 - Register Strength Workout

The system shall allow users to record gym-based workouts.

A strength workout should contain:

- Workout date
- Training duration
- Notes

---

## FR-09 - Register Exercises

The system shall allow users to add exercises to a strength workout.

Each exercise should include:

- Exercise name
- Muscle group
- Weight used
- Number of sets
- Number of repetitions

---

## FR-10 - Track Exercise Progress

The system shall allow users to compare exercise performance over time.

Examples:

- Weight progression
- Repetition progression
- Training volume evolution

---

# Statistics

## FR-11 - Display Performance Statistics

The system shall calculate and display basic training statistics.

Examples:

- Total training sessions
- Total training time
- Total distance
- Number of strength workouts

---

## FR-12 - Display Training Progress

The system should allow users to visualize changes in their performance.

Examples:

- Endurance activity evolution
- Strength improvement
- Training frequency

---

# Goals

## FR-13 - Create Personal Goals

The system should allow users to define personal objectives.

Examples:

- Weekly running distance
- Monthly training sessions
- Strength goals

---

## FR-14 - Track Goal Progress

The system should display progress towards personal goals.

---

# Strava Integration

## FR-15 - Connect Strava Account

The system shall allow users to connect their Strava account.

The authentication process shall use OAuth 2.0.

---

## FR-16 - Import Strava Activities

The system shall retrieve activities from Strava.

Imported information should include:

- Activity type
- Distance
- Duration
- Pace
- Elevation
- Date

---

## FR-17 - Synchronize External Activities

The system shall store imported Strava activities locally.

---

# MVP Scope

The following requirements are included in the MVP:

- User profile
- Manual training registration
- Endurance activity tracking
- Strength workout tracking
- Exercise registration
- Sets and repetitions tracking
- Training history
- Basic statistics
- SQLite local storage
- Strava integration

The following requirements are postponed:

- Social features
- Chat
- Global rankings
- Payments
- Cloud synchronization
- Advanced coaching features