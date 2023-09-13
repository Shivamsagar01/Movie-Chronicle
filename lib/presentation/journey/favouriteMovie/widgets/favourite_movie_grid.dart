import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/core/api_constants.dart';
import '../../../../data/data_sources/movie_local_data_sources.dart';
import '../../../../data/models/movie_model.dart';
import '../../../../data/tables/movie_table.dart';
import '../../movieDetails/movie_detail_screen.dart';
class FavouriteMovieGrid extends StatefulWidget {
  const FavouriteMovieGrid({Key? key, required this.snapshot,required this.onRefresh,}) : super(key: key);
  final AsyncSnapshot snapshot;
  final Future<void> Function() onRefresh;

  MovieModel convertToMovieModel(MovieTable movieTable) {
  return MovieModel(
    id: movieTable.id,
    title: movieTable.title,
    posterPath: movieTable.posterPath,
    backdropPath: movieTable.backdropPath,
    releaseDate: movieTable.releaseDate,
    voteAverage: movieTable.voteAverage,
    overview: movieTable.overview,
    voteCount: movieTable.voteCount,
    genreIds: movieTable.genreIds,
      );
  }



  @override
  State<FavouriteMovieGrid> createState() => _FavouriteMovieGridState();
}

class _FavouriteMovieGridState extends State<FavouriteMovieGrid> {
  late final MovieLocalDataSource localDataSource;
  late final items;
  @override
  void initState() {
    super.initState();
    localDataSource = MovieLocalDataSourceImpl();
    items = widget.snapshot.data.length;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10),
      child: RefreshIndicator(
        color: Colors.red,
        onRefresh: widget.onRefresh,
        child: items !=0
            ?GridView.builder(
            shrinkWrap: true,
            itemCount: widget.snapshot.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 20,
                mainAxisSpacing: 16,
            ),
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>MovieDetailScreen(
                                    movieModel: widget.convertToMovieModel(widget.snapshot.data[index]),
                                  )
                              ));
                        },
                        child: CachedNetworkImage(
                          imageUrl: '${ApiConstants.BASE_IMAGE_URL}${widget.snapshot.data[index].posterPath }',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              localDataSource.deleteMovie( widget.snapshot.data[index].id);
                              setState(() {
                              });
                            },
                            child: const Icon(Icons.delete, size: 30, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        )
            :Center(child: Text('No Favourite Movie',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
