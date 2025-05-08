import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_repository/core/utils/icons.dart';
import 'package:hive_repository/core/utils/images.dart';
import 'package:hive_repository/features/sotthome/manager/home_bloc.dart';
import 'package:hive_repository/features/sotthome/manager/home_state.dart';
import 'package:hive_repository/features/sotthome/widgets/home_items.dart';

import '../widgets/bottom.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state.status) {
            HomeStatus.error => const Text("Ошибка, данные отсутствуют"),
            HomeStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
            HomeStatus.idle => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverAppBar(
                      floating: true,
                      snap: true,
                      pinned: false,
                      expandedHeight: 150.h,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(AppImages.backround),
                      ),
                      leading: SvgPicture.asset(AppIcons.logo),
                      leadingWidth: 70,
                      actions: [
                        SvgPicture.asset(AppIcons.notification),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.home.length,
                            (context, index) {
                          final home = state.home[index];
                          return HomeItems(home: home);
                        },
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 215.h,
                        childAspectRatio: 170.w / 217.h,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 24.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          };
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        height: 70,
        backgroundColor: Colors.white,
        indicatorColor: Colors.amber.shade100,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.amber),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search, color: Colors.amber),
            label: 'Поиск',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble, color: Colors.amber),
            label: 'Чат',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Colors.amber),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
