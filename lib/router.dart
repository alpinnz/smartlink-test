import 'package:flutter/animation.dart';
import 'package:sailor/sailor.dart';
import 'package:smartlink/screen/cart.screen.dart';
import 'package:smartlink/screen/home.screen.dart';
import 'package:smartlink/screen/transaction.screen.dart';

class Routes {
  static final sailor = Sailor(
    options: SailorOptions(
      handleNameNotFoundUI: true,
      isLoggingEnabled: true,
      // defaultTransitions: [
      //   SailorTransition.slide_from_bottom,
      //   SailorTransition.zoom_in,
      // ],
      // defaultTransitionCurve: Curves.easeOutBack,
      // defaultTransitionDuration: Duration(milliseconds: 500),
    ),
  );

  static void createRoutes() {
    sailor.addRoutes(
      [
        SailorRoute(
          name: "/",
          builder: (context, args, params) => HomeScreen(),
        ),
        SailorRoute(
          name: "/cart",
          defaultTransitions: [SailorTransition.slide_from_right],
          builder: (context, args, params) => CartScreen(),
        ),
        SailorRoute(
          name: "/transaction",
          defaultTransitions: [SailorTransition.slide_from_right],
          builder: (context, args, params) => TransactionScreen(),
        ),
      ],
    );
  }
}
