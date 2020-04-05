import 'package:flutter/material.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

import 'modal_bottom_sheet.dart';

class HomeListTile extends StatelessWidget {
  HomeListTile({@required this.items, @required this.index});
  final ItemDataList items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                kHomeListScreenStartGradient,
                kHomeListScreenEndGradient
              ],
            )),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            items.dataList[index].title[0],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        items.dataList[index].title,
      ),
      onTap: () => showModalDialogSheet(context, items.dataList[index]),
    );
  }
}
