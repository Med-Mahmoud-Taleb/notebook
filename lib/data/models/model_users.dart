// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int id;
  String username;
  String password;
  String? date;

  User(
      {required this.id,
      required this.username,
      required this.password,
      this.date});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['Username'],
      password: map['Password'],
      date: map['Date'],
    );
  }
}
