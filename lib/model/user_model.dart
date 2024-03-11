
class UserModel {
  String? name;
  String? email;
  String? uid;
  String? phonenumber;
  UserModel({required this.name, this.email, this.phonenumber, this.uid});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phonenumber: json['phonenumber'],
        uid: json['uid']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'phonenumber': phonenumber
    };
  }
}
