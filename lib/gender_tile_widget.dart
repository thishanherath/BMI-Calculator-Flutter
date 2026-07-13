import 'package:demo/constant.dart';
import 'package:flutter/material.dart';

class GenderTileWidget extends StatelessWidget {
  final bool isMale;
  final String text;
  final IconData icon;
  final Function onTap;
  const GenderTileWidget(
      {super.key,
      required this.isMale,
      required this.onTap,
      required this.text, required this.icon, });

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration:
            isMale ? KSelectedTileBorderDecoration : KTileBorderDecoration,
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
              color: KActiveTextColor,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: KActiveTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
