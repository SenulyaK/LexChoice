# LexChoice

LexChoice is a gamified mobile application designed to educate children about the laws of their country through interactive storytelling. The app presents real-life scenarios where players make choices, learn legal consequences, and understand their rights in an engaging way.


## Features

Interactive Storytelling: Users play through legal scenarios and make choices that impact the story.

Educational Content: Laws are explained in a simple, engaging manner for kids.

Feedback System: Users will be given a feedback based on how they performed.

Scoring Mechanism: Tracks user progress based on correct legal decisions.

Platform: Available on Android.

## Technology Stack

Frontend: Flutter

Backend: Spring Boot

Database: MySQL

API Communication: REST API

## Installation

Prerequisites

Flutter installed 

Java and Spring Boot setup for backend development

MySQL installed and configured

JWT token for authentication.

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

Launch the app and create an account.

Choose a story scenario and make decisions.

Track progress and view scores.

Provide feedback through the app.

## Database Setup

MySQL Database is used for storing feedback and user data.

Configure database details in the application.properties file of the backend.

Run migration scripts provided in the db/ folder.

