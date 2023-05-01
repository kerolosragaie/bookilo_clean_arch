import 'package:bookilo_clean_arch/core/constants/assets_data.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'text_field_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextField(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                "Search Result",
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.kTalkingBook,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "Let's search",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
