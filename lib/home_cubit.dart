import 'package:bloc/bloc.dart';

class HomePageCubit extends Cubit<int> {
  HomePageCubit() :super(0);
  void increment() => emit(state+1);
  void decrement() => emit(state-1);
  
}