
class User {
  var id;
  var name;
  var email;
  var mobile;
  var imageProfile;
  var cityId;
  var groupId;
  var status;
  var type;
  var accessToken;

  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.imageProfile,
    this.cityId,
    this.groupId,
    this.status,
    this.type,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        imageProfile: json["image_profile"],
        cityId: json["city_id"],
        status: json["status"],
        type: json["type"],
        groupId: json['group_id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "image_profile": imageProfile,
        "city_id": cityId,
        "status": status,
        "type": type,
        "access_token": accessToken,
        "group_id": groupId,
      };
}
