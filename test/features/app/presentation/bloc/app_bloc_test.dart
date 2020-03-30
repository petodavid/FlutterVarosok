import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_event.dart';
import 'package:mockito/mockito.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_state.dart';

class MockGetItemDataList extends Mock implements GetItemDataList {}

void main() {
  AppBloc bloc;
  MockGetItemDataList mockGetItemDataList;
  setUp(() {
    mockGetItemDataList = MockGetItemDataList();
    bloc = AppBloc(getItemDataList: mockGetItemDataList);
  });

  test('initialState should be Empty', () {
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetTriviaForRandomNumber', () {
    final pdfLinks = [PdfLink(title: 'title', link: 'links')];
    final testHtml = [HtmlTag(title: 'tags', html: 'htmlCode')];
    final itemData = [
      ItemData(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
    ];
    final tItemDataList = ItemDataList(listData: itemData);
    test(
      'should get data',
      () async {
        when(mockGetItemDataList(any))
            .thenAnswer((_) async => Right(tItemDataList));
        bloc.dispatch(GetDataListForItems());
        await untilCalled(mockGetItemDataList(any));
        verify(mockGetItemDataList(NoParams()));
      },
    );
  });
}
