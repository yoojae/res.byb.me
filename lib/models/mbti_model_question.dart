import 'dart:convert';

MbtiQ datumListFromJson(String str) => MbtiQ.fromJson(json.decode(str));

String mbtiQToJson(MbtiQ data) => json.encode(data.toJson());


class MbtiQ {
  int status;
  bool success;
  String message;
  List<Datum> data;

  MbtiQ({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory MbtiQ.fromJson(Map<String, dynamic> json) => MbtiQ(
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
  String mbtiCategory;
  List<QuestionItemArray> questionItemArray;

  Datum({
    required this.diagnosisId,
    required this.id,
    required this.question,
    required this.questionExplanation,
    required this.questionType,
    required this.questionSortNumber,
    required this.mbtiCategory,
    required this.questionItemArray,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    diagnosisId: json["diagnosis_id"],
    id: json["id"],
    question: json["question"],
    questionExplanation: json["question_explanation"],
    questionType: questionTypeValues.map[json["question_type"]]!,
    questionSortNumber: json["question_sort_number"],
    mbtiCategory: json["mbti_category"]!,
    questionItemArray: List<QuestionItemArray>.from(json["question_item_array"].map((x) => QuestionItemArray.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "diagnosis_id": diagnosisId,
    "id": id,
    "question": question,
    "question_explanation": questionExplanation,
    "question_type": questionTypeValues.reverse[questionType],
    "question_sort_number": questionSortNumber,
    "mbti_category": mbtiCategoryValues.reverse[mbtiCategory],
    "question_item_array": List<dynamic>.from(questionItemArray.map((x) => x.toJson())),
  };
}

enum MbtiCategory { EMPTY, MBTI_CATEGORY, PURPLE, FLUFFY }

final mbtiCategoryValues = EnumValues({
  "생활습관": MbtiCategory.EMPTY,
  "두피": MbtiCategory.FLUFFY,
  "스트레스": MbtiCategory.MBTI_CATEGORY,
  "유전": MbtiCategory.PURPLE
});

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




