import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.title,
    required this.subtitle
  });

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Text(
         title,
         style: Theme.of(context).textTheme.titleLarge!.copyWith(
           fontWeight: FontWeight.bold,
           fontSize: 16,
         ),
       ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
