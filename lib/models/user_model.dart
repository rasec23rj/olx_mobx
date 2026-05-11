class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.celular,
    required this.password,
    this.type = UserType.PARTICULAR,
  });

  String name;
  String email;
  String celular;
  String password;
  UserType type;
}

enum UserType { PARTICULAR, PROFFISIONAL }
