import 'package:movie_chronicle/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final String backdropPath;

  @HiveField(4)
  final String releaseDate;

  @HiveField(5)
  final double voteAverage;

  @HiveField(6)
  final String overview;

  @HiveField(7)
  final int voteCount;

  @HiveField(8)
  final List<int> genreIds;

  MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    required this.voteCount,
    required this.genreIds,


  }) : super(
    posterPath: posterPath,
    id: id,
    backdropPath: backdropPath,
    title: title,
    voteAverage: voteAverage,
    releaseDate: releaseDate,
    overview: overview,
    voteCount: voteCount,
    genreIds: genreIds,
  );

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
      backdropPath: movieEntity.backdropPath,
      releaseDate: movieEntity.releaseDate,
      voteAverage: movieEntity.voteAverage,
      overview: movieEntity.overview,
      voteCount: movieEntity.voteCount,
      genreIds: movieEntity.genreIds,
    );
  }
}
