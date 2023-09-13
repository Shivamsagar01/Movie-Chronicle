import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
   final String posterPath;
   final int id;
   final String backdropPath;
   final String title;
   final double voteAverage;
   final String releaseDate;
   final String overview;
   final int voteCount;
   final List<int> genreIds;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    required this.voteCount,
    required this.genreIds,
}): assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [id,title];

  @override
  bool get stringify => true;
}
