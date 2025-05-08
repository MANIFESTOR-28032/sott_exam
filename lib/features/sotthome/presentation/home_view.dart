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

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => _buildBody(state),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              // Фон только под верхней частью
              Container(
                height: 220, // высота под AppBar и кнопки
                width: double.infinity,
                child: Image.asset(
                  AppImages.backround,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 32), // отступ сверху
                  _buildAppBarRow(),
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
        _buildGrid(state),
      ],
    );
  }

  Widget _buildAppBarRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppIcons.logo),
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