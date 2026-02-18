import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/features/home/presentation/bloc/home_event.dart';
import 'package:money_tracker/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    _setupHandlers();
  }

  void _setupHandlers() {
    //TODO: implemnt some logic
  }
}
