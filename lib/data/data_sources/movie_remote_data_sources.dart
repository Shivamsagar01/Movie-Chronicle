import 'package:movie_chronicle/data/core/api_client.dart';
import '../models/cast_model.dart';
import '../models/cast_result_model.dart';
import '../models/movie_model.dart';
import '../models/movie_result_model.dart';
import '../models/movie_video_model.dart';
import '../models/movie_video_result_model.dart';


abstract class MovieRemoteDataSource{
  Future<List<MovieModel>?> getTrending();
  Future<List<MovieModel>?> getPopular();
  Future<List<MovieModel>?> getPlayingNow();
  Future<List<MovieModel>?> getComingSoon();
  Future<List<MovieModel>?> getTopRated();
  Future<List<CastModel>?> getCastCrew(int id);
  Future<List<MovieVideoModel>?> getMovieVideo(int id);
  Future<List<MovieModel>?> getSearchedMovie(String searchTerm);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  late final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>?> getTrending() async{
    final response = await _client.get("trending/movie/day",'');
    // final movies = MoviesResultModel.fromJson(response).movies;
    final movies = MovieResultModel.fromJson(response).results;
    return movies;
   }

  @override
  Future<List<MovieModel>?> getPopular() async{
    final response = await _client.get("movie/popular",'');
    // final movies = MoviesResultModel.fromJson(response).movies;
    final movies = MovieResultModel.fromJson(response).results;
    return movies;
  }
  @override
  Future<List<MovieModel>?> getTopRated() async{
    final response = await _client.get("movie/top_rated",'');
    // final movies = MoviesResultModel.fromJson(response).movies;
    final movies = MovieResultModel.fromJson(response).results;
    return movies;
  }
  @override
  Future<List<MovieModel>?> getComingSoon() async {
    final response = await _client.get("movie/upcoming",'');
    // final movies = MoviesResultModel.fromJson(response).movies;
    final movies = MovieResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPlayingNow() async {
    final response = await _client.get("movie/now_playing",'');
    // final movies = MoviesResultModel.fromJson(response).movies;
    final movies = MovieResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<CastModel>?> getCastCrew(int id) async{
    final response = await _client.get("movie/$id/credits",'');
    final cast = CastResultModel.fromJson(response).cast;
    return  cast;
  }

  @override
  Future<List<MovieVideoModel>?> getMovieVideo(int id) async{
    final response = await _client.get("movie/$id/videos",'');
    final videos = MovieVideoResultModel.fromJson(response).results;
    return  videos;
  }

  @override
  Future<List<MovieModel>?> getSearchedMovie(String searchTerm) async{
    final response = await _client.get("search/movie",searchTerm);
    final movies = MovieResultModel.fromJson(response).results;
    return movies;
  }

}
