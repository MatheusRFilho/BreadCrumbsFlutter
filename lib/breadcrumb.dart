import 'package:breadcrumbs/breadcrumb_item.dart';
import 'package:breadcrumbs/main.dart';
import 'package:flutter/material.dart';

List<Widget> breadcrumbs = [BreadcrumbItem(text: HomePage.route)];

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      height: 40.0,
      width: double.infinity,
      color: Color(0xffe9ec),
      child: Row(
        children: breadcrumbs.map((breadcrumb) => breadcrumb).toList(),
      ),
    );
  }
}
