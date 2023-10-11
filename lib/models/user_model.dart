class UserModel {
  String? userId;
  String? name;
  String? email;
  String pic;

  /// Constructs a [UserModel] instance.
  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  /// Constructs a [UserModel] instance from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      email: map['email'],
      name: map['name'],
      pic: map['pic'],
    );
  }

  /// Converts the [UserModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
