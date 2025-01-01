
--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `normalized_question` text NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `normalized_question`, `answer`) VALUES
(1, 'How do I log in?', 'how do i log in', 'Click the button in the upper-right corner to access your account.'),
(2, 'I forgot my password, what should I do?', 'i forgot my password what should i do', 'Click on \"Forgot your password?\" and follow the instructions to reset it.'),
(3, 'Where can I see my purchase history?', 'where can i see my purchase history', 'You can access the purchase history in the \"My Account\" menu.'),
(4, 'How do I change my email?', 'how do i change my email', 'Go to your account settings and edit the email field.'),
(5, 'What payment methods do you accept?', 'what payment methods do you accept', 'We accept credit cards, bank slips, and Pix.'),
(6, 'Hi', 'hi', 'Hello! How can I assist you today?'),
(7, 'Hello', 'hello', 'Hi! Nice to talk to you. What do you need to know?'),
(8, 'How are you?', 'how are you', 'I’m here to help! And you, how are you?'),
(9, 'Who are you?', 'who are you', 'I’m a virtual assistant. I’m here to help with whatever you need!'),
(10, 'What do you do?', 'what do you do', 'I answer your questions and try to make your experience easier.'),
(11, 'Are you a robot?', 'are you a robot', 'Yes, but I was created to feel as human as possible. 😊'),
(12, 'How are you feeling?', 'how are you feeling', 'I’m great! And you, how are you?'),
(13, 'What can you do?', 'what can you do', 'I can answer questions about the site, guide you, and have a quick chat!'),
(14, 'What can I call you?', 'what can i call you', 'You can call me Virtual Assistant, or just Assistant.'),
(15, 'Hi, how are you?', 'hi how are you', 'Hi! I’m great, and you?'),
(16, 'Can you help me?', 'can you help me', 'Of course! That’s what I’m here for. What’s your question?'),
(17, 'How does this work?', 'how does this work', 'Explain better what you need, and I’ll help.'),
(18, 'What do you recommend?', 'what do you recommend', 'It depends on what you’re looking for! Tell me more.'),
(19, 'Do you like helping?', 'do you like helping', 'I love helping! Tell me what you need.'),
(20, 'Where are you from?', 'where are you from', 'I’m a virtual creation, but I feel at home here in your browser.'),
(21, 'How old are you?', 'how old are you', 'I’m as young as the technology that created me. 😊'),
(22, 'Are you smart?', 'are you smart', 'I try to be! I’m here to learn and help the best way I can.'),
(23, 'What is your purpose?', 'what is your purpose', 'My purpose is to make your experience simpler and more enjoyable.'),
(24, 'What do you know about me?', 'what do you know about me', 'I only know what you share with me during our conversation.'),
(25, 'Can you chat with me?', 'can you chat with me', 'Sure! I’m always ready for a good chat. 😊');

-- --------------------------------------------------------

--
-- Table structure for table `log_questions`
--

DROP TABLE IF EXISTS `log_questions`;
CREATE TABLE IF NOT EXISTS `log_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
