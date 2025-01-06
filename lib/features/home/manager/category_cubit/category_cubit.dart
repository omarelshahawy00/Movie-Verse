import 'package:bloc/bloc.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(0);
  int currentIndex = 0;
  selectButton(int index) {
    currentIndex = index;
    emit(currentIndex);
  }
}
