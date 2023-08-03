import 'package:flutter/material.dart';
import 'package:rest_api/services/user_api.dart';

import '../model/user.dart';
import '../model/user_name.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  //List<dynamic> users = []; // video 1 we used dynamic list

  List<User> users = []; // now list of users
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            //  final email = user['email'];
            //final name = user['name']['last'];
            //final imageUrl = user['picture']['thumbnail'];
            final user = users[
                index]; // the current user data is extracted from the users list using the provided index

            //    final email = user.email;
            //   final color = user.gender == 'male' ? Colors.blue : Colors.red;
            return ListTile(
              // title: Text(user.email),
              //title: Text(user.name.first),
              title: Text(user.fullName), //getter
              //  "name": {                    //for this json [name][title]
              ///  "title": "Mr",
              // "first": "Fatih",
              // "last": "Sezek"
              //},
              subtitle: Text(user.phone),
              //  tileColor: color,
              trailing: Text(user.nat),
            );
          }),
      // floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
