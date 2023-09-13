 import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity{
  bool? adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String? originalLanguage;
  String? originalTitle;
  String overview;
  double? popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool? video;
  double voteAverage;
  int voteCount;

  MovieModel(
      {this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        this.originalLanguage,
        this.originalTitle,
        required this.overview,
        this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        this.video,
        required this.voteAverage,
        required this.voteCount
      }) : super(
      // posterPath: '',
      posterPath: posterPath,
      // id: 0,
      id: id,
      // backdropPath: '',
      backdropPath: backdropPath,
      // title: '',
      title: title,
      // voteAverage: null,
      voteAverage: voteAverage,
      // releaseDate: '',
      releaseDate: releaseDate,
      // overview: ''
      overview: overview,
    voteCount: voteCount,
    genreIds: genreIds,
  );


  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id']?? -1,
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview']??'',
      popularity: json['popularity']?.toDouble()??0.0,
      posterPath: json['poster_path']??'',
      // mediaType: json['media_type']??'',
      releaseDate: json['release_date'],
      title: json['title'] ?? '',
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble()??0.0,
      voteCount: json['vote_count'],
    );

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}


