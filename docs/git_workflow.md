# Git Workflow

## Overview

This document defines the version control workflow used during the development of the Sport Tracker project.

The objective is to maintain an organized development process, track changes and keep the project history clear.

---

# Branch Strategy

The project uses a simplified Git workflow.

## Main Branch

Branch:

```bash
main
```

Purpose:

- Contains stable versions of the project.
- Includes tested and working code.
- Represents the release version.

---

## Feature Branches

New features are developed using separate branches.

Naming convention:

```bash
feature/feature-name
```

Examples:

```bash
feature/user-profile
feature/sqlite-database
feature/strava-integration
```

Workflow:

1. Create a feature branch from `main`.
2. Develop the functionality.
3. Test the changes.
4. Merge into `main`.

---

## Direct commits

Small documentation changes or minor fixes may be committed directly to the main branch when creating a separate branch would add unnecessary overhead.

Examples:

- Typo corrections
- Markdown formatting fixes
- Documentation improvements

---

## Bug Fix Branches

Bug fixes use:

```bash
bugfix/bug-name
```

Examples:

```bash
bugfix/database-error
bugfix/login-crash
```

---

# Commit Convention

Commits should be short, clear and descriptive.

Format:

```bash
type: description
```

## Commit Types

### feature

Used for new functionality.

Example:

```bash
feature: add training registration form
```

---

### fix

Used for bug corrections.

Example:

```bash
fix: correct activity database query
```

---

### docs

Used for documentation changes.

Example:

```bash
docs: update architecture documentation
```

---

### refactor

Used for code restructuring without adding new functionality.

Example:

```bash
refactor: improve repository structure
```

---

# Issue Workflow

All tasks are managed through GitHub Issues.

Each issue should include:

- Description
- Tasks
- Acceptance criteria
- Related milestone
- Appropriate labels

---

## Issue Lifecycle

### Backlog

The issue has been created but work has not started.

```text
Backlog
```

---

### In Progress

Development has started.

```text
In Progress
```

---

### Review

The task has been completed and is being checked.

```text
Review
```

---

### Done

The task has been verified and completed.

```text
Done
```

---

# Pull Requests

Changes should be reviewed before being merged.

Pull requests will be used for:

- Completed features.
- Important changes.
- Code review before merging into `main`.

---

# Versioning

The project uses semantic versioning.

Format:

```text
vX.Y.Z
```

Where:

- `X` represents major changes.
- `Y` represents new features.
- `Z` represents bug fixes or small improvements.

Examples:

```text
v0.1.0
v1.0.0
```

---

# Development Workflow

The general workflow is:

```text
Create Issue
      |
      v
Create Branch
      |
      v
Develop Feature
      |
      v
Test Changes
      |
      v
Commit Changes
      |
      v
Merge into main
      |
      v
Close Issue
```