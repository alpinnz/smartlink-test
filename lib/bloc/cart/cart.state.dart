part of 'cart.bloc.dart';

abstract class CartState extends Equatable {
  final List<Cart> items;

  CartState({this.items});
  @override
  List<Object> get props => [items];
}

class CartInitialState extends CartState {
  CartInitialState() : super(items: []);
}

class CartEmptyState extends CartState {
  CartEmptyState() : super(items: []);
}

class CartLoadingState extends CartState {
  CartLoadingState.fromState(CartState state) : super(items: state.items);
}

class CartSuccessState extends CartState {
  final List<Cart> items;

  CartSuccessState.fromState(CartState state, {@required this.items})
      : super(items: items);
}

class CartFailedState extends CartState {
  final String error;
  final exception;

  CartFailedState.fromState(CartState state,
      {@required this.error, this.exception})
      : super(items: state.items);
}
