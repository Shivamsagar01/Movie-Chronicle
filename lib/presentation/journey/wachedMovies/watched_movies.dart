import 'package:flutter/material.dart';

class WatchedMovieScreen extends StatefulWidget {
  const WatchedMovieScreen({Key? key}) : super(key: key);

  @override
  State<WatchedMovieScreen> createState() => _WatchedMovieScreenState();
}

class _WatchedMovieScreenState extends State<WatchedMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            title: const Text('Watched Movies',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black87,
            centerTitle: true,
            automaticallyImplyLeading: true,
          ),
        ));
  }
}
