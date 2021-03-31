import 'package:todocomputacomovel/models/tarefa.dart';

abstract class TarefaRepository {
  Future<void> salvar(Tarefa tarefa);
  Future<void> alterar(Tarefa tarefa);
  Future<List<Tarefa>> listar();
  Future<void> excluir(String id);
}
