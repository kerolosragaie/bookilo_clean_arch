import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeRepository {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
