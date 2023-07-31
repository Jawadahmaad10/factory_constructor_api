import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/user.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  //List<dynamic> users = []; // video 1 we used dynamic list

  List<User> users = []; // now list of users
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
            final color = user.gender == 'male' ? Colors.blue : Colors.red;
            return ListTile(
              title: Text(user.email),
              subtitle: Text(user.phone),
              tileColor: color,
              trailing: Text(user.nat),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
      );
    }).toList();
    setState(() {
      //  users = json['results'];
      users = transformed;
    });
  }
}
