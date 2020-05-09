import 'package:flutter/material.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/presentation/pages/detail_list_screen/detail_list_screen.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeListTile extends StatelessWidget {
  HomeListTile({@required this.items, @required this.index});

  final Map<String, ItemData> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                ThemeProvider.optionsOf<GradientOptions>(context)
                    .homeListScreenStartGradient,
                ThemeProvider.optionsOf<GradientOptions>(context)
                    .homeListScreenEndGradient,
              ],
            )),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            items.values.elementAt(index).title[0],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        items.values.elementAt(index).title,
        style: ThemeProvider.themeOf(context).data.textTheme.headline5,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailListScreen(
              itemData: items.values.elementAt(index),
            ),
          ),
        );
      },
    );
  }
}
