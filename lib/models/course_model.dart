// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.id,
    this.name,
    this.description,
    //this.studyActuallyEvaluation,
    //this.studyAllEvaluation,
    //this.results,
  });

  int id;
  String name;
  String description;
  //String studyActuallyEvaluation;
  //List<dynamic> studyAllEvaluation;
  //List<dynamic> results;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        //studyActuallyEvaluation: json["study_actually_evaluation"],
        //studyAllEvaluation: List<dynamic>.from(json["study_all_evaluation"].map((x) => x)),
        //results: List<dynamic>.from(json["results"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        //"study_actually_evaluation": studyActuallyEvaluation,
        //"study_all_evaluation": List<dynamic>.from(studyAllEvaluation.map((x) => x)),
        //"results": List<dynamic>.from(results.map((x) => x)),
      };
}
