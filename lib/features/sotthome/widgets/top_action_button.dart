import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopActionButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const TopActionButton({
    required this.iconPath,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16), // чуть больше радиус
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(20.0), // больше паддинг
              child: SvgPicture.asset(
                iconPath,
                width: 38, // больше размер иконки
                height: 38,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // чуть больше отступ
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600), // чуть больше шрифт
        ),
      ],
    );
  }
}