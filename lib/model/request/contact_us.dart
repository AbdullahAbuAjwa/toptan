class ContactUs {
  String? name;
  String? mobile;
  String? email;
  String? message;

  ContactUs({this.name, this.mobile, this.email, this.message});

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "message": message,
      };
}
