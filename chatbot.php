<?php
// Database configuration
$host = 'localhost';
$dbname = 'chatbot';
$user = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4"
    ]);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection error: " . $e->getMessage());
}


// Function to normalize text (remove accents, special characters, and convert to lowercase)
function normalizeText($text) {
    // Convert to lowercase
    $text = strtolower($text);

    // Remove accents
    $text = preg_replace('/[áàãâä]/u', 'a', $text);
    $text = preg_replace('/[éèêë]/u', 'e', $text);
    $text = preg_replace('/[íìîï]/u', 'i', $text);
    $text = preg_replace('/[óòõôö]/u', 'o', $text);
    $text = preg_replace('/[úùûü]/u', 'u', $text);
    $text = preg_replace('/[ç]/u', 'c', $text);

    // Remove special characters
    $text = preg_replace('/[^a-z0-9\s]/', '', $text);

    // Return normalized text
    return trim($text);
}

function registerQuestion($question, $answer, $pdo) {
    // Normalize the question
    $normalizedQuestion = normalizeText($question);

    // Check if a similar question already exists
    $stmt = $pdo->prepare("SELECT id FROM faq WHERE normalized_question = :normalized_question");
    $stmt->execute([':normalized_question' => $normalizedQuestion]);
    $existing = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($existing) {
        return "The question already exists in the database.";
    }

    // Insert the new question into the database
    $stmt = $pdo->prepare("INSERT INTO faq (question, normalized_question, answer) VALUES (:question, :normalized_question, :answer)");
    $stmt->execute([
        ':question' => $question,
        ':normalized_question' => $normalizedQuestion,
        ':answer' => $answer,
    ]);

    return "Question successfully registered!";
}


function searchAnswer($userQuestion, $pdo) {
    // Normalize the user's question
    $normalizedQuestion = normalizeText($userQuestion);

    // Search all questions in the database, including the normalized field
    $stmt = $pdo->query("SELECT question, normalized_question, answer FROM faq");
    $faq = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $bestAnswer = null;
    $highestSimilarity = 0;

    foreach ($faq as $item) {
        // Ensure the 'normalized_question' field exists before using it
        if (isset($item['normalized_question'])) {
            similar_text($normalizedQuestion, $item['normalized_question'], $percentage);

            if ($percentage > $highestSimilarity) {
                $highestSimilarity = $percentage;
                $bestAnswer = $item['answer'];
            }
        }
    }

    // Define an acceptable similarity threshold
    if ($highestSimilarity > 50) {
        return $bestAnswer;
    } else {
        saveQuestionToLog($userQuestion, $pdo);
        return 'Sorry, I could not find an answer to your question.';
    }
}

// Function to save unanswered questions to the log
function saveQuestionToLog($question, $pdo) {
    $stmt = $pdo->prepare("INSERT INTO log_questions (question) VALUES (:question)");
    $stmt->execute([':question' => $question]);
}

// Process POST requests to search or register questions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'register') {
        // Register question
        $question = $_POST['question'] ?? '';
        $answer = $_POST['answer'] ?? '';

        if (!empty($question) && !empty($answer)) {
            echo json_encode(['message' => registerQuestion($question, $answer, $pdo)]);
        } else {
            echo json_encode(['message' => 'Question and answer cannot be empty.']);
        }
    } elseif ($action === 'search') {
        // Search for an answer
        $userQuestion = $_POST['question'] ?? '';
        if (!empty($userQuestion)) {
            echo json_encode(['answer' => searchAnswer($userQuestion, $pdo)]);
        } else {
            echo json_encode(['answer' => 'Please type your question.']);
        }
    }
}
?>
