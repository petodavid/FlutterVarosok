import 'package:flutter/material.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:lottie/lottie.dart';
import 'package:theme_provider/theme_provider.dart';

class ArcBanner extends StatelessWidget {
  ArcBanner({this.height = 300, @required this.lottie});
  final double height;
  final LottieBuilder lottie;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return ClipPath(
        clipper: ArcClipper(),
        child: Container(
          width: screenWidth,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ThemeProvider.optionsOf<GradientOptions>(context)
                      .homeListScreenStartGradient,
                  ThemeProvider.optionsOf<GradientOptions>(context)
                      .homeListScreenEndGradient,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: lottie,
          ),
        ));
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
