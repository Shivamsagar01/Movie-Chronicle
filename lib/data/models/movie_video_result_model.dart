import 'movie_video_model.dart';

class MovieVideoResultModel {
  List<MovieVideoModel>? results;

  MovieVideoResultModel({this.results});

  factory MovieVideoResultModel.fromJson(Map<String, dynamic> json) {
    var movie1 = List<MovieVideoModel>.empty(growable: true);
    if (json['results'] != null) {
      movie1 = <MovieVideoModel>[];
      json['results'].forEach((v) {
        movie1!.add(new MovieVideoModel.fromJson(v));
      });
    }
    return MovieVideoResultModel(results: movie1);
  }
}

