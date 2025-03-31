# LexChoice

LexChoice is a gamified mobile application designed to educate children about the laws of their country through interactive storytelling. The app presents real-life scenarios where players make choices, learn legal consequences, and understand their rights in an engaging way.


## Features

Interactive Storytelling: Users play through legal scenarios and make choices that impact the story.

Educational Content: Laws are explained in a simple, engaging manner for kids.

Feedback System: Users can submit feedback through the app.

Scoring Mechanism: Tracks user progress based on correct legal decisions.

Multi-Platform: Available on Android and iOS.

## Technology Stack

Frontend: Flutter

Backend: Spring Boot (for feedback system)

Database: MySQL

Cloud Storage: Firebase (for assets and authentication)

API Communication: REST API

## Installation

Prerequisites

Flutter installed (Installation Guide)

Java and Spring Boot setup for backend development

MySQL installed and configured

Firebase account for authentication and storage

Steps

Clone the repository:

git clone https://github.com/your-org/LexChoice.git
cd LexChoice

Set up the backend:

cd Feedback_backend
mvn spring-boot:run

Set up the database:

Import the schema.sql file into MySQL.

Configure database credentials in application.properties.

Set up the frontend:

cd frontend
flutter pub get
flutter run

## Usage

Launch the app and create an account using Firebase authentication.

Choose a story scenario and make decisions.

Track progress and view scores.

Provide feedback through the app.

Database Setup

MySQL Database is used for storing feedback and user data.

Configure database details in the application.properties file of the backend.

Run migration scripts provided in the db/ folder.

## API Endpoints

Method

Endpoint

Description

GET

/feedback

Fetch all feedback entries

POST

/feedback

Submit new feedback

GET

/score/{userId}

Get user score

Contributing

Fork the repository.

Create a new branch (git checkout -b feature-branch).

Commit your changes (git commit -m "Add new feature").

Push to the branch (git push origin feature-branch).

Open a Pull Request.

## Contact

For any inquiries, reach out to us at:

Email: support@lexchoice.com

GitHub Issues: LexChoice Repository
