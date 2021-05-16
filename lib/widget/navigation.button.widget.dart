import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  final Function onPress;
  final String leftTop, leftBottom;
  NavigationButtonWidget({Key key, this.onPress, this.leftTop, this.leftBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          if (onPress != null) {
            onPress();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
          height: 55,
          padding: EdgeInsets.all(8),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$leftTop',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '$leftBottom',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 35,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
