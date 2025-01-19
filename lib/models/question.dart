class Question {
  final String questionText; // e.g., "What is 1 + 1?"
  final List<String> options; // e.g., ["1", "2", "3", "4"]
  final int correctAnswerIndex; // e.g., 1
  final String questionType; // e.g., "multipleChoice", "trueFalse"

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.questionType,
  });
}
