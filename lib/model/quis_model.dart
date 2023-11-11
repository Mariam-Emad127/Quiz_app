

class QuizModel {
  final int id;
  final String word;
  final String pos;

  QuizModel({required this.id, required this.word, required this.pos});

  // factory QuizModel.fromJsion(Map<String, dynamic> json) {
  //   return QuizModel(id: json["id"], word: json["word"], pos: json["pos"]);
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data["word"] = this.word;
  //   data["pos"] = this.pos;
  //   return data;
  // }
}
