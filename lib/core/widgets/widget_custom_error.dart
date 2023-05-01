import 'package:bookilo_clean_arch/core/constants/assets_data.dart';
import 'package:bookilo_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? title;
  final String errorMessage;
  final bool isSliverWidget;
  const CustomErrorWidget({
    Key? key,
    required this.errorMessage,
    this.title,
    this.isSliverWidget = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSliverWidget
        ? SliverToBoxAdapter(
            child: _buildWidget(context),
          )
        : _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.kSadBook,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "ERROR!",
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(color: Colors.red),
                ),
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
