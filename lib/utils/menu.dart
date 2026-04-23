import 'package:flutter/material.dart';
import 'package:siap/core/constants/constan.dart';

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onPres;

  const MenuIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onPres,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPres,
      behavior: HitTestBehavior.opaque,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: iconColor.withValues(),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: MyPalette.grey, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                icon,
                color: MyPalette.grey,
                size: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
