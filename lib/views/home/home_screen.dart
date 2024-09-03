import 'package:flutter/material.dart';
import 'package:instrumen_hypoglyrisk/utils/components/menu_component.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:instrumen_hypoglyrisk/views/history/history_screen.dart';
import 'package:instrumen_hypoglyrisk/views/manual_book_screen.dart';
import 'package:instrumen_hypoglyrisk/views/screening/screening_screen_a.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: Background(),
      child: const SafeArea(
        minimum: EdgeInsets.all(60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // logo
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  width: 200,
                ),
              ),
              // menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MenuComponent(
                    navigateTo: ScreeningScreenA(),
                    icon: Icons.list_alt,
                    title: 'Periksa',
                  ),
                  SizedBox(width: 50),
                  MenuComponent(
                    navigateTo: HistoryScreen(),
                    icon: Icons.history,
                    title: 'Riwayat',
                  ),
                ],
              ),
              SizedBox(height: 40),
              MenuComponent(
                navigateTo: ManualBookScreen(),
                icon: Icons.menu_book_rounded,
                title: 'Riwayat',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // circle1
    final paint_1 = Paint();
    paint_1.color = MyColor.secondary;
    paint_1.style = PaintingStyle.fill;
    final center_1 = Offset(1 / size.width, size.height / 1.3);
    final radius_1 = size.width * 0.7;
    canvas.drawCircle(center_1, radius_1, paint_1);

    // circle2
    final paint_2 = Paint();
    paint_2.color = MyColor.tertiary;
    paint_2.style = PaintingStyle.fill;
    final center_2 = Offset(size.width / 1.42, size.height / 0.97);
    final radius_2 = size.width * 0.7;
    canvas.drawCircle(center_2, radius_2, paint_2);

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
