import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  IconButtonCustom({Key key, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorTransparent = Colors.transparent;
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: colorTransparent,
        splashColor: colorTransparent,
        hoverColor: colorTransparent,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
      ),
    );
  }
}
