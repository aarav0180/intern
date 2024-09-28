// models/user_model.dart
class UserModel {
  final String name;
  final String email;
  final String state;
  final String city;
  final String? logo;

  UserModel({
    required this.name,
    required this.email,
    required this.state,
    required this.city,
    this.logo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      state: json['location']['state'] ?? "Karnataka",
      city: json['location']['city'] ?? "Bengaluru",
      logo: json['logo'],
    );
  }
}
