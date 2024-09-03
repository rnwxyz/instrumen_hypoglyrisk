import 'package:flutter/material.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';

class MenuComponent extends StatelessWidget {
  final Widget navigateTo;
  final IconData icon;
  final String title;
  const MenuComponent({
    super.key,
    required this.navigateTo,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return navigateTo;
            },
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: MyColor.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColor.primary.withOpacity(1),
              blurRadius: 10,
              offset: const Offset(0, 5),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
