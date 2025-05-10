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
import '../widgets/custom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() => _currentTabIndex = _tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => _buildMainContent(state),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (index) => _tabController.animateTo(index),
      ),
    );
  }

  Widget _buildMainContent(HomeState state) {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildHomeTab(state),
        _buildSearchTab(),
        _buildAddTab(),
        _buildChatTab(),
        _buildProfileTab(),
      ],
    );
  }

  Widget _buildHomeTab(HomeState state) {
    return switch (state.status) {
      HomeStatus.error => const _ErrorView(),
      HomeStatus.loading => const _LoadingView(),
      HomeStatus.idle => _buildHomeContent(state),
    };
  }

  Widget _buildHomeContent(HomeState state) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          expandedHeight: 220,
          floating: true,
          snap: true,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  AppImages.backround,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppIcons.logo),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AppIcons.notification,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildPropertyGrid(state),
      ],
    );
  }

  Widget _buildPropertyGrid(HomeState state) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 215.h,
          childAspectRatio: 170.w / 217.h,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 24.h,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Hero(
            tag: 'property_${state.home[index].id}',
            child: HomeItems(home: state.home[index]),
          ),
          childCount: state.home.length,
        ),
      ),
    );
  }

  Widget _buildSearchTab() => const Center(child: Text('Поиск'));
  Widget _buildAddTab() => const Center(child: Text('Добавить'));
  Widget _buildChatTab() => const Center(child: Text('Чат'));
  Widget _buildProfileTab() => const Center(child: Text('Профиль'));
}

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(
              'Ошибка загрузки данных',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red[300],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFD600)),
        ),
      );
}