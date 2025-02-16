class HistoryModel {
  int? id;
  late String name;
  late String gender;
  late int age;
  late String rm;
  late String apoteker;
  DateTime? date;
  late int scoreA;
  late int scoreB;
  late int scoreA1;
  late int scoreA2;
  late int scoreA3;
  late int scoreA4;
  late int scoreA5;
  late int scoreA6;
  late int scoreA7;
  late int scoreA8;
  late int scoreB1;
  late int scoreB2;
  late int scoreB3;
  late int scoreB4;
  late int scoreB5;
  late int scoreB6;
  late int scoreB7;
  late int scoreB8;

  HistoryModel({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.rm,
    required this.apoteker,
    required this.date,
    required this.scoreA,
    required this.scoreA1,
    required this.scoreA2,
    required this.scoreA3,
    required this.scoreA4,
    required this.scoreA5,
    required this.scoreA6,
    required this.scoreA7,
    required this.scoreA8,
    required this.scoreB,
    required this.scoreB1,
    required this.scoreB2,
    required this.scoreB3,
    required this.scoreB4,
    required this.scoreB5,
    required this.scoreB6,
    required this.scoreB7,
    required this.scoreB8,
  });

  HistoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    gender = map['gender'];
    age = map['age'];
    rm = map['rm'];
    apoteker = map['apoteker'];
    date = DateTime.parse(map['date']);
    scoreA = map['score_a'];
    scoreB = map['score_b'];
    scoreA1 = map['score_a1'];
    scoreA2 = map['score_a2'];
    scoreA3 = map['score_a3'];
    scoreA4 = map['score_a4'];
    scoreA5 = map['score_a5'];
    scoreA6 = map['score_a6'];
    scoreA7 = map['score_a7'];
    scoreA8 = map['score_a8'];
    scoreB1 = map['score_b1'];
    scoreB2 = map['score_b2'];
    scoreB3 = map['score_b3'];
    scoreB4 = map['score_b4'];
    scoreB5 = map['score_b5'];
    scoreB6 = map['score_b6'];
    scoreB7 = map['score_b7'];
    scoreB8 = map['score_b8'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'rm': rm,
      'apoteker': apoteker,
      'date': date.toString(),
      'score_a': scoreA,
      'score_b': scoreB,
      'score_a1': scoreA1,
      'score_a2': scoreA2,
      'score_a3': scoreA3,
      'score_a4': scoreA4,
      'score_a5': scoreA5,
      'score_a6': scoreA6,
      'score_a7': scoreA7,
      'score_a8': scoreA8,
      'score_b1': scoreB1,
      'score_b2': scoreB2,
      'score_b3': scoreB3,
      'score_b4': scoreB4,
      'score_b5': scoreB5,
      'score_b6': scoreB6,
      'score_b7': scoreB7,
      'score_b8': scoreB8,
    };
  }
}
