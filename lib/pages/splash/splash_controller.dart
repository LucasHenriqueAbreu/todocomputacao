import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class SplashController {
  ValueNotifier<bool> inicializado = ValueNotifier(false);
  ValueNotifier<bool> erro = ValueNotifier(false);

  void inicializaFirebase() async {
    try {
      await Firebase.initializeApp();
      Timer(Duration(seconds: 1), () {
        inicializado.value = true;
      });
    } catch (e) {
      erro.value = true;
    }
  }
}
