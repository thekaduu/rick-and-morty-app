import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ricknmorty/styles/app_colors.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final bool showBack;
  late Color iconColor;

  Header({
    Key? key,
    required this.showBack,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: showBack
          ? IconButton(
              onPressed: () => {},
              icon: Icon(
                CupertinoIcons.chevron_left,
                color: iconColor,
              ))
          : Container(),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.menu,
            color: iconColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(58);
}
