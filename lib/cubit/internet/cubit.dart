import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

enum InternetState{Initial, Get, Lost}



class InternetCubit extends Cubit<InternetState>{
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit(): super(InternetState.Initial){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetState.Get);
      }
      else{
        emit(InternetState.Lost);
      }
    });
  }
@override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}