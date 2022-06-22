class UserModel {
  late String phone;

  late String name;

  late String email;

  late String imgUrl;

  UserModel(
      {required this.phone,
      required this.name,
      required this.email,
      required this.imgUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? '';

    name = json['name'] ?? '';

    email = json['email'] ?? '';

    imgUrl = json['imgUrl'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['phone'] = phone;

    data['name'] = name;

    data['email'] = email;

    data['imgUrl'] = imgUrl;
    return data;
  }
}
