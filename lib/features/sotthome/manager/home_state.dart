import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_repository/data/models/home/home.dart';

part 'home_state.freezed.dart';

enum HomeStatus { idle, loading, error }

@freezed
abstract class HomeState with _$HomeState{
  const factory HomeState({
    required List<HomeModel> home,
    required HomeStatus status,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      home: [],
      status: HomeStatus.loading,
    );
  }
}