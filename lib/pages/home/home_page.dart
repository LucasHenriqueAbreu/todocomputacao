import 'package:flutter/material.dart';
import 'package:todocomputacomovel/models/tarefa.dart';
import 'package:todocomputacomovel/pages/cadastro/cadastro_page.dart';
import 'package:todocomputacomovel/pages/home/home_controller.dart';
import 'package:todocomputacomovel/pages/home/widgets/item_lista_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    print('Passou pelo construtor');
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: controller.count,
          builder: (_, __, ___) {
            return Text('TODO ${controller.count.value}');
          },
        ),
      ),
      body: ValueListenableBuilder(
        builder: (_, __, ___) {
          return ListView.builder(
            itemCount: controller.tarefas.value.length,
            itemBuilder: (context, index) => ItemListaWidget(
              tarefa: controller.tarefas.value[index],
            ),
          );
        },
        valueListenable: controller.tarefas,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Tarefa? tarefa = await Navigator.of(context).push<Tarefa>(
            MaterialPageRoute(builder: (context) {
              return CadastroPage();
            }),
          );
          controller.adicionarTarefas(tarefa!);
          controller.addCount();
        },
      ),
    );
  }
}
