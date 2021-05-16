part of 'layanan.bloc.dart';

abstract class LayananEvent extends Equatable {
  const LayananEvent();

  @override
  List<Object> get props => [];
}

class LayananLoadEvent extends LayananEvent {
  final String search;
  final int limit, offset;
  const LayananLoadEvent(
      {@required this.search, @required this.limit, @required this.offset});
  @override
  List<Object> get props => [search, limit, offset];
}
