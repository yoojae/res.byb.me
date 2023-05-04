import 'dart:convert';

ConditionModel datumListFromJson(String str) => ConditionModel.fromJson(json.decode(str));

String conditionModelToJson(ConditionModel data) => json.encode(data.toJson());

class ConditionModel {
  int status;
  bool success;
  String message;
  List<Datum> data;

  ConditionModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int diagnosisId;
  int id;
  String question;
  String questionExplanation;
  QuestionType questionType;
  int questionSortNumber;
  dynamic mbtiCategory;
  List<QuestionItemArray> questionItemArray;

  Datum({
    required this.diagnosisId,
    required this.id,
    required this.question,
    required this.questionExplanation,
    required this.questionType,
    required this.questionSortNumber,
    this.mbtiCategory,
    required this.questionItemArray,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    diagnosisId: json["diagnosis_id"],
    id: json["id"],
    question: json["question"],
    questionExplanation: json["question_explanation"],
    questionType: questionTypeValues.map[json["question_type"]]!,
    questionSortNumber: json["question_sort_number"],
    mbtiCategory: json["mbti_category"],
    questionItemArray: List<QuestionItemArray>.from(json["question_item_array"].map((x) => QuestionItemArray.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "diagnosis_id": diagnosisId,
    "id": id,
    "question": question,
    "question_explanation": questionExplanation,
    "question_type": questionTypeValues.reverse[questionType],
    "question_sort_number": questionSortNumber,
    "mbti_category": mbtiCategory,
    "question_item_array": List<dynamic>.from(questionItemArray.map((x) => x.toJson())),
  };
}

class QuestionItemArray {
  int tagId;
  int tagScore;

  QuestionItemArray({
    required this.tagId,
    required this.tagScore,
  });

  factory QuestionItemArray.fromJson(Map<String, dynamic> json) => QuestionItemArray(
    tagId: json["tag_id"],
    tagScore: json["tag_score"],
  );

  Map<String, dynamic> toJson() => {
    "tag_id": tagId,
    "tag_score": tagScore,
  };
}

enum QuestionType { THE_5_VOTES }

final questionTypeValues = EnumValues({
  "5votes": QuestionType.THE_5_VOTES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
