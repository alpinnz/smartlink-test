import 'package:flutter/material.dart';
import 'package:smartlink/widget/icon.button.custom.dart';

class SearchWidget extends StatefulWidget {
  final String hint;
  final Function(String) onSubmit;
  SearchWidget({Key key, this.hint, this.onSubmit}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final Color colorBgSearch = Color(0xFFE8EBFF);
  final Color colorSearch = Colors.grey[800];
  final Color colorTextSearch = Colors.grey[600];

  TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    // controller.addListener(() {
    //   widget.onChanged(controller.text);
    // });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSubmit() {
    widget.onSubmit(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      // onChanged: (value) => widget.onChanged(value),
      decoration: new InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        prefixIcon: IconButtonCustom(
          icon: Icon(
            Icons.search,
            color: colorSearch,
          ),
          onPressed: () => onSubmit(),
        ),
        suffixIcon: controller.text.length > 0
            ? IconButtonCustom(
                icon: Icon(
                  Icons.clear,
                  color: colorSearch,
                ),
                onPressed: () => controller.clear(),
              )
            : null,
        contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        filled: true,
        hintStyle: TextStyle(color: colorTextSearch),
        hintText: widget.hint ?? "hint Text",
        fillColor: colorBgSearch,
      ),
    );
  }
}
