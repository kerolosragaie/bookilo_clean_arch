import 'package:bookilo_clean_arch/core/utils/styles.dart';
import 'package:bookilo_clean_arch/core/widgets/widget_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final num? oldPrice;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final Function onPressed;
  final double? fontSize;
  final bool isLoading;
  const CustomButton(
      {super.key,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.borderRadius,
      required this.onPressed,
      required this.text,
      this.fontSize,
      this.oldPrice,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: oldPrice == null
            ? _buildIsLoadingWidget()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${oldPrice!} \$",
                    style: Styles.textStyle14.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: Styles.textStyle20.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                  )
                ],
              ),
        onPressed: () => onPressed(),
      ),
    );
  }

  Widget _buildIsLoadingWidget() {
    return !isLoading
        ? Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
            ),
          )
        : const Center(child: LoadingIndicatorWidget());
  }
}
