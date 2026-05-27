import 'package:flutter/material.dart';

class SectionUnderline extends StatelessWidget {
  const SectionUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 4,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
