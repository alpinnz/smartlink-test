import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smartlink/bloc/cart/cart.bloc.dart';
import 'package:smartlink/bloc/trsansaction/transaction.bloc.dart';
import 'package:smartlink/helper/string.dart';
import 'package:smartlink/model/cart.dart';
import 'package:smartlink/model/transaction.dart';

void transactionModal(
    {@required BuildContext context, @required List<Cart> items}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      TextEditingController customerController = TextEditingController();
      TextEditingController noteController = TextEditingController();

      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          List<int> listHarga = items.map((e) => e.hargaTotal.toInt()).toList();
          int totalHarga = listHarga.reduce((a, b) => a + b);

          List<int> listDurasi =
              items.map((e) => e.layanan.durasiPenyelesaian.toInt()).toList();
          int totalDurasi = listDurasi.reduce((a, b) => a + b);

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
                      height: 400,
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
                                        'selesai pada ${StringHelper.dateAdd(totalDurasi)}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        'Total item - ${items.length},-}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${StringHelper.price(totalHarga)}',
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
                                controller: customerController,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  filled: true,
                                  hintText: "Nama Customer",
                                  // fillColor: colorBgSearch,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: TextField(
                                controller: noteController,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.file_present,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  filled: true,
                                  hintText: "Keterangan",
                                  // fillColor: colorBgSearch,
                                ),
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
                                        // BlocProvider.of<TransactionBloc>(
                                        //     context)
                                        //   ..add(TransactionCreateEvent(
                                        //     item: Transaction(
                                        //       id: '',
                                        //       keteragan: 'note',
                                        //       tanggalBuat: '',
                                        //       tanggalSelesai: '',
                                        //       total: '',
                                        //     ),
                                        //     itemsCart: context
                                        //         .read<CartBloc>()
                                        //         .state
                                        //         .items,
                                        //   ));
                                      },
                                      child: Text(
                                        'Confirm',
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
