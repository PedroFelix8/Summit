# SUMMIT --- PRODUCT SPECIFICATION

## 1. PRODUCT VISION

Summit is a high-performance personal development and fitness tracking
application designed around progression, discipline, and consistency.

The user experience is modeled as a "mountain ascent", where daily
actions contribute to long-term growth (XP, levels, streaks, and
completion of objectives).

Core principles: - minimal cognitive load - action-first design -
visible progression feedback - consistency reinforcement over motivation

------------------------------------------------------------------------

## 2. APP ARCHITECTURE

### Global Navigation

-   Home
-   Plan
-   Training
-   Progress
-   Profile

### System Loops

#### Action Loop

Home → Training → Completion → XP update → Home

#### Discipline Loop

Home → Daily Objective → Completion → streak update

#### Growth Loop

Home → Progress → Analytics → level evolution

------------------------------------------------------------------------

## 3. CORE DATA MODELS

### User

-   name
-   level
-   XP current
-   XP required
-   streak

### Training Session

-   type
-   duration
-   status (pending / active / completed)
-   XP reward

### Daily Objective

-   title
-   description
-   status
-   linked training session

### Progress Metrics

-   weekly sessions
-   streak days
-   weekly completion %

------------------------------------------------------------------------

## 4. SCREEN SPECIFICATIONS

### HOME --- Dashboard

Purpose: Central hub of daily action and system status.

Layout: - user header + notifications - XP level bar - daily objective
(primary focus) - start training CTA - weekly progress summary - bottom
navigation

Primary Action: Start Training

------------------------------------------------------------------------

### PRE-TRAINING

Purpose: Confirm and prepare training session.

Layout: - training overview - start button

------------------------------------------------------------------------

### TRAINING SESSION

Purpose: Execute training in real time.

Layout: - session title - current exercise/task - progress indicator -
action controls (complete / pause / skip)

------------------------------------------------------------------------

### COMPLETION SCREEN

Purpose: Reward completion and reinforce progress.

Layout: - completion confirmation - XP gained - level progress update -
streak update

------------------------------------------------------------------------

### DAILY OBJECTIVE

Purpose: Define and manage daily mission.

Layout: - objective title - description - status - link to training

------------------------------------------------------------------------

### PROGRESS (SUMMARY)

Purpose: Motivation via weekly feedback.

Layout: - streak - weekly sessions - completion %

------------------------------------------------------------------------

### PROGRESS (DETAIL)

Purpose: Long-term analytics.

Layout: - XP evolution - training history - level progression

------------------------------------------------------------------------

### PLAN

Purpose: Future structure of goals.

Layout: - weekly plan - objectives list

------------------------------------------------------------------------

### PROFILE

Purpose: User management.

Layout: - user data - settings - stats overview

------------------------------------------------------------------------

## 5. UI RULES

-   Home is the only decision-critical screen
-   Training session must have zero distractions
-   XP feedback must be immediate after completion
-   Navigation is always persistent
-   Progress is always secondary to action
