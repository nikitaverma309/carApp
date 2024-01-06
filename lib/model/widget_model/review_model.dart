class ReviewModel {
  final String comment;
  final int rating;
  final String name;
  final DateTime time;

  ReviewModel(
      {required this.name,
      required this.comment,
      required this.rating,
      required this.time});
}


