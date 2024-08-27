import 'package:flutter/material.dart';


//ignore: must_be_immutable
class ListSettingWidgets extends StatefulWidget {

   ListSettingWidgets({super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  static const routePath = '/list-setting-widgets';
  @override
  State<ListSettingWidgets> createState() => _ListSettingWidgetsState();
  final String title;
  final IconData icon;
  void Function()? onTap;
}

class _ListSettingWidgetsState extends State<ListSettingWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        onTap: widget.onTap,
        leading: Icon(widget.icon),
        title: Text(widget.title),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
