import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ItemDataListLocalDataSource {
  Future<ItemDataListModel> getLastItemListData();
  Future<void> cacheItemListData(ItemDataListModel model);
}

const CACHED_ITEM_DATA_LIST = 'CACHED_ITEM_DATA_LIST';

class ItemDataListLocalDataSourceImpl implements ItemDataListLocalDataSource {
  final SharedPreferences sharedPreferences;
  ItemDataListLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheItemListData(ItemDataListModel model) {
    return sharedPreferences.setString(
        CACHED_ITEM_DATA_LIST, itemDatalistModeToJson(model));
  }

  @override
  Future<ItemDataListModel> getLastItemListData() {
    final jsonString = sharedPreferences.getString(CACHED_ITEM_DATA_LIST);
    if (jsonString != null) {
      return Future.value(itemDataListModelFromJson(jsonString));
    } else {
      throw CacheExcepiton();
    }
  }
}
