import 'package:flutter/material.dart';
import 'package:todocomputacomovel/models/tarefa.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  // TODO: validar a princiapal função do late
  late TextEditingController txtTituloCtrl;
  late TextEditingController txtDescricaoCtrl;
  late Tarefa tarefa;

  @override
  void initState() {
    super.initState();
    txtTituloCtrl = TextEditingController();
    txtDescricaoCtrl = TextEditingController();
    tarefa = Tarefa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova tarefa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: txtTituloCtrl,
                decoration: InputDecoration(
                  labelText: 'Título',
                  hintText: 'Ex.: Lavar a louça',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtDescricaoCtrl,
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  hintText: 'Ex.: Não esquecer de pegar o detergente',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _salvar,
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _salvar() {
    tarefa.titulo = txtTituloCtrl.text;
    tarefa.descricao = txtDescricaoCtrl.text;
    Navigator.of(context).pop<Tarefa>(tarefa);
  }
}
