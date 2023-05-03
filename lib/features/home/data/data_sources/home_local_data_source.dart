import 'package:bookilo_clean_arch/core/constants/constants.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDatasource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
