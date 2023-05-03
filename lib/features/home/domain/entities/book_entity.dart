import 'package:hive_flutter/adapters.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final int? ratingCount;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    required this.ratingCount,
  });
}
