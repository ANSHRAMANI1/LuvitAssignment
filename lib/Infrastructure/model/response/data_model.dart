import 'dart:convert';

List<DetailsDataModel> dataModelFromJson(String str) => List<DetailsDataModel>.from(json.decode(str).map((x) => DetailsDataModel.fromJson(x)));

String dataModelToJson(List<DetailsDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailsDataModel {
  List<String>? images;
  String? name;
  String? description;
  String? location;
  int? likeCount;
  int? age;
  List<String>? tags;

  DetailsDataModel({
    this.images,
    this.name,
    this.description,
    this.location,
    this.likeCount,
    this.age,
    this.tags,
  });

  factory DetailsDataModel.fromJson(Map<String, dynamic> json) => DetailsDataModel(
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    name: json["name"],
    description: json["description"],
    location: json["location"],
    likeCount: json["likeCount"],
    age: json["age"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "name": name,
    "description": description,
    "location": location,
    "likeCount": likeCount,
    "age": age,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
  };
}

class Tags{

}
