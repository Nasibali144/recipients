class User{
  late int id;
  late String name;
  late String relationship;
  late String phone;
  String? userImage;

  User(this.id, this.name, this.relationship, this.phone, this.userImage);

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    relationship = json["relationship"];
    phone = json["phone"];
    userImage = json["userImage"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "relationship": relationship,
    "phone": phone,
    "userImage": userImage,
  };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator == (Object other) {
    return other is User && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, name, phone, relationship, userImage);
}