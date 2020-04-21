import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/presentation/pages/detail_list_screen/widgets/detaill_list_items.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';
import 'package:theme_provider/theme_provider.dart';

class DetailListScreen extends StatelessWidget {
  final ItemData itemData;
  DetailListScreen({@required this.itemData});

  @override
  Widget build(BuildContext context) {
    final detailListScreenItems = getDetailScreenItemsList(context, itemData);
    return Scaffold(
      appBar: appBarWithTitle(context, itemData.title),
      backgroundColor:
          ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      body: ListView.separated(
        itemCount: detailListScreenItems.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: ThemeProvider.themeOf(context).data.iconTheme.color,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: detailListScreenItems[index].title,
            leading: detailListScreenItems[index].image,
            onTap: detailListScreenItems[index].onTap,
          );
        },
      ),
    );
  }
}
