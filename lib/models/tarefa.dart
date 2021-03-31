import 'dart:convert';

class Tarefa {
  String? titulo;
  String? descricao;
  bool pronta;

  Tarefa({
    this.titulo,
    this.descricao,
    this.pronta = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'pronta': pronta,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'],
      descricao: map['descricao'],
      pronta: map['pronta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tarefa.fromJson(String source) => Tarefa.fromMap(json.decode(source));
}
