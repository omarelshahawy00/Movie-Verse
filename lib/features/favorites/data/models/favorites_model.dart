import 'package:hive/hive.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 0)
class FavoritesModel extends HiveObject {
  @HiveField(0)
  final String? posterPath;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final double? voteAverage;
  @HiveField(4)
  final int? voteCount;
  @HiveField(5)
  final String? releaseDate;
  @HiveField(6)
  final String? overview;
  @HiveField(7)
  final String? mainLanguage;

  FavoritesModel({
    this.posterPath,
    this.title,
    this.id,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.overview,
    this.mainLanguage,
  });
}
