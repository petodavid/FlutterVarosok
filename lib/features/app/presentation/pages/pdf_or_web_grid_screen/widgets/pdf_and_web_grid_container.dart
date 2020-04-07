import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/constants/colors.dart';

class PdfAndWebGridContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  PdfAndWebGridContainer({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [kHomeListScreenStartGradient, kHomeListScreenEndGradient],
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: FaIcon(
                icon,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 4,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
