import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smartlink/bloc/cart/cart.bloc.dart';
import 'package:smartlink/bloc/trsansaction/transaction.bloc.dart';
import 'package:smartlink/model/cart.dart';
import 'package:smartlink/model/transaction.dart';
import 'package:smartlink/widget/navigation.button.widget.dart';
import 'package:smartlink/widget/transaction.modal.dart';

class CartScreen extends StatelessWidget {
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
          'CartScreen',
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
      body: Column(
        children: [
          Expanded(child: CartContent()),
          BlocConsumer<CartBloc, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.items.length > 0) {
                List<int> totalPrice =
                    state.items.map((e) => e.hargaTotal.toInt()).toList();
                var sum = totalPrice.reduce((a, b) => a + b);
                final formatCurrency =
                    new NumberFormat.simpleCurrency(locale: 'id_ID');
                return NavigationButtonWidget(
                  leftTop: 'Pembayaran',
                  leftBottom: 'Total tagihan - ${formatCurrency.format(sum)},-',
                  onPress: () {
                    transactionModal(
                        context: context,
                        items: context.read<CartBloc>().state.items);
                    // BlocProvider.of<TransactionBloc>(context)
                    //   ..add(
                    //     TransactionCreateEvent(
                    //       item: Transaction(
                    //         id: '',
                    //         keteragan: 'note',
                    //         tanggalBuat: '',
                    //         tanggalSelesai: '',
                    //         total: '',
                    //       ),
                    //       itemsCart: context.read<CartBloc>().state.items,
                    //     ),
                    //   );
                    // Routes.sailor.navigate("/trasaction");
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  CartContent({Key key}) : super(key: key);
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  Widget build(BuildContext context) {
    Widget buildResult(Cart cart) {
      return Card(
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.namaLayanan,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${cart.jumlahPembelian} Item - ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        Text('Edit'),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${formatCurrency.format(cart.hargaTotal)},-',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: state.items.length,
            itemBuilder: (context, i) {
              Cart cart = state.items[i];
              return buildResult(cart);
            },
          ),
        );
      },
    );
  }
}
