import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ItemDataListLocalDataSource {
  Future<Map<String, ItemDataModel>> getLastItemListData();

  Future<ItemDataModel> getLastItemDataById();

  Future<void> cacheItemDataList(Map<String, ItemDataModel> model);

  Future<void> cacheItemDataById(ItemDataModel model);
}

const CACHED_ITEM_DATA_LIST = 'CACHED_ITEM_DATA_LIST';
const CACHED_ITEM_DATA_BY_ID = 'CACHED_ITEM_DATA_BY_ID';

class ItemDataListLocalDataSourceImpl implements ItemDataListLocalDataSource {
  final SharedPreferences sharedPreferences;

  ItemDataListLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheItemDataList(Map<String, ItemDataModel> model) {
    return sharedPreferences.setString(
        CACHED_ITEM_DATA_LIST, itemDataMapModelToJson(model));
  }

  @override
  Future<Map<String, ItemDataModel>> getLastItemListData() {
    final jsonString = sharedPreferences.getString(CACHED_ITEM_DATA_LIST);
    if (jsonString != null) {
      return Future.value(itemDataModelFromJson(jsonString));
    } else {
      throw CacheExcepiton();
    }
  }

  @override
  Future<void> cacheItemDataById(ItemDataModel model) {
    return sharedPreferences.setString(
        CACHED_ITEM_DATA_BY_ID, jsonEncode(model.toJson()));
  }

  @override
  Future<ItemDataModel> getLastItemDataById() {
    final jsonString = sharedPreferences.getString(CACHED_ITEM_DATA_BY_ID);
    if (jsonString != null) {
      return Future.value(ItemDataModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheExcepiton();
    }
  }
}
