import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool isSliverWidget;
  const LoadingIndicatorWidget({
    Key? key,
    this.isSliverWidget = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSliverWidget
        ? SliverToBoxAdapter(child: _buildWidget(context))
        : _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
