import 'package:hive/hive.dart';
import 'package:movie_chronicle/data/tables/movie_table.dart';

import '../../domain/entities/movie_entity.dart';

abstract class MovieLocalDataSource{
  Future<void> saveMovie(MovieEntity movieEntity);
  Future<List<MovieTable>> getMovie();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFavourite(int movieId);
}
class MovieLocalDataSourceImpl extends MovieLocalDataSource{
  @override
  Future<bool> checkIfMovieFavourite(int movieId) async{
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async{
    final movieBox = await Hive.openBox('movieBox');
    movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovie() async{
    final movieBox = await Hive.openBox('movieBox');
    // return movieBox.values.toList();  // single line to get movieId list, but use this then final movieBox = await Hive.openBox<MovieTable>('movieBox');
    final movieIds = movieBox.keys;
    List<MovieTable> movies = [];
    for (var movieId in movieIds) {
      movies.add(movieBox.get(movieId));
    }
    return movies;
  }


  @override
  Future<void> saveMovie(MovieEntity movieEntity) async {
    final movieBox = await Hive.openBox('movieBox');
    final movieTable = MovieTable.fromMovieEntity(movieEntity); // Convert to MovieTable
    await movieBox.put(movieTable.id, movieTable);
  }



}