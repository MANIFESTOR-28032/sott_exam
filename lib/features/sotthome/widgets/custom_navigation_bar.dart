import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pentagon_clipper.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: 'assets/icons/logo.svg',
            label: 'Главная',
            isSelected: selectedIndex == 0,
            onTap: () => onDestinationSelected(0),
            isCenter: false,
          ),
          _NavItem(
            icon: 'assets/icons/search.svg',
            label: 'Поиск',
            isSelected: selectedIndex == 1,
            onTap: () => onDestinationSelected(1),
            isCenter: false,
          ),
          _NavItem(
            icon: 'assets/icons/plus.svg',
            label: '',
            isSelected: selectedIndex == 2,
            onTap: () => onDestinationSelected(2),
            isCenter: true,
          ),
          _NavItem(
            icon: 'assets/icons/discussion.svg',
            label: 'Чат',
            isSelected: selectedIndex == 3,
            onTap: () => onDestinationSelected(3),
            isCenter: false,
          ),
          _NavItem(
            icon: 'assets/icons/profile.svg',
            label: 'Профиль',
            isSelected: selectedIndex == 4,
            onTap: () => onDestinationSelected(4),
            isCenter: false,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCenter;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    if (isCenter) {
      // Центральная пятиугольная кнопка (идеальная)
      return Container(
        width: 100,
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: 80,
            height: 80,
            child: ClipPath(
              clipper: PentagonClipper(),
              child: Container(
                color: const Color(0xFFFFD600),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 40,
                    height: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    // Обычные кнопки
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: isSelected
                  ? BoxDecoration(
                      color: const Color(0xFFFFD600),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ),
            if (label.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}