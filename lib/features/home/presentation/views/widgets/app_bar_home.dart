import 'package:bookilo_clean_arch/core/utils/app_router.dart';
import 'package:bookilo_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "BOOKILO",
          style: Styles.appLogo,
        ),
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
          onPressed: () {
            GoRouter.of(context).push(kSearchView);
          },
        ),
      ],
    );
  }
}
