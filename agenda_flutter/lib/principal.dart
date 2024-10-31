import 'package:agenda_flutter/cadastro.dart';
import 'package:agenda_flutter/contato.dart';
import 'package:agenda_flutter/listagem.dart';
import 'package:agenda_flutter/login.dart';
import 'package:agenda_flutter/autenticacao/sharedSessao.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          cardColor: const Color.fromARGB(255, 59, 133, 129),
          backgroundColor: Colors.white,
          accentColor: Colors.white,
          brightness: Brightness.dark,
          primarySwatch: Colors.pink,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthCheck(), // Verifica se o usuário está logado
        '/principal': (context) => Principal(),
        '/login': (context) => Login(),
      },
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedSessao.carregarToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar token'));
        } else {
          // Direciona para Principal se o token existir, senão Login
          return snapshot.data != null ? Principal() : Login();
        }
      },
    );
  }
}

class Principal extends StatelessWidget {
  final ContatosRepository contatos = ContatosRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Início'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cadastro(contatos: contatos),
                  ),
                );
              },
              child: Text("Cadastro"),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Listagem(contatos: contatos),
                  ),
                );
              },
              child: Text("Listar"),
            ),
          ],
        ),
      ),
    );
  }
}
