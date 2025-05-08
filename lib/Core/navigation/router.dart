import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_repository/core/navigation/routes.dart';
import 'package:hive_repository/features/sotthome/manager/home_bloc.dart';
import 'package:hive_repository/features/sotthome/manager/home_event.dart';
import 'package:hive_repository/features/sotthome/presentation/home_view.dart';

final router = GoRouter(
  initialLocation: Routes.sotHome,
  routes: [
    GoRoute(
      path: Routes.sotHome,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          repo: context.read(),
        )..add(HomeLoad()),
        child: HomeView(),
      ),
    ),
  ],
);