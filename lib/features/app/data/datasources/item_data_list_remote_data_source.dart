import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';

abstract class ItemDataListRemoteDataSource {
  Future<Map<String, ItemDataModel>> getItemDataList();

  Future<ItemDataModel> getItemDataById(String id);
}

class ItemDataListRemoteDataSourceImpl implements ItemDataListRemoteDataSource {
  final http.Client client;

  ItemDataListRemoteDataSourceImpl({@required this.client});

  @override
  Future<Map<String, ItemDataModel>> getItemDataList() async {
    final response = await client.get(
      'https://jptapp-4228f.firebaseio.com/.json',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 && response.body != null.toString()) {
      var itemDataListModel = itemDataModelFromJson(response.body);
      itemDataListModel.removeEmptyDataLists();
      return itemDataListModel;
    }
    return throw ServerException();
  }

  @override
  Future<ItemDataModel> getItemDataById(String id) async {
    final response = await client.get(
      'https://jptapp-4228f.firebaseio.com/$id.json',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 && response.body != null.toString()) {
      Map<String, ItemDataModel> itemDataByIdModel = {
        id: ItemDataModel.fromJson(jsonDecode(response.body))
      };
      itemDataByIdModel.removeEmptyDataLists();
      return itemDataByIdModel.values.first;
    }
    return throw ServerException();
  }
}
