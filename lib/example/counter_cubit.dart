import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit():super(0);

  void a()=> emit(state+1);
  void b()=> emit(state-1);


}