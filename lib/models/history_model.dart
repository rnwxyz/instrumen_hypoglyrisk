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

  HistoryModel({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.rm,
    required this.apoteker,
    required this.date,
    required this.scoreA,
    required this.scoreB,
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
    };
  }
}
