import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todocomputacomovel/core/repositories/tarefa/tarefa_repository.dart';
import 'package:todocomputacomovel/models/tarefa.dart';

class TarefaRepositoryImpl implements TarefaRepository {
  final FirebaseFirestore firebaseFirestore;

  TarefaRepositoryImpl(this.firebaseFirestore);

  @override
  Future<void> salvar(Tarefa tarefa) async {
    await this.firebaseFirestore.collection('tarefas').add(tarefa.toMap());
  }

  @override
  Future<void> alterar(Tarefa tarefa) {
    // TODO: implement alterar
    throw UnimplementedError();
  }

  @override
  Future<void> excluir(String id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<List<Tarefa>> listar() async {
    QuerySnapshot snapshot =
        await this.firebaseFirestore.collection('tarefas').get();
    return snapshot.docs.map((doc) => Tarefa.fromMap(doc.data()!)).toList();
  }
}
