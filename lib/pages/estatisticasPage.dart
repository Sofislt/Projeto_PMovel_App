import 'package:flutter/material.dart';
import 'package:projetofelype/Domain/chart.dart';
import 'package:projetofelype/api/chart_api.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  State<Estatisticas> createState() => _EstatisticasState();
}

class _EstatisticasState extends State<Estatisticas> {
  late Future<Chart> futureChart;

  @override
  void initState() {
    super.initState();
    futureChart = ChartApi().get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: buildStatisticsBody(),
      ),
    );
  }

  buildStatisticsBody() {
    return FutureBuilder<Chart>(
      future: futureChart,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          print(snapshot.requireData.url);

          final chart = snapshot.data!;
          if (chart.url.isEmpty) {
            return const Center(child: Text('Nenhuma imagem disponível.'));
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                chart.url,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => const Text('Erro ao carregar imagem.'),
              ),
            ),
          );
        } else {
          print(snapshot.requireData.url);
          return const Center(child: Text('Sem dados.'));
        }
      },
    );
  }
}