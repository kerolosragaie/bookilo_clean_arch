import 'package:bookilo_clean_arch/core/constants/assets_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String? imageUrl;
  final bool showButton;
  const CustomBookImage({
    super.key,
    this.showButton = false,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            imageUrl == null
                ? Image.asset(
                    AssetsData.kCoverNotAvailable,
                    fit: BoxFit.fill,
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
            showButton
                ? Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.withOpacity(0.6),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 34,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
