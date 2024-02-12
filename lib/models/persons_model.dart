class PersonsModel {
  int? id;
  String? photo;
  String? name;
  String? enName;
  String? description;
  String? profession;
  String? enProfession;

  PersonsModel(
      {this.id,
      this.photo,
      this.name,
      this.enName,
      this.description,
      this.profession,
      this.enProfession});

  PersonsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    enName = json['enName'];
    description = json['description'];
    profession = json['profession'];
    enProfession = json['enProfession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['photo'] = photo;
    json['name'] = name;
    json['enName'] = enName;
    json['description'] = description;
    json['profession'] = profession;
    json['enProfession'] = enProfession;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
