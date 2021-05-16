import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  final Color colorBgAppBar = Color(0xFFFFFFFF);
  final Color colorBg = Color(0xFFE0DFDF);
  final Color colorAppBar = Color(0xFF353535);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colorBgAppBar,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'TransactionScreen',
          style: TextStyle(color: colorAppBar),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorAppBar,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: TransactionContent(),
    );
  }
}

class TransactionContent extends StatelessWidget {
  const TransactionContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('TransactionContent'),
    );
  }
}
