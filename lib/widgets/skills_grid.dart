import 'package:flutter/material.dart';
import 'package:sumit_portfolio/values/strings.dart';

class SkillsGrid extends StatelessWidget {
  final double aspectRatio;
  final int crossAxisCount;

  const SkillsGrid({
    this.aspectRatio=1,
    required this.crossAxisCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: aspectRatio,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      children: List.generate(
        skillsList.length,
        (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                skillsList[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
