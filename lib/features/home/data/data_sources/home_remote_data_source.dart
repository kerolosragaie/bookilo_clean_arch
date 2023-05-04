import 'package:bookilo_clean_arch/core/constants/constants.dart';
import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookilo_clean_arch/core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books_local.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDatasource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final ApiService apiService;

  HomeRemoteDatasourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> booksList = _parseBooksList(data);
    saveBooksLocal(booksList, kFeaturedBox);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=computer-science&Sorting=newest");
    List<BookEntity> booksList = _parseBooksList(data);
    saveBooksLocal(booksList, kNewestBox);
    return booksList;
  }

  List<BookEntity> _parseBooksList(Map<String, dynamic> data) {
    List<BookEntity> booksList = [];
    for (var item in data['items']) {
      booksList.add(BookModel.fromJson(item));
    }
    return booksList;
  }
}
