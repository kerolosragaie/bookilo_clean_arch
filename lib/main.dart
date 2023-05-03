import 'package:bookilo_clean_arch/core/constants/constants.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'core/constants/app_theme.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookiloCA());

  //? Hive
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
}

class BookiloCA extends StatelessWidget {
  const BookiloCA({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      title: 'BOOKILO CA',
      theme: kAppTheme,
      routerConfig: AppRouter.router,
    );
  }
}
