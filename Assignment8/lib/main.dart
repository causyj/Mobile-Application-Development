import 'package:flutter/material.dart';
import 'package:video7/addteammember.dart';
import 'package:video7/members.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Members(),
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const AddTeamMemberPage(),
      ),
    );
  }
}