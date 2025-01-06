import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavbarCubit extends Cubit<int> {
  BottomNavbarCubit() : super(0);
  int currentIndex = 0;
  void selectedTab(int index) {
    currentIndex = index;
    emit(currentIndex);
  }
}
