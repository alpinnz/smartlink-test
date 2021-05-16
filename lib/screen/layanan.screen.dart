import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ms_dart/ms_dart.dart';
import 'package:smartlink/bloc/cart/cart.bloc.dart';
import 'package:smartlink/bloc/layanan/layanan.bloc.dart';
import 'package:smartlink/model/cart.dart';
import 'package:smartlink/model/layanan.dart';
import 'package:smartlink/router.dart';
import 'package:smartlink/widget/icon.button.custom.dart';
import 'package:smartlink/widget/navigation.button.widget.dart';
import 'package:smartlink/widget/order.modal.dart';
import 'package:smartlink/widget/search.widget.dart';

class LayananScreen extends StatelessWidget {
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
          'Pilih Layanan',
          style: TextStyle(color: colorAppBar),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorAppBar,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SearchWidget(
              hint: 'Cari layanan, misal : kemeja',
              onSubmit: (value) => BlocProvider.of<LayananBloc>(context)
                ..add(LayananLoadEvent(
                  search: value,
                  limit: 100,
                  offset: 0,
                )),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: LayananContext()),
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
                  leftTop: 'ringkasan Pesanan',
                  leftBottom:
                      '${state.items.length} Layanan - ${formatCurrency.format(sum)},-',
                  onPress: () => Routes.sailor.navigate("/cart"),
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

class LayananContext extends StatelessWidget {
  const LayananContext({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildResult(Layanan item) {
      return Card(
        child: ExpansionTile(
          leading: Icon(Icons.local_fire_department_sharp),
          title: Text(
            item.namaLayanan,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'untuk layanan ${item.namaLayanan}',
            style: TextStyle(),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                'untuk layanan ${item.namaLayanan} desc desc desc desc',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                hoverColor: Colors.black87,
                tileColor: Colors.blue[100],
                onTap: () {
                  orderModal(context: context, item: item);
                },
                title: Text(
                  'siap dalam waktu ${MS.fromMs(item.durasiPenyelesaian)}',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                trailing: Text(
                  'Rp ${item.harga.toInt()}/${item.namaSatuan}',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      );
    }

    return BlocConsumer<LayananBloc, LayananState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LayananInitialState) {
          BlocProvider.of<LayananBloc>(context)
            ..add(LayananLoadEvent(search: '', limit: 100, offset: 0));
        }

        if (state is LayananLoadingState) {
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
              Layanan layanan = state.items[i];
              if (!layanan.hapus || layanan.durasiPenyelesaian > 0) {
                return buildResult(layanan);
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
