import 'package:flutter/material.dart';
import 'package:movie_chronicle/presentation/journey/favouriteMovie/widgets/favourite_movie_grid.dart';

import '../../../data/data_sources/movie_local_data_sources.dart';
import '../../../domain/entities/movie_entity.dart';

class FavouriteMovieScreen extends StatefulWidget {
  const FavouriteMovieScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteMovieScreen> createState() => _FavouriteMovieScreenState();
}

class _FavouriteMovieScreenState extends State<FavouriteMovieScreen> {
  late final MovieLocalDataSource localDataSource;
  late final MovieEntity movieEntity;
  late Future<List<MovieEntity>> favouriteMovies;


  Future<void> _refreshFavoriteMovies() async {
    final movies = await localDataSource.getMovie();
    setState(() {
      favouriteMovies = Future.value(movies);
    });
  }


  @override
  void initState() {
    super.initState();
    localDataSource = MovieLocalDataSourceImpl();
    favouriteMovies = localDataSource.getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            title: const Text('Favourite Movies',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black87,
            centerTitle: true,
            automaticallyImplyLeading: true,
          ),
          body: SizedBox(
              child: FutureBuilder(
                future: favouriteMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return const Center(
                      child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                    );
                  }else if(snapshot.hasData){
                    return FavouriteMovieGrid(snapshot: snapshot,onRefresh: _refreshFavoriteMovies,);
                  }else{
                    return const Center(child: CircularProgressIndicator(color: Colors.white),);
                  }
                },
              )
          ),
    ));
  }
}
