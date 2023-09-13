// import '../../domain/entities/cast_entity.dart';

// class CastModel extends CastEntity{
//   final int? gender;
//   final int? id;
//   final String name;
//   final String profilePath;
//   final int? castId;
//   final String character;
//   final String creditId;
//   final int? order;
//
//   CastModel(
//       { required this.gender,
//         required this.id,
//         required this.name,
//         required this.profilePath,
//         required this.castId,
//         required this.character,
//         required this.creditId,
//         required this.order,
//         // required super.posterPath
//       }):super(
//       name: name,
//       character: character,
//       creditId: creditId,
//       posterPath:profilePath
//   );
//
//
//   factory CastModel.fromJson(Map<String, dynamic> json) {
//     return CastModel(
//       gender: json['gender'],
//       id: json['id'],
//       name: json['name'],
//       profilePath: json['profile_path'],
//       castId: json['cast_id'],
//       character: json['character'],
//       creditId: json['credit_id'],
//       order: json['order'],
//     );
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['gender'] = this.gender;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['profile_path'] = this.profilePath;
//     data['cast_id'] = this.castId;
//     data['character'] = this.character;
//     data['credit_id'] = this.creditId;
//     data['order'] = this.order;
//     return data;
//   }
// }


class CastModel {
  int? gender;
  int? id;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  int? order;

  CastModel({
    this.gender,
    this.id,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.order,
  });

  CastModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['order'] = order;
    return data;
  }
}
