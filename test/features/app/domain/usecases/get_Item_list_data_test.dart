import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:jpt_app/features/app/domain/repositories/item_data_list_repository.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';
import 'package:mockito/mockito.dart';

class MockItemListDataRepository extends Mock
    implements ItemListDataRepository {}

void main() {
  GetItemDataList usecase;
  MockItemListDataRepository mockItemListDataRepository;
  setUp(() {
    mockItemListDataRepository = MockItemListDataRepository();
    usecase = GetItemDataList(mockItemListDataRepository);
  });

  final pdfLinks = [PdfLinkModel(title: 'title', link: 'link')];
  final testHtml = [HtmlTagModel(title: 'title', html: 'htmlCode')];
  Map<String, ItemDataModel> tItemDataListModel = {
    '5veu2czb24':
        ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
  };

  test('should get the list data from the repository', () async {
    when(mockItemListDataRepository.getItemListData())
        .thenAnswer((_) async => Right(tItemDataListModel));

    final result = await usecase(NoParams());
    expect(result, Right(tItemDataListModel));
    verify(mockItemListDataRepository.getItemListData());
    verifyNoMoreInteractions(mockItemListDataRepository);
  });
}
