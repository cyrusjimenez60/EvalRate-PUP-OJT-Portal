# EvalRate PUP OJT Portal

EvalRate is a database schema design and normalization project developed for our Information Management course, focused on practicing and improving data definition and manipulation skills using MariaDB.

## Overview

The project centers around designing a normalized relational database for an On-the-Job Training (OJT) evaluation system. It models the relationships between supervisors, interns, host training establishments, and intern advisers/instructors, with the ability to track the status of a student's practicum throughout their OJT period.

A basic front-end (HTML/CSS) was also developed as a supporting interface, connected to the database using Python Flask. This front-end primarily handles user registration across all user types, serving to verify that the database schema integrates properly with a live application layer.

## Purpose

This project is **not intended to be a fully finished system**. Its primary goal is to demonstrate solid database design principles, including normalization, relationships, and schema structure — with the front-end connection serving only as a proof-of-concept to confirm that the database works correctly when interfaced with an external application.

## Entity-Relationship Diagram (ERD)

Click the link below to view the ERD of the database schema:
[ERD - Internship Evaluation System](database/ERD%20-%20Internship%20Evaluation%20System.png)

## Key Components

- **Database (MariaDB)** — Normalized schema covering entities such as Interns, Supervisors, Host Training Establishments, Advisers/Instructors, and OJT Status Tracking.
- **Front-End (HTML/CSS)** — Basic interface for user registration across different user roles.
- **Back-End (Python Flask)** — Connects the front-end to the MariaDB database, handling data flow between the interface and the schema.

## Status

This repository is complete in terms of its purpose: a working, normalized database schema paired with a minimal front-end to confirm functional connectivity. It is not being actively developed further beyond this scope.
