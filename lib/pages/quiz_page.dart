// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question.dart';

class QuizPage extends StatefulWidget {
  final String subjectName;

  const QuizPage({
    super.key,
    required this.subjectName,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = []; // Stores the questions based on the subject
  int currentQuestionIndex = 0; // Tracks which question is being displayed
  bool? isCorrect; // Tracks if the user's answer is correct
  bool isAnswered = false; // Tracks if the question is answered

  @override
  void initState() {
    super.initState();

    // Load questions based on the subject name
    if (widget.subjectName == "Maths") {
      questions = mathsQuestions;
    } else if (widget.subjectName == "Physics") {
      questions = physicsQuestions;
    }
  }

  // Check if the selected answer is correct
  void checkAnswer(int selectedIndex) {
    setState(() {
      isCorrect =
          selectedIndex == questions[currentQuestionIndex].correctAnswerIndex;
      isAnswered = true;
    });
  }

  // Move to the next question
  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      isCorrect = null;
      isAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text("${widget.subjectName} Quiz"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quiz Complete!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Go Back"),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.subjectName} Quiz"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 20),

            Text(
              currentQuestion.questionText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 20),
            
            ...List.generate(
              currentQuestion.options.length,
              (index) => GestureDetector(
                onTap: isAnswered ? null : () => checkAnswer(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isAnswered
                        ? (index == currentQuestion.correctAnswerIndex
                            ? Colors.green
                            : (index == isCorrect && isCorrect == false
                                ? Colors.red
                                : Theme.of(context).colorScheme.surface))
                        : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text(currentQuestion.options[index]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (isAnswered)
              ElevatedButton(
                onPressed: nextQuestion,
                child: const Text("Next"),
              ),
          ],
        ),
      ),
    );
  }
}
