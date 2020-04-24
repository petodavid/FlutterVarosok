import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';

abstract class ItemDataListRemoteDataSource {
  Future<Map<String, ItemDataModel>> getItemListData();
}

class ItemDataListRemoteDataSourceImpl implements ItemDataListRemoteDataSource {
  final http.Client client;
  ItemDataListRemoteDataSourceImpl({@required this.client});

  @override
  Future<Map<String, ItemDataModel>> getItemListData() async {
    final response = await client.get(
      'https://jptapp-4228f.firebaseio.com/.json',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      var itemDataListModel = itemDataModelFromJson(response.body);
      itemDataListModel.removeEmptyDataLists();
      return itemDataListModel;
    }
    return throw ServerException();
  }
}
