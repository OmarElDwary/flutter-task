class UserModel {
  String id;
  String name;
  String email;
  String profileImage;
  String phone;
  String dateOfBirth;
  String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'] ?? '',
      phone: map['phone'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'phone': phone,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }
}
