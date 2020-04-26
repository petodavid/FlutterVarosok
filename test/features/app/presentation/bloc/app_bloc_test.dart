import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_data_by_id.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_event.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_state.dart';
import 'package:mockito/mockito.dart';

class MockGetItemDataList extends Mock implements GetItemDataList {}

class MockGetItemDataById extends Mock implements GetItemDataById {}

void main() {
  // ignore: close_sinks
  AppBloc bloc;
  MockGetItemDataList mockGetItemDataList;
  MockGetItemDataById mockGetItemDataById;
  setUp(() {
    mockGetItemDataList = MockGetItemDataList();
    mockGetItemDataById = MockGetItemDataById();

    bloc = AppBloc(
        getItemDataList: mockGetItemDataList,
        getItemDataById: mockGetItemDataById);
  });

  test('initialState should be Empty', () {
    expect(bloc.initialState, equals(Empty()));
  });
  group('Get itemDataList', () {
    final pdfLinks = [PdfLinkModel(title: 'title', link: 'link')];
    final testHtml = [HtmlTagModel(title: 'title', html: 'htmlCode')];
    Map<String, ItemDataModel> tItemDataListModel = {
      '5veu2czb24':
          ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
    };
    test(
      'should get data',
      () async {
        when(mockGetItemDataList(any))
            .thenAnswer((_) async => Right(tItemDataListModel));
        bloc.add(GetDataListForItems());
        await untilCalled(mockGetItemDataList(any));
        verify(mockGetItemDataList(NoParams()));
      },
    );
  });
}
