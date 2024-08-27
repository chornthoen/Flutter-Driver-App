import 'package:flutter/material.dart';

class ButtonReuseWidget extends StatelessWidget {
  const ButtonReuseWidget({
    super.key,
    required this.text,
    required this.color,
    this.width = double.infinity,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final double? width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          maximumSize: Size(MediaQuery.of(context).size.width, 56),
          minimumSize: Size(MediaQuery.of(context).size.width, 56),
          backgroundColor: color,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
