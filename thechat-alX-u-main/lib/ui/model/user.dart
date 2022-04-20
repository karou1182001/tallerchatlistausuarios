class User {
  String email;
  String uid;

  User(this.email, this.uid);

  factory User.fromJson(dynamic json) {
    return User(json['email'] as String, json['uid'] as String);
  }
}
