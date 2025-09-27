import 'package:flutter/material.dart';

import '../responsive/colors.dart';

class SearchTab extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final String text;
  const SearchTab({
    Key? key,
    required this.icon,
    this.isActive = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Icon(icon, size: 18, color: isActive ? blueColor : Colors.grey),
            const SizedBox(width: 3),
            Text(
              text,
              style: TextStyle(
                color: isActive ? blueColor : Colors.grey,
                fontSize: 15,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        isActive
            ? Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: isActive ? blueColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            : Container(),
      ],
    );
  }
}
