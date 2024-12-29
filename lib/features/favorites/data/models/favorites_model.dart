import 'package:hive/hive.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 0)
class FavoritesModel extends HiveObject {
  @HiveField(0)
  final String posterPath;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final double voteAverage;
  @HiveField(4)
  final int voteCount;

  FavoritesModel({
    required this.posterPath,
    required this.title,
    required this.id,
    required this.voteAverage,
    required this.voteCount,
  });
}
