import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonHomeWidget extends StatelessWidget {
  const SkeletonHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(),
    );
  }
}
