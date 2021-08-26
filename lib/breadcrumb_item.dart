import 'package:flutter/material.dart';

import 'breadcrumb.dart';

class BreadcrumbItem extends StatefulWidget {
  final String text;
  final IconData? icon;

  BreadcrumbItem({required this.text, this.icon});

  @override
  _BreadcrumbItemState createState() => _BreadcrumbItemState();
}

class _BreadcrumbItemState extends State<BreadcrumbItem> {
  bool onIt = false;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            (widget.text == '/') ? '' : ' / ',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 5,
          ),
          child: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: 15,
                )
              : const SizedBox.shrink(),
        ),
        GestureDetector(
          onTap: () {
            while (breadcrumbs.last != widget) {
              setState(() {
                Navigator.pop(context);
                breadcrumbs.removeLast();
              });
            }
          },
          child: MouseRegion(
            opaque: true,
            onEnter: (value) {
              setState(() {
                onIt = true;
                color = Colors.blue.shade800;
              });
            },
            onExit: (value) {
              setState(() {
                onIt = false;
                color = Colors.blue;
              });
            },
            child: Text(
              (widget.text == '/') ? 'Home' : widget.text.substring(1),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 0.3,
                color: (widget == breadcrumbs.last) ? Colors.black45 : color,
                decoration: (onIt)
                    ? (widget == breadcrumbs.last)
                        ? TextDecoration.none
                        : TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
