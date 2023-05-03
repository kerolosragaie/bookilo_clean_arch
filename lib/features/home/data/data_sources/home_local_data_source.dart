import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDatasource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    throw UnimplementedError();
  }
}
