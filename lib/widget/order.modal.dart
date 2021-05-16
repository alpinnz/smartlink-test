import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_dart/ms_dart.dart';
import 'package:smartlink/bloc/cart/cart.bloc.dart';
import 'package:smartlink/model/cart.dart';
import 'package:smartlink/model/layanan.dart';
import 'package:smartlink/widget/icon.button.custom.dart';

void orderModal({@required BuildContext context, @required Layanan item}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      TextEditingController noteController = TextEditingController();
      int quality = 1;
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SafeArea(
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 5,
                        width: 35,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 2.0,
                              color: Colors.black38,
                            ),
                            bottom: BorderSide(
                              width: 2.0,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Layanan ${item.namaLayanan}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        'siap ${MS.fromMs(item.durasiPenyelesaian)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Rp ${item.harga.toInt()}/${item.namaSatuan}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: TextField(
                                controller: noteController,
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
                                  prefixIcon: Icon(
                                    Icons.insert_drive_file,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  filled: true,
                                  hintText:
                                      "tuliskan catatan khusus untuk pesanan anda",
                                  // fillColor: colorBgSearch,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButtonCustom(
                                    icon: Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        quality = quality + 1;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    '$quality',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  IconButtonCustom(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      if (quality > 1) {
                                        setState(() {
                                          quality = quality - 1;
                                        });
                                      } else {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: 45,
                                child: BlocConsumer<CartBloc, CartState>(
                                  listener: (context, state) {
                                    if (state is CartSuccessState) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is CartLoadingState) {
                                      return Center(
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return TextButton(
                                      onPressed: () {
                                        Cart cart = Cart(
                                            id: '',
                                            idLayanan: item.idlayanan,
                                            idTransaksi: '',
                                            hargaLayanan: item.harga,
                                            hargaTotal: item.harga * quality,
                                            jumlahPembelian: quality,
                                            namaLayanan: item.namaLayanan,
                                            layanan: item);
                                        BlocProvider.of<CartBloc>(context)
                                          ..add(CartAddEvent(cart: cart));
                                      },
                                      child: Text(
                                        'Tambah ke Keranjang - ${item.harga.toInt() * quality}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
