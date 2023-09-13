import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_chronicle/presentation/journey/homeScreen/home_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'data/tables/movie_table.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Chronicle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black87,
      useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}

