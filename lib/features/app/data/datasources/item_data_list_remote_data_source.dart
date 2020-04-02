import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

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
      itemDataListModel.dataList
          .removeWhere((item) => item.title.trim().isEmpty);
      return itemDataListModel;
    }
    return throw ServerException();
  }
}
