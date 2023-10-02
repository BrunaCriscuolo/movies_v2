import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void _getListAPI() {
    http.get(Uri.https('api.themoviedb.org', '/4/list/1'), headers: {
      'authorization': 'Bearer xxxx',
      'content-type': 'application/json;charset=utf-8'
    }).then((Response value) => print(value.body));
  }

  @override
  void initState() {
    super.initState();
    _getListAPI();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('Vamos ver se funciona!'),
        ),
      ),
    );
  }
}
