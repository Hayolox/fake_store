import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skeletons/skeletons.dart';

class HomeLoad extends StatelessWidget {
  const HomeLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return const SkeletonItem(
            child: SkeletonLine(
              style: SkeletonLineStyle(
                height: 250,
                width: 250,
              ),
            ),
          );
        },
      ),
    );
  }
}
