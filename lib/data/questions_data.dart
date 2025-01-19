import '../models/question.dart';

final List<Question> mathsQuestions = [
  Question(
    questionText: "What is 1 + 1?",
    options: ["1", "2", "3", "4"],
    correctAnswerIndex: 1, // "2"
    questionType: "multipleChoice",
  ),
  Question(
    questionText: "What is the square root of 16?",
    options: ["2", "3", "4", "5"],
    correctAnswerIndex: 2, // "4"
    questionType: "multipleChoice",
  ),
];

final List<Question> physicsQuestions = [
  Question(
    questionText: "An object with a greater mass will always accelerate faster than an object with a smaller mass when the same force is applied to both. True or False?",
    options: ["True", "False"],
    correctAnswerIndex: 1, // "False"
    questionType: "trueFalse",
  ),
  Question(
    questionText: "What is the SI unit of force?",
    options: ["Newton", "Pascal", "Joule", "Watt"],
    correctAnswerIndex: 0, // "Newton"
    questionType: "multipleChoice",
  ),
];
