import 'Question.dart';

class QuizCategory {
  final String title;
  final List<Question> questions;

  QuizCategory({
    required this.title,
    required this.questions,
  });
}
