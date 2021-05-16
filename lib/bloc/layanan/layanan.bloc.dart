import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smartlink/model/layanan.dart';
import 'package:smartlink/provider/layanan.provider.dart';

part 'layanan.event.dart';
part 'layanan.state.dart';

class LayananBloc extends Bloc<LayananEvent, LayananState> {
  final LayananProvider provider;
  LayananBloc({@required this.provider}) : super(LayananInitialState());

  @override
  Stream<LayananState> mapEventToState(
    LayananEvent event,
  ) async* {
    if (event is LayananLoadEvent) {
      yield LayananLoadingState.fromState(state);

      try {
        final data = await provider.getService(
            search: event.search, limit: event.limit, offset: event.offset);
        await Future.delayed(Duration(seconds: 1), () {});
        if (data is List<Layanan>) {
          if (data.length > 0) {
            yield LayananSuccessState.fromState(
              state,
              items: data,
            );
            return;
          } else {
            yield LayananEmptyState.fromState(state);
            return;
          }
        }

        yield LayananFailedState.fromState(
          state,
          error: data.toString(),
          exception: data,
        );

        // _saveCart(carts);
      } catch (error) {
        yield LayananFailedState.fromState(
          state,
          error: error.toString(),
          exception: error,
        );
      }
    }
  }
}
