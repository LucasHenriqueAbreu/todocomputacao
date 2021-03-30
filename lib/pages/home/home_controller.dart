import 'package:flutter/material.dart';
import 'package:todocomputacomovel/models/tarefa.dart';

class HomeController {
  final ValueNotifier<List<Tarefa>> tarefas = ValueNotifier([]);

  final ValueNotifier<int> count = ValueNotifier(0);

  adicionarTarefas(Tarefa tarefa) {
    tarefas.value.add(tarefa);
    tarefas.notifyListeners();
  }

  addCount() {
    count.value++;
  }
}
