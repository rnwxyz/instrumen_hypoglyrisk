class QuestionModel {
  final int id;
  final String question;
  final int score;
  final bool isYes;
  final String description;
  int? answer;
  QuestionModel({
    required this.id,
    required this.question,
    required this.score,
    required this.isYes,
    required this.description,
    required this.answer,
  });
}
