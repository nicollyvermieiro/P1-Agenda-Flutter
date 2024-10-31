import 'package:flutter/material.dart';
import 'package:agenda_flutter/controllers/loginController.dart';

class Login extends StatelessWidget {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void _showDialog(BuildContext context, String message, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Entre com o login"),
              controller: usuarioController,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Entre com a senha"),
              controller: senhaController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    Logincontroller loginController = Logincontroller();
                    bool success = await loginController.login(
                        usuarioController.text, senhaController.text);
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/principal');
                    } else {
                      _showDialog(context, "Login ou senha inválidos.", "Erro");
                    }
                  },
                  icon: Icon(Icons.login),
                  label: Text('Entrar'),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    Logincontroller loginController = Logincontroller();
                    try {
                      await loginController.salvar(
                          usuarioController.text, senhaController.text);
                      _showDialog(
                          context, "Cadastro realizado com sucesso!", "Sucesso");
                    } catch (e) {
                      _showDialog(context, "Erro ao cadastrar: $e", "Erro");
                    }
                  },
                  icon: Icon(Icons.add_circle_outline_sharp),
                  label: Text('Cadastrar'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
