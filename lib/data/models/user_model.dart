class UserModel {
  String id;
  String name;
  String email;
  String profileImage;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
        id: id,
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        profileImage: map['profileImage'] ?? '');
  }
}
