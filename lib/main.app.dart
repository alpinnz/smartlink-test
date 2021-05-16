import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:smartlink/bloc/cart/cart.bloc.dart';
import 'package:smartlink/bloc/layanan/layanan.bloc.dart';
import 'package:smartlink/bloc/trsansaction/transaction.bloc.dart';
import 'package:smartlink/provider/layanan.provider.dart';
import 'package:smartlink/router.dart';
import 'package:smartlink/screen/layanan.screen.dart';

class MainApp extends StatelessWidget {
  final LayananProvider serviceProvider = LayananProvider();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayananBloc>(
          create: (BuildContext context) => LayananBloc(
            provider: serviceProvider,
          ),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        BlocProvider<TransactionBloc>(
          create: (BuildContext context) => TransactionBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<LayananBloc>(
          lazy: false,
          create: (BuildContext context) => LayananBloc(
            provider: serviceProvider,
          ),
          child: LayananScreen(),
        ),
        onGenerateRoute: Routes.sailor.generator(),
        navigatorKey: Routes.sailor.navigatorKey,
        navigatorObservers: [
          SailorLoggingObserver(),
          Routes.sailor.navigationStackObserver,
        ],
      ),
    );
  }
}
