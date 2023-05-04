import 'package:bookilo_clean_arch/core/utils/app_bloc_obersver.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/app_theme.dart';
import 'core/constants/constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locater.dart' as di;
import 'features/home/domain/entities/book_entity.dart';
import 'features/home/presentation/views/manager/newest_books_cubit/newest_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //? Hive
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  await di.setupServiceLocater();
  Bloc.observer = AppBlocObserver();
  runApp(const BookiloCA());
}

class BookiloCA extends StatelessWidget {
  const BookiloCA({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(di.sl())..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(di.sl())..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        title: 'BOOKILO CA',
        theme: kAppTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
