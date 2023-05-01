import 'package:flutter/material.dart';
import 'core/constants/app_theme.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookiloCA());
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
