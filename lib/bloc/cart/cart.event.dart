part of 'cart.bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoadEvent extends CartEvent {
  const CartLoadEvent();
  @override
  List<Object> get props => [];
}

class CartAddEvent extends CartEvent {
  final Cart cart;
  const CartAddEvent({@required this.cart});

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'AddCart ${cart.id}';
}

class CartQualityIncrementEvent extends CartEvent {
  final String id;
  const CartQualityIncrementEvent({@required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'CartId $id';
}

class CartQualityDecrementEvent extends CartEvent {
  final String id;
  const CartQualityDecrementEvent({@required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'CartId $id';
}

class CartSelectByIdEvent extends CartEvent {
  final String id;
  final bool isSelect;
  const CartSelectByIdEvent({@required this.id, @required this.isSelect});

  @override
  List<Object> get props => [id, isSelect];

  @override
  String toString() => 'CartId $id select $isSelect';
}

class CartSelectAllEvent extends CartEvent {
  final bool isSelect;
  const CartSelectAllEvent({@required this.isSelect});

  @override
  List<Object> get props => [isSelect];

  @override
  String toString() => ' select $isSelect';
}

class CartEditEvent extends CartEvent {
  final String id;
  final Cart cart;
  const CartEditEvent({@required this.id, this.cart});

  @override
  List<Object> get props => [id, cart];

  @override
  String toString() => 'EditCart $id';
}

class CartDeleteEvent extends CartEvent {
  final String id;
  const CartDeleteEvent({@required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'RemoveCart $id';
}

class CartClearEvent extends CartEvent {
  const CartClearEvent();

  @override
  List<Object> get props => [];
}
