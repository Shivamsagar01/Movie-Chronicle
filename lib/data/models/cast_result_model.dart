import 'cast_model.dart';
class CastResultModel {
  late final List<CastModel>? cast;

  CastResultModel({this.cast});


 factory CastResultModel.fromJson(Map<String, dynamic> json) {

    var cast1 = List<CastModel>.empty(growable: true);
    if (json['cast'] != null) {
      cast1 = <CastModel>[];
      json['cast']!.forEach((v) {
        cast1.add(new CastModel.fromJson(v));
      });
      // print('cast i=');
      // print(i);
    }
    return CastResultModel(cast: cast1);
  }
}
