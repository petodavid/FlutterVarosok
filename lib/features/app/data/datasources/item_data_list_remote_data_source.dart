import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:http/http.dart' as http;

abstract class ItemDataListRemoteDataSource {
  Future<ItemDataListModel> getItemListData();
}

class ItemDataListRemoteDataSourceImpl implements ItemDataListRemoteDataSource {
  final http.Client client;
  ItemDataListRemoteDataSourceImpl({@required this.client});

  @override
  Future<ItemDataListModel> getItemListData() async {
    final response = await client.get(
      'https://jptapp-4228f.firebaseio.com/.json',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      var itemDataListModel = itemDataListModelFromJson(response.body);
      itemDataListModel.removeEmptyDataLists();
      return itemDataListModel;
    }
    return throw ServerException();
  }
}
