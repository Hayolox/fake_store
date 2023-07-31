import 'package:flutter/cupertino.dart';
import 'package:skeletons/skeletons.dart';

class DetailLoad extends StatelessWidget {
  const DetailLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: Column(
        children: [
          const SkeletonLine(
            style: SkeletonLineStyle(
              height: 250,
            ),
          ),
          Expanded(
            child: SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 3,
                spacing: 6,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                  minLength: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
