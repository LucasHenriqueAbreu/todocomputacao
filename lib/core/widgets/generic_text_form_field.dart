import 'dart:async';

import 'package:flutter/material.dart';

class GenericTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorMsg;
  final int? maxLines;
  void Function(String?)? onSaved;
  final GlobalKey<FormState>? formKey;

  Timer? timer;

  GenericTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.errorMsg,
    this.maxLines,
    this.onSaved,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMsg ?? 'Este campo é obrigatório';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: (_) {
        /// Lógica para controle de validação, apenas quando o usuário parar de digitar.
        print('Usuário está digitando...');
        if (timer != null) {
          timer!.cancel();
        }
        timer = Timer(Duration(milliseconds: 500), () {
          print('Usuário parou de digitar...');
          formKey!.currentState!.validate();
        });
      },
    );
  }
}
