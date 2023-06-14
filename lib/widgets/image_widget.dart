


import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.errorAsset = "assets/images/download.png",
  }) : super(key: key);

  final String? imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final String errorAsset;

  @override
  Widget build(BuildContext context) {

    if(imageUrl == null ){
      return Image.asset(
        errorAsset,
        height: height,
        width: width,
        fit: BoxFit.cover,
      );
    }
    else {
      return Image.network(
        imageUrl!,
        fit: fit,
        height: height,
        width: width,
        errorBuilder: (error, object, stackTrace) {
          return Image.asset(
            errorAsset,
            height: height,
            width: width,
            fit: BoxFit.cover,
          );
        },
        loadingBuilder: (context, child, loadingProgress){
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            color: Colors.amber.shade100,
            height: height,
            width: width,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      );
    }
  }

}