import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies_v2/movies_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  MoviesList? movies;

  Future<void> _getListagemAPI() async {
    await Future.delayed(Duration(seconds: 5));
    http.get(
      Uri.https('api.themoviedb.org', '/4/list/1'),
      headers: {
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDhmYWNkMDFkMDI5ZTI4ZTlmNDNmNTQyNmMxZWIyZSIsInN1YiI6IjYwZTQ3OTgyNmVlM2Q3MDAyYzI4ODUwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NcmY0hq1lGeqG_TG_0SsBZGuSBW8jfhkApJbydn2t0U',
        'content-type': 'application/json;charset=utf-8'
      },
    ).then(
      (Response value) {
        if (value.statusCode == 200) {
          movies = MoviesList.fromJson(
            jsonDecode(value.body),
          );
          print(movies.toString());
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getListagemAPI();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('Movie: ${movies?.name ?? "Erro"}'),
        ),
      ),
    );
  }
}
