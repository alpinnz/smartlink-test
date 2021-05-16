import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartlink/bloc/cart/cart.bloc.dart';
import 'package:smartlink/model/cart.dart';
import 'package:smartlink/model/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

part 'transaction.event.dart';
part 'transaction.state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitialState());

  final databaseReference = firestore.FirebaseFirestore.instance;

  Future createRecord(Transaction transaction, List<Cart> listCart) async {
    // await databaseReference.collection("transaction").doc('1').set({
    //   'title': 'Mastering Flutter',
    //   'description': 'Programming Guide for Dart'
    // });

    final createTransaction = await databaseReference
        .collection("transaction")
        .add(transaction.toJson());

    print(createTransaction.id);
    listCart.forEach((e) {
      e.idTransaksi = createTransaction.id;
      databaseReference.collection("cart").add(e.toJson());
    });
  }

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    // await documentReferencer
    //     .set(data)
    //     .whenComplete(() => print("Notes item added to the database"))
    //     .catchError((e) => print(e));

    if (event is TransactionCreateEvent) {
      yield TransactionLoadingState.fromState(state);

      try {
        final data = await createRecord(event.item, event.itemsCart);
        // print(data);

        // await documentReferencer
        // .set(data)
        // .whenComplete(() => print("Notes item added to the database"))
        // .catchError((e) => print(e));
        await Future.delayed(Duration(seconds: 1), () {});
        // if (data is List<Transaction>) {
        //   if (data.length > 0) {
        //     yield TransactionSuccessState.fromState(
        //       state,
        //       items: data,
        //     );
        //     return;
        //   } else {
        //     yield TransactionEmptyState.fromState(state);
        //     return;
        //   }
        // }

        // yield TransactionFailedState.fromState(
        //   state,
        //   error: data.toString(),
        //   exception: data,
        // );

        // _saveCart(carts);
      } catch (error) {
        yield TransactionFailedState.fromState(
          state,
          error: error.toString(),
          exception: error,
        );
      }
    }
  }
}
