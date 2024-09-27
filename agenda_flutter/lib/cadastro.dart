
import 'package:agenda_flutter/contato.dart';
import 'package:agenda_flutter/listagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Cadastro extends StatefulWidget {
  final ContatosRepository contatos;
  final Contato? contato;

  Cadastro({required this.contatos, this.contato});

  @override
  State<Cadastro> createState() => _CadastroState(contatos: contatos);
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController =
      MaskedTextController(mask: '(00)00000-0000');
  TextEditingController emailController = TextEditingController();
  final ContatosRepository contatos;
  _CadastroState({required this.contatos});
  @override
  void initState() {
    super.initState();
    if (widget.contato != null) {
      nomeController = TextEditingController(text: widget.contato!.nome);
      telefoneController = MaskedTextController(
          mask: '(00)00000-0000', text: widget.contato!.telefone);
      emailController = TextEditingController(text: widget.contato!.email);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary, 
        title: Text('Cadastro de Contatos'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, 
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(labelText: 'Insira o Nome'),
                    controller: nomeController, 
                    validator: (nomeController) {
                      if (nomeController == null || nomeController.isEmpty) {
                        return 'Por Favor, insira o nome';
                      }
                      return null;
                    }),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Insira o Telefone',
                        hintText: '(XX) XXXXX-XXXX',
                        hintStyle: TextStyle(color: Colors.black)),
                    controller: telefoneController,
                    validator: (telefoneController) {
                      if (telefoneController == null ||
                          telefoneController.isEmpty ||
                          telefoneController.length != 14) {
                        return 'Por Favor, insira o Telefone';
                      }
                      return null;
                    }),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Insira o Email',
                    ),
                    controller: emailController,
                    validator: (emailController) {
                      if (emailController == null || emailController.isEmpty) {
                        return 'Por Favor, insira o Email';
                      }
                      if (RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(emailController)) {
                        return null;
                      }
                      return 'Email invalido';
                    }),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.contato != null) {
                        Navigator.pop(
                            context,
                            Contato(
                                nome: nomeController.text,
                                email: emailController.text,
                                telefone: telefoneController.text));
                      } else {
                        setState(() {
                          contatos.addContatos(Contato(
                              nome: nomeController.text,
                              email: emailController.text,
                              telefone: telefoneController.text));
                        });
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          )),
    );
  }
}
