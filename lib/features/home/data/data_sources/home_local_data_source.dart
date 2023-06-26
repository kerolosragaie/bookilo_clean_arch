import 'package:bookilo_clean_arch/core/constants/constants.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDatasource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int listLength = box.values.length;
    if (startIndex >= listLength || endIndex > listLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
