class Mcq{
  final int id;
  final String question;
  final List<String> options;
  final int correctOptionId;

  Mcq({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionId,
  });
}