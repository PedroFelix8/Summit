# Git Workflow

## Overview

This document defines the version control workflow used during the development of the Sport Tracker project.

The objective is to maintain an organized development process, track changes and keep the project history clear.

---

# Branch Strategy

The project uses a simplified Git workflow.

## Main Branch

Branch: 
main

Purpose:

- Contains stable versions of the project.
- Only includes tested and working code.
- Represents the release version.

---

## Feature Branches

New features are developed using separate branches.

Naming convention:
feature/<feature-name>

Examples:
feature/user-profile
feature/sqlite-database
feature/strava-integration


Workflow:

1. Create a feature branch from main.
2. Develop the functionality.
3. Test the changes.
4. Merge into main.

---

## Bug Fix Branches

Bug fixes use:
bugfix/<bug-name>

Examples:
bugfix/database-error
bugfix/login-crash


---

# Commit Convention

Commits should be short and descriptive.

Format:
type: description


## Commit Types

### feature

New functionality.

Example:
feature: correct activity database query


### docs

Documentation changes.

Example:
docs: update architecture documentation


### refactor

Code restructuring.

Example:
refactor repository structure


---

# Issue Workflow

All tasks are managed through GitHub Issues.

Each issue should include:

- Description
- Objective
- Acceptance criteria
- Related milestone
- Appropriate labels

---

## Issue Lifecycle

1. Issue created

Status:
Backlog


2. Work starts

Status:
In progress


3. Task completed

Status:
Review


4. Verified

Status:
Done


---

# Pull Requests

Changes should be reviewed before merging.

For this project, pull requests will be used when:

- A feature is completed.
- A significant change is introduced.

---

# Version Tags

Releases will use semantic versioning.

Format:
v<major>.<minor>.<patch>

Examples:
v0.1.0
v1.0.0