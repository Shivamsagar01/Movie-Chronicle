import 'package:flutter/material.dart';

import '../../../../data/data_sources/movie_local_data_sources.dart';
import '../../../../data/models/movie_model.dart';
import '../../../../domain/entities/movie_entity.dart';

class MovieDetailAppbar extends StatefulWidget {
  const MovieDetailAppbar({Key? key, required this.movieModel}) : super(key: key);

  final MovieModel movieModel;
  @override
  State<MovieDetailAppbar> createState() => _MovieDetailAppbarState();
}

class _MovieDetailAppbarState extends State<MovieDetailAppbar> {

  late final MovieLocalDataSource localDataSource;
  late final MovieEntity movieEntity;
  late Future<bool> isFavourite;
  bool isWatched = false;
   bool? isFavourite1;

  Future<bool> toggleFavourite() async{
    isFavourite =  localDataSource.checkIfMovieFavourite( widget.movieModel.id);
    if(await isFavourite){
      localDataSource.deleteMovie( widget.movieModel.id);
      return false;
    }else{
      localDataSource.saveMovie( movieEntity);
      return true;
    }
  }

  Future<void> initFavouriteState() async {
    final isFav = await localDataSource.checkIfMovieFavourite(widget.movieModel.id);
    setState(() {
      isFavourite1 = isFav;
    });
  }

  @override
  void initState() {
    super.initState();
    localDataSource = MovieLocalDataSourceImpl();
    movieEntity = widget.movieModel;
    initFavouriteState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back, size: 30),
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  final newIsFavourite = await toggleFavourite();
                  setState(() {
                    isFavourite1 = newIsFavourite;
                  });
                },
                child:isFavourite1 != null
                    ? InkWell(
                      onTap: () async {
                        final newIsFavourite = await toggleFavourite();
                         setState(() {
                           isFavourite1 = newIsFavourite;
                         });
                     },
                    child: isFavourite1!
                      ? const Icon(Icons.favorite, size: 30, color: Colors.red)
                      : const Icon(Icons.favorite_outline, size: 30),
                )
                    : const CircularProgressIndicator(color: Colors.transparent,),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    isWatched = !isWatched; // Toggle the watched state
                  });
                },
                child: isWatched
                    ? Image.asset('assets/pngs/watched_Icon1.png', width: 35, height: 35)
                    : Image.asset('assets/pngs/non_watched_Icon.png', width: 35, height: 35),
              ),
            ],
          )
        ],
      ),
    );
  }
}

