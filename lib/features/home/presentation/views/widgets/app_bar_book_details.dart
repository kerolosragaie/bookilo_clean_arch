import 'package:bookilo_clean_arch/core/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.xmark,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
          ),
          onPressed: () {
            SnackbarMessage.showErrorSnackBar(
              context: context,
              message: "Sorry, this feature not available right now!",
            );
          },
        ),
      ],
    );
  }
}
