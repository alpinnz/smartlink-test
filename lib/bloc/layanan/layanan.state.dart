part of 'layanan.bloc.dart';

abstract class LayananState extends Equatable {
  final List<Layanan> items;

  LayananState({this.items});
  @override
  List<Object> get props => [items];
}

class LayananInitialState extends LayananState {
  LayananInitialState() : super(items: []);
}

class LayananLoadingState extends LayananState {
  LayananLoadingState.fromState(LayananState state) : super(items: state.items);
}

class LayananEmptyState extends LayananState {
  LayananEmptyState.fromState(LayananState state) : super(items: state.items);
}

class LayananSuccessState extends LayananState {
  final List<Layanan> items;
  LayananSuccessState.fromState(LayananState state, {@required this.items})
      : super(items: items);
}

class LayananFailedState extends LayananState {
  final String error;
  final exception;
  LayananFailedState.fromState(LayananState state,
      {@required this.error, this.exception})
      : super(items: state.items);
}
