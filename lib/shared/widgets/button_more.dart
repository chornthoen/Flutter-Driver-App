import 'package:flutter/material.dart';

class ButtonMore extends StatefulWidget {
  const ButtonMore({super.key});

  @override
  State<ButtonMore> createState() => _ButtonMoreState();
}

class _ButtonMoreState extends State<ButtonMore> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: const [
                  Icon(
                    Icons.save,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('រក្សាទុក'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 1,
              child: Row(
                children: const [
                  Icon(
                    Icons.report_gmailerrorred_sharp,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('រាយការណ៍ពីបញ្ហា'),
                ],
              ),
            ),
          ];
        });
  }
}
