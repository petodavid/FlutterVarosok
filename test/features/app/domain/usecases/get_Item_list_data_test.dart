import 'package:dartz/dartz.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/repositories/item_data_list_repository.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockItemListDataRepository extends Mock
    implements ItemListDataRepository {}

void main() {
  GetItemDataList usecase;
  MockItemListDataRepository mockItemListDataRepository;
  setUp(() {
    mockItemListDataRepository = MockItemListDataRepository();
    usecase = GetItemDataList(mockItemListDataRepository);
  });

  final pdfLinks = [PdfLink(title: 'title', link: 'links')];
  final testHtml = [HtmlTag(title: 'tags', html: 'htmlCode')];
  final itemData = [
    ItemData(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
  ];
  final itemDataList = ItemDataList(listData: itemData);

  test('should get the list data from the repository', () async {
    when(mockItemListDataRepository.getItemListData())
        .thenAnswer((_) async => Right(itemDataList));

    final result = await usecase(NoParams());
    expect(result, Right(itemDataList));
    verify(mockItemListDataRepository.getItemListData());
    verifyNoMoreInteractions(mockItemListDataRepository);
  });
}
