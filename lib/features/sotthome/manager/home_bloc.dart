import 'package:bloc/bloc.dart';
import 'package:hive_repository/data/repositories/home/home_repositories.dart';
import 'package:hive_repository/features/sotthome/manager/home_event.dart';
import 'package:hive_repository/features/sotthome/manager/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositories _repositories;

  HomeBloc({required HomeRepositories repo})
      : _repositories = repo,
        super(HomeState.initial()) {
    on<HomeLoad>(_load);
  }

  Future<void> _load(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      final home = await _repositories.fetchHome();
      emit(state.copyWith(home: home, status: HomeStatus.idle));
    } catch (e) {
      throw Exception("произошла ошибка $e");
    }
  }
}