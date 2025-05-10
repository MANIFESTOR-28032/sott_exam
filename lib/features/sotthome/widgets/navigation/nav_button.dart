import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.black12,
          highlightColor: Colors.transparent,
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
      ),
    );
  }
}

class CenterButton extends StatelessWidget {
  final VoidCallback onTap;

  const CenterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.black12,
          highlightColor: Colors.transparent,
          customBorder: const CircleBorder(),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Vector.svg',
                  width: 80,
                  height: 80,
                ),
                SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 40,
                  height: 40,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          NavButton(
            icon: 'assets/icons/logo.svg',
            label: 'Главная',
            isSelected: selectedIndex == 0,
            onTap: () => onDestinationSelected(0),
          ),
          NavButton(
            icon: 'assets/icons/search.svg',
            label: 'Поиск',
            isSelected: selectedIndex == 1,
            onTap: () => onDestinationSelected(1),
          ),
          CenterButton(
            onTap: () => onDestinationSelected(2),
          ),
          NavButton(
            icon: 'assets/icons/discussion.svg',
            label: 'Чат',
            isSelected: selectedIndex == 3,
            onTap: () => onDestinationSelected(3),
          ),
          NavButton(
            icon: 'assets/icons/profile.svg',
            label: 'Профиль',
            isSelected: selectedIndex == 4,
            onTap: () => onDestinationSelected(4),
          ),
        ],
      ),
    );
  }
}
