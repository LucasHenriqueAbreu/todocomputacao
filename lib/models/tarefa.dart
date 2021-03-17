class Tarefa {
  int id;
  String descricao;
  String titulo;
  bool pronta;

  Tarefa({
    required this.id,
    required this.descricao,
    required this.titulo,
    this.pronta = false,
  });
}
