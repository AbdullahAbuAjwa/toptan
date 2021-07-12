class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? imageProfile;
  int? cityId;
  int? countryId;
  int? groupId;
  String? status;
  String? address;
  String? accessToken;

  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.imageProfile,
    this.cityId,
    this.countryId,
    this.groupId,
    this.status,
    this.address,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        imageProfile: json["profile_image"],
        cityId: json["city_id"],
        countryId: json["country_id"],
        status: json["status"],
        accessToken: json['access_token'],
        address: json["address"],
        groupId: json['group_id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "profile_image": imageProfile,
        "city_id": cityId,
        "country_id": countryId,
        "status": status,
        "access_token": accessToken,
        "address": address,
        "group_id": groupId,
      };
}
