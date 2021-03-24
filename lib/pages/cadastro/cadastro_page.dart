import 'package:flutter/material.dart';
import 'package:todocomputacomovel/core/widgets/generic_text_form_field.dart';
import 'package:todocomputacomovel/models/tarefa.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late Tarefa _tarefa;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tarefa = Tarefa();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GenericTextFormField(
                  labelText: 'Título',
                  hintText: 'Ex.: Lavar a louça',
                  errorMsg: 'Tútulo é obrigatório',
                  onSaved: (value) => _tarefa.titulo = value,
                  formKey: _formKey,
                ),
                SizedBox(
                  height: 10,
                ),
                GenericTextFormField(
                  labelText: 'Descrição',
                  hintText: 'Ex.: Não esquecer de pegar o detergente',
                  errorMsg: 'Descrição é obrigatório',
                  maxLines: 6,
                  onSaved: (value) => _tarefa.descricao = value,
                  formKey: _formKey,
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
      ),
    );
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop<Tarefa>(_tarefa);
    }
  }
}
