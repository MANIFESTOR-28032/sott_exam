import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_repository/core/utils/icons.dart';
import 'package:hive_repository/core/utils/images.dart';
import 'package:hive_repository/features/sotthome/manager/home_bloc.dart';
import 'package:hive_repository/features/sotthome/manager/home_state.dart';
import 'package:hive_repository/features/sotthome/widgets/home_items.dart';
import '../widgets/top_action_button.dart';

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
        builder: (context, state) => _buildBody(state),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildBody(HomeState state) {
    return switch (state.status) {
      HomeStatus.error => const _ErrorView(),
      HomeStatus.loading => const _LoadingView(),
      HomeStatus.idle => _buildContent(state),
    };
  }

  Widget _buildContent(HomeState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopActionButton(
                    iconPath: 'assets/icons/search.svg',
                    label: 'Покупка',
                    onTap: () {},
                  ),
                  TopActionButton(
                    iconPath: 'assets/icons/building.svg',
                    label: 'Продажа',
                    onTap: () {},
                  ),
                  TopActionButton(
                    iconPath: 'assets/icons/timer.svg',
                    label: 'Аренда',
                    onTap: () {},
                  ),
                  TopActionButton(
                    iconPath: 'assets/icons/train.svg',
                    label: 'Сдать',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          _buildGrid(state),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverPadding(
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
    );
  }

  Widget _buildGrid(HomeState state) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: state.home.length,
          (context, index) => HomeItems(home: state.home[index]),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 215.h,
          childAspectRatio: 170.w / 217.h,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 24.h,
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onDestinationSelected,
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
    );
  }

  void _onDestinationSelected(int index) {
    setState(() => _selectedIndex = index);
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) => const Text("Ошибка, данные отсутствуют");
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
