class SignUpResModel {
  User user;
  String? token;



  SignUpResModel({
    required this.user,
    this.token,
  });

  factory SignUpResModel.fromJson(Map<String, dynamic> json) => SignUpResModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );
}

class User {
  String id;
  String? name;
  String? email;
  int phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"].toString(),
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

}