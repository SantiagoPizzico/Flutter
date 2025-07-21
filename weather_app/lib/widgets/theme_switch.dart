import 'package:flutter/material.dart';

class ThemeSwitch extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onChanged;

  const ThemeSwitch({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          isDark ? 'assets/icons/01n.png' : 'assets/icons/01d.png',
          width: 28,
          height: 28,
        ),
        Switch(
          value: isDark,
          onChanged: onChanged,
          activeColor: Colors.black,
          inactiveThumbColor: Colors.white,
        ),
      ],
    );
  }
}
