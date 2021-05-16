part of 'transaction.bloc.dart';

abstract class TransactionState extends Equatable {
  final List<Transaction> items;

  TransactionState({this.items});
  @override
  List<Object> get props => [items];
}

class TransactionInitialState extends TransactionState {
  TransactionInitialState() : super(items: []);
}

class TransactionLoadingState extends TransactionState {
  TransactionLoadingState.fromState(TransactionState state)
      : super(items: state.items);
}

class TransactionEmptyState extends TransactionState {
  TransactionEmptyState.fromState(TransactionState state)
      : super(items: state.items);
}

class TransactionSuccessState extends TransactionState {
  final List<Transaction> items;
  TransactionSuccessState.fromState(TransactionState state,
      {@required this.items})
      : super(items: items);
}

class TransactionFailedState extends TransactionState {
  final String error;
  final exception;
  TransactionFailedState.fromState(TransactionState state,
      {@required this.error, this.exception})
      : super(items: state.items);
}
