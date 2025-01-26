<h1>TestYourKnowledge</h1>
TestYourKnowledge is a Flutter-based mobile application designed to help users test their knowledge on medical-related topics, such as those encountered in the NEET (National Eligibility cum Entrance Test) exam. The app fetches multiple-choice medical questions from an API and allows users to navigate through them. It records the answers, calculates a final score based on the NEET marking scheme (+4 for correct answers, -1 for incorrect answers, and 0 for unanswered questions), and provides a detailed result at the end of the quiz.

Features
Medical Questions: The app fetches a set of medical-related questions from an online API.
Navigation Between Questions: Users can navigate back and forth through the questions to review and change their answers.
NEET Marking Scheme: The app calculates the score based on the NEET exam marking scheme:
+4 for each correct answer
-1 for each incorrect answer
0 for unanswered questions
Interactive UI: A clean, easy-to-use interface for answering questions.
Final Result: After completing the quiz, users receive a final score, showing their performance based on the number of correct and incorrect answers.
How It Works
Data Fetching: The app fetches a set of questions from the API at startup.
Question Navigation: Users can navigate through the questions using previous and next buttons. The answers are recorded as users move through the quiz.
Answer Selection: For each question, users can select an answer from multiple choices. Once selected, the answer is saved for scoring.
Final Score Calculation: After the user has completed the quiz, the app calculates the score based on the NEET marking scheme.
+4 for each correct answer
-1 for each incorrect answer
0 for unanswered questions.
Result Display: At the end of the quiz, a result screen shows the total score and detailed breakdown.
API
Questions are fetched from the following API:

API URL: https://api.jsonserve.com/Uw5CrX
The API provides an array of questions in JSON format, including:
question: The text of the question.
options: A list of possible answers.
correct_answer: The correct answer option.
Requirements
Flutter SDK: Version 3.0 or higher
Dart: Version 2.0 or higher
Internet Connection: Required to fetch questions from the API.
Installation
Clone this repository:

bash
Copy
Edit
git clone [https://github.com/sayyedmaaz23/KnowItTest.git](https://github.com/sayyedmaaz23/KnowItTest.git
)
Navigate to the project directory:

bash
Copy
Edit
cd testyourknowledge
Install the dependencies:

bash
Copy
Edit
flutter pub get
Run the application:

bash
Copy
Edit
flutter run
Screenshots & Videos
Here are some media links to give you an idea of the app's interface and functionality:
<br>
[Screenshot 1](https://drive.google.com/file/d/1RZMi5Q1hLRmQTw96R2cpimJxD3SPLAY4/view?usp=drive_link)<br>
[Screenshot 2](https://drive.google.com/file/d/1RYi5t_dKnFLZ96VnmcqaEWhXD-0U5Nig/view?usp=drive_link)<br>
[Screenshot 3](https://drive.google.com/file/d/1RX9mNyzpSaUM0oAuw7TQoymLmu2yC3cc/view?usp=drive_link)<br>
[Screenshot 4](https://drive.google.com/file/d/1RTMxtX14PrptkPcf4qsGYobcG3_sllbu/view?usp=drive_link)<br>
[Video](https://drive.google.com/file/d/1RQmZgIR1tvpgZ39k70BPkfJyjLFyxBCI/view?usp=drive_link) <br>
Feel free to explore these links for a better understanding of the app’s interface and experience.

Contributing
Contributions are welcome! If you find bugs or have suggestions for new features, feel free to open an issue or submit a pull request.

License
This project is open-source and available under the MIT License.
