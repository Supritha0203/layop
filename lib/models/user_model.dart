class UserModel {
  final String uid;
  final String email;
  final String name;
  final String gender;
  final String phoneNumber;
  final String address;
  final String imageUrl;
  final String role; // teacher or volunteer
  final String school;
  final String dateOfBirth;
  final String dateOfJoining;
  final String dateOfLeaving;
  final String dateOfCreation;
  final String dateOfModification;
  final bool status;

  UserModel(
      {required this.uid,
      required this.email,
      required this.name,
      required this.gender,
      required this.phoneNumber,
      required this.address,
      required this.imageUrl,
      required this.role,
      required this.school,
      required this.dateOfBirth,
      required this.dateOfJoining,
      required this.dateOfLeaving,
      required this.dateOfCreation,
      required this.dateOfModification,
      required this.status});

  // factory UserModel.fromMap(Map<String, dynamic> data) {
  //   return UserModel(
  //       uid: data['uid'],
  //       email: data['email'],
  //       name: data['name'], address: '',

  // }

  Map<String,dynamic> toJson()=>{
    'uid':uid,
    'email':email,
    'name':name,
    'gender': gender,
    'phoneNumber': phoneNumber,
    'address': address,
    'imageUrl': imageUrl,
    'role': role,
    'school': school,
    'dateOfBirth': dateOfBirth,
    'dateOfJoining': dateOfJoining,
    'dateOfLeaving': dateOfLeaving,
    'dateOfCreation': dateOfCreation,
    'dateOfModification': dateOfModification,
    'status': status,

  };
}
