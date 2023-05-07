import 'package:dw10_mobx/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  late final ReactionDisposer snackDisposer;

  @override
  void initState() {
    snackDisposer = reaction((_) => controller.showSnackbar, (showSnackBar) {
      if (showSnackBar) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(controller.mensagemSnackBar),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    snackDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build rodando');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (context) {
              debugPrint('Somente o text ${controller.nome}');
              return Text(controller.nome);
            }),
            ElevatedButton(
              onPressed: () {
                // controller.nome = 'Thales Terra';
                controller.alterarNome('Thales Terra');
              },
              child: const Text('Alterar nome'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.mostrarSnackBar();
              },
              child: const Text('Mostrar Snackbar'),
            )
          ],
        ),
      ),
    );
  }
}
