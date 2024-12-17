import 'package:bloc/bloc.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  int currentIndex = 0;
  void selectButton(int index) {
    currentIndex = index;
    emit(CategoryInitial());
  }
}
