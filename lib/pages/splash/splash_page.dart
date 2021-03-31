import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todocomputacomovel/pages/home/home_page.dart';
import 'package:todocomputacomovel/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.inicializaFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: controller.inicializado,
              builder: (_, __, ___) {
                if (controller.inicializado.value) {
                  _redirecionaParaHome();
                  return Text('Firebase Inicializado');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            ValueListenableBuilder(
              valueListenable: controller.erro,
              builder: (_, __, ___) {
                if (controller.erro.value) {
                  return Text('Erro ao inicialiar o firebase');
                } else {
                  return Container(
                    height: 0,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _redirecionaParaHome() {
    Timer(Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    });
  }
}
