import 'package:rest_api/model/user_dob.dart';
import 'package:rest_api/model/user_location.dart';
import 'package:rest_api/model/user_name.dart';
import 'package:rest_api/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  // factory constructor
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final date = e['dob']['date'];
    // final dob = UserDob(
    //   date: DateTime.parse(date),
    //   age: e['dob']['age'],
    // );

    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);

    final picture = UserPicture.fromMap(e['picture']);
    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  //getter
  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

// mapping a complex object

// class UserName {
//   final String title;
//   final String first;
//   final String last;

//   UserName({
//     required this.title,
//     required this.first,
//     required this.last,
//   });
// }
