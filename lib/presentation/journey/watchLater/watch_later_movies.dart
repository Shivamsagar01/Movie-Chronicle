import 'package:flutter/material.dart';

class WatchLaterMovieScreen extends StatefulWidget {
  const WatchLaterMovieScreen({Key? key}) : super(key: key);

  @override
  State<WatchLaterMovieScreen> createState() => _WatchLaterMovieScreenState();
}

class _WatchLaterMovieScreenState extends State<WatchLaterMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            title: const Text('Watch Later',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black87,
            centerTitle: true,
            automaticallyImplyLeading: true,
          ),
        ));
  }
}
