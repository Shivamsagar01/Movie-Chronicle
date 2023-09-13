import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/src/client.dart';
import '../../../data/core/api_client.dart';
import '../../../data/data_sources/movie_remote_data_sources.dart';
import '../../../data/models/cast_model.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/models/movie_video_model.dart';
import 'widgets/bigPoster.dart';
import 'widgets/cast_widget.dart';
import 'widgets/movie_video_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key, required this.movieModel}) : super(key: key);
  final MovieModel movieModel;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<List<CastModel>?> castData;
  late Future<List<MovieVideoModel>?> movieVideoData;
  @override
  void initState() {
    super.initState();
    ApiClient apiClient = ApiClient(Client() as Client);
    MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
    castData = dataSource.getCastCrew(widget.movieModel.id);
    movieVideoData = dataSource.getMovieVideo(widget.movieModel.id);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigPoster(movieModel: widget.movieModel,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Text(widget.movieModel.overview!,style: GoogleFonts.aBeeZee(fontSize: 15,)),  //added ! after overview
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Casts:',
                  style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
              child: FutureBuilder(
                future: castData,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return const Center(
                      child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                    );
                  }else if(snapshot.hasData){
                    return CastWidget(snapshot: snapshot,);
                      // Text(snapshot.data![].name,style: GoogleFonts.aBeeZee(fontSize: 15,));
                  }else{
                    return const Center(child: CircularProgressIndicator(color: Colors.white),);
                  }
                },
              )
          ),
              SizedBox(height: 10,),
              Center(
                child: SizedBox(
                    child: FutureBuilder(
                      future: movieVideoData,
                      builder: (context,snapshot){
                        if(snapshot.hasError){
                          return const Center(
                            child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                          );
                        }else if(snapshot.hasData){
                          return MovieVideoWidget(snapshot: snapshot,);
                          // Text(snapshot.data![].name,style: GoogleFonts.aBeeZee(fontSize: 15,));
                        }else{
                          return const Center(child: CircularProgressIndicator(color: Colors.white),);
                        }
                      },
                    )
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
