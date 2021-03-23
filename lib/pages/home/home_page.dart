import 'package:flutter/material.dart';
import 'package:todocomputacomovel/models/tarefa.dart';
import 'package:todocomputacomovel/pages/cadastro/cadastro_page.dart';
import 'package:todocomputacomovel/pages/home/widgets/item_lista_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarefa> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) => ItemListaWidget(
          tarefa: tarefas[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Tarefa? tarefa = await Navigator.of(context).push<Tarefa>(
            MaterialPageRoute(builder: (context) {
              return CadastroPage();
            }),
          );
          setState(() {
            tarefas.add(tarefa!);
          });
        },
      ),
    );
  }
}
