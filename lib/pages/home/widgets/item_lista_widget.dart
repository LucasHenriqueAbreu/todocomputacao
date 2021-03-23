import 'package:flutter/material.dart';
import 'package:todocomputacomovel/models/tarefa.dart';

class ItemListaWidget extends StatefulWidget {
  final Tarefa tarefa;

  const ItemListaWidget({Key? key, required this.tarefa}) : super(key: key);

  @override
  _ItemListaWidgetState createState() => _ItemListaWidgetState();
}

class _ItemListaWidgetState extends State<ItemListaWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.tarefa.titulo!),
      subtitle: Text(widget.tarefa.descricao!),
      value: widget.tarefa.pronta,
      onChanged: (bool? value) {
        setState(() {
          widget.tarefa.pronta = value!;
        });
      },
    );
  }
}
