// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String address;
  final int phone;
  final String email;
  final String post;

  UserModel(
      {required this.name,
      required this.address,
      required this.phone,
      required this.email,
      required this.post});

  UserModel copyWith({
    String? name,
    String? address,
    int? phone,
    String? email,
    String? post,
  }) {
    return UserModel(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      post: post ?? this.post,
    );
  }
}
