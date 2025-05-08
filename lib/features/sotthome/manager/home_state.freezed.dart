part of 'home_state.dart';

T _$identity<T>(T value) => value;

mixin _$HomeState {
  List<HomeModel> get home;
  HomeStatus get status;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            const DeepCollectionEquality().equals(other.home, home) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(home), status);

  @override
  String toString() {
    return 'HomeState(home: $home, status: $status)';
  }
}

abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call({List<HomeModel> home, HomeStatus status});
}

class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      home: null == home
          ? _self.home
          : home
              as List<HomeModel>,
      status: null == status
          ? _self.status
          : status
              as HomeStatus,
    ));
  }
}

class _HomeState implements HomeState {
  const _HomeState({required final List<HomeModel> home, required this.status})
      : _home = home;

  final List<HomeModel> _home;
  @override
  List<HomeModel> get home {
    if (_home is EqualUnmodifiableListView) return _home;
    return EqualUnmodifiableListView(_home);
  }

  @override
  final HomeStatus status;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other._home, _home) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_home), status);

  @override
  String toString() {
    return 'HomeState(home: $home, status: $status)';
  }
}

abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<HomeModel> home, HomeStatus status});
}

class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? home = null,
    Object? status = null,
  }) {
    return _then(_HomeState(
      home: null == home
          ? _self._home
          : home
              as List<HomeModel>,
      status: null == status
          ? _self.status
          : status
              as HomeStatus,
    ));
  }
}