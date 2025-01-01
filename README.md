# Chatbot Support System

## Overview
This repository contains a chatbot support system built using PHP, HTML, CSS, and JavaScript. It includes a database for frequently asked questions (FAQ) and logs unanswered questions to improve its knowledge base.

## Features
- **Dynamic Chat Interface:** A user-friendly chat interface for interaction.
- **FAQ System:** Predefined answers for common questions.
- **Similarity Matching:** Finds the best match for user questions based on text similarity.
- **Unanswered Question Logging:** Logs questions without answers to improve the database.
- **Admin Management:** Allows adding new questions and answers.

## Requirements
- **PHP:** Version 8.3 or higher.
- **Database:** MariaDB or MySQL.
- **Web Server:** Apache or Nginx.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/newtonaltnetter/chatbot-php.git
   ```
2. Import the database schema from `database.sql` into your database system.
3. Configure database credentials in `chatbot.php`:
   ```php
   $host = 'localhost';
   $dbname = 'chatbot';
   $user = 'root';
   $password = '';
   ```
4. Deploy the project files to your web server.
5. Access the application through your browser.

## Database Schema
### `faq` Table
- `id`: Primary key (Auto Increment)
- `question`: Original question text
- `normalized_question`: Pre-processed question text for matching
- `answer`: Stored answer

### `log_questions` Table
- `id`: Primary key (Auto Increment)
- `question`: User question logged
- `date`: Timestamp when the question was logged

## Usage
- **Ask Questions:** Users can type questions in the input box and receive answers in real-time.
- **Add Questions:** Admins can add new questions and answers using the backend endpoint.
- **Improve Database:** Analyze logs of unanswered questions to enhance the FAQ database.

## Endpoints
- **Search Answer:**
  - URL: `chatbot.php`
  - Method: `POST`
  - Parameters:
    - `action`: 'search'
    - `question`: User's question
  - Response:
    ```json
    { "answer": "Response text" }
    ```
- **Register Question:**
  - URL: `chatbot.php`
  - Method: `POST`
  - Parameters:
    - `action`: 'register'
    - `question`: New question
    - `answer`: Answer for the question
  - Response:
    ```json
    { "message": "Question successfully registered!" }
    ```

## Author
- **Name:** Newton Guilherme Altnetter


---
Feel free to contribute or report issues!

