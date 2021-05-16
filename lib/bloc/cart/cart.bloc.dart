import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartlink/model/cart.dart';

part 'cart.event.dart';
part 'cart.state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartLoadEvent) {
      // yield* _mapLoadCartToState();
    } else if (event is CartAddEvent) {
      yield* _mapAddCartToState(event);
    } else if (event is CartEditEvent) {
      yield* _mapUEditCartToState(event);
    }
  }

  Stream<CartState> _mapAddCartToState(CartAddEvent event) async* {
    yield CartLoadingState.fromState(state);
    try {
      final List<Cart> items = List.from(state.items)..add(event.cart);
      await Future.delayed(Duration(seconds: 1), () {});
      yield CartSuccessState.fromState(state, items: items);
    } catch (error) {
      yield CartFailedState.fromState(
        state,
        error: error.toString(),
        exception: error,
      );
    }
  }

  Stream<CartState> _mapUEditCartToState(CartEditEvent event) async* {
    yield CartLoadingState.fromState(state);
    try {
      final List<Cart> items = List.from(state.items)..add(event.cart);

      items.isNotEmpty ? items.removeWhere((item) => item.id == event.id) : [];

      yield CartSuccessState.fromState(state, items: items);
    } catch (error) {
      yield CartFailedState.fromState(
        state,
        error: error.toString(),
        exception: error,
      );
    }
  }
}
