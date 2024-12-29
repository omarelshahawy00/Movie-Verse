import 'package:hive/hive.dart';
import 'package:movie_app/core/constants/hive_box.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model.dart';

class HiveServices {
  static Future<void> addItem({required FavoritesModel movie}) async {
    final box = Hive.box<FavoritesModel>(favMovies);
    await box.put(movie.id, movie);

    // Logging and Verification
    final FavoritesModel? addedItem = box.get(movie.id);
    if (addedItem != null) {
      print('Movie added successfully: ${addedItem.title}');
    } else {
      print('Failed to add movie with ID: ${movie.id}');
    }
  }

  static List<FavoritesModel> getItems() {
    final box = Hive.box<FavoritesModel>(favMovies);
    final result = box.values.toList();
    print('Retrieved ${result.length} favorite movies.');
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final box = Hive.box<FavoritesModel>(favMovies);
    await box.delete(id);

    // Logging and Verification
    final deletedItem = box.get(id);
    if (deletedItem == null) {
      print('Movie deleted successfully with ID: $id');
    } else {
      print('Failed to delete movie with ID: $id');
    }
  }
  // static Future<void> addItem(FavoritesModel movie) async {
  //   await Hive.box<FavoritesModel>(favMovies).put(movie.id, movie);
  //   print(Hive.box(favMovies).get(movie.title));
  // }

  // static List<FavoritesModel> getItems() {
  //   final result = Hive.box<FavoritesModel>(favMovies).values.toList();
  //   return result;
  // }

  // static Future<void> deleteItem(int index) async {
  //   await Hive.box<FavoritesModel>(favMovies).delete(index);
  // }
}
