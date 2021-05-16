part of 'transaction.bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionCreateEvent extends TransactionEvent {
  final List<Cart> itemsCart;
  final Transaction item;
  TransactionCreateEvent({@required this.item, @required this.itemsCart});
  @override
  List<Object> get props => [item];
}
