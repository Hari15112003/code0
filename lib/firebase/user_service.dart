class UserModel {
  String name;
  String email;
  String aadharNumber;
  String address;
  String gender;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel(
      {required this.name,
      required this.email,
      required this.aadharNumber,
      required this.address,
      required this.gender,
      required this.createdAt,
      required this.phoneNumber,
      required this.uid});

//from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        gender: map['gender'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        address: map['address'] ?? '',
        aadharNumber: map['aadharNumber'] ?? '',
        createdAt: map['createdAt'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        uid: map['uid'] ?? '');
  }

  //  to map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'aadharNumber': aadharNumber,
      'address': address,
      'gender': gender,
      'createdAt': createdAt,
      'phoneNumber': phoneNumber,
      'uid': uid
    };
  }
}
