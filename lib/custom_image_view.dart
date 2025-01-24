import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//add this plugin cached_network_image: ^3.3.1
///add this plugin shimmer: ^3.0.0
//

class CustomeImageview extends StatelessWidget {
  CustomeImageview({super.key, required this.imageUrl});
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CircleAvatar(
      radius: width * 0.068,
      backgroundColor: Colors.grey[200],
      child: CachedNetworkImage(
        imageUrl:
        imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/150',
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: width * 0.068,
            backgroundColor: Colors.grey[200],
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: width * 0.068,
          backgroundImage: imageProvider,
        ),
      ),
    );
  }
}
