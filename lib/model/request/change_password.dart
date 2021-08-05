class ChangePassword {
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  ChangePassword({this.oldPassword, this.newPassword, this.confirmPassword});

  factory ChangePassword.fromJson(Map<String, dynamic> json) => ChangePassword(
        oldPassword: json["old_password"],
        newPassword: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "password": newPassword,
        "confirm_password": confirmPassword,
      };
}
