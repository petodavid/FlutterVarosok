import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

import 'home_list_tile.dart';

class HomeListView extends StatelessWidget {
  final ItemDataList items;
  const HomeListView({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(indent: 50),
          itemCount: items.dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: HomeListTile(items: items, index: index),
                ),
              ),
            );
          }),
    );
  }
}
