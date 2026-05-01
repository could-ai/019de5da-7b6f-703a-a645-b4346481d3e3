import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const PatagoniaReportApp());
}

class PatagoniaReportApp extends StatelessWidget {
  const PatagoniaReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabajo Práctico: Patagonia Extrandina',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          titleLarge: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, height: 1.5, color: Colors.black54),
        ),
      ),
      home: const ReportScreen(),
    );
  }
}

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producción: Patagonia Extrandina'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                _buildIntroduction(context),
                const SizedBox(height: 32),
                _buildStatistics(context),
                const SizedBox(height: 40),
                _buildComparativeTable(context),
                const SizedBox(height: 40),
                _buildBarChart(context),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Trabajo Práctico',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Economía y Producción en la Patagonia Extrandina',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }

  Widget _buildIntroduction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. Introducción y Actividades Principales',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'La Patagonia Extrandina abarca gran parte del sur argentino al este de la cordillera de los Andes, caracterizándose por un clima árido a semiárido, fuertes vientos y extensas mesetas. A pesar de estas duras condiciones, la región es un motor fundamental para la economía nacional.\n\n'
          'Sus principales pilares productivos son la extracción de hidrocarburos (petróleo y gas natural) en las cuencas Neuquina y del Golfo San Jorge, la tradicional ganadería ovina adaptada a la estepa, y el creciente desarrollo de energías renovables, principalmente la eólica. La región también aporta recursos mineros significativos.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 8),
        Text(
          'Fuentes: Instituto Nacional de Estadística y Censos (INDEC); Ministerio de Economía de la Nación - Informes Productivos Provinciales.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildStatistics(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2. Datos Estadísticos Generales',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _buildBulletPoint('Producción de Petróleo: La región concentra históricamente más del 70% de la producción nacional, impulsada por cuencas maduras y el desarrollo no convencional (Vaca Muerta).'),
        _buildBulletPoint('Ganadería Ovina: La Patagonia alberga cerca del 60% del stock ovino nacional, orientado principalmente a la producción de lana fina y carne, siendo un pilar social y económico de las mesetas.'),
        _buildBulletPoint('Energía Eólica: Gracias a factores de capacidad que superan el 50% en zonas de la costa y estepa central, se ha convertido en la principal región productora de energía eólica del país.'),
        const SizedBox(height: 8),
        Text(
          'Fuentes: Secretaría de Energía de la Nación; Secretaría de Agricultura, Ganadería y Pesca (SAGyP).',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparativeTable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '3. Cuadro Comparativo (2013 vs 2023)',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.blueGrey.shade100),
            columns: const [
              DataColumn(label: Text('Indicador Productivo', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Año 2013', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Año 2023', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Variación (%)', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Producción Petróleo (miles m³/día)')),
                DataCell(Text('85.4')),
                DataCell(Text('105.2')),
                DataCell(Text('+ 23.2%')),
              ]),
              DataRow(cells: [
                DataCell(Text('Producción Gas Natural (millones m³/día)')),
                DataCell(Text('114.5')),
                DataCell(Text('142.1')),
                DataCell(Text('+ 24.1%')),
              ]),
              DataRow(cells: [
                DataCell(Text('Stock Ovino (millones de cabezas)')),
                DataCell(Text('8.2')),
                DataCell(Text('7.1')),
                DataCell(Text('- 13.4%')),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Fuentes: Datos elaborados en base a estadísticas de la Secretaría de Energía (Capítulo IV) y el SENASA (Stock ovino patagónico). *Los valores son representaciones consolidadas para la región.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildBarChart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '4. Gráfico de Barras: Producción de Hidrocarburos',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Comparativa de producción diaria de Petróleo (miles de m³) y Gas Natural (millones de m³) en la región patagónica.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 160,
              barTouchData: BarTouchData(enabled: true),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Petróleo 2013', style: style);
                        case 1:
                          return const Text('Petróleo 2023', style: style);
                        case 2:
                          return const Text('Gas 2013', style: style);
                        case 3:
                          return const Text('Gas 2023', style: style);
                        default:
                          return const Text('');
                      }
                    },
                    reservedSize: 40,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
                    },
                  ),
                ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: 85.4,
                      color: Colors.blueGrey.shade700,
                      width: 30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: 105.2,
                      color: Colors.blueAccent.shade400,
                      width: 30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: 114.5,
                      color: Colors.orange.shade700,
                      width: 30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      toY: 142.1,
                      color: Colors.deepOrangeAccent.shade400,
                      width: 30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(Colors.blueGrey.shade700, 'Petróleo 2013'),
            const SizedBox(width: 16),
            _buildLegendItem(Colors.blueAccent.shade400, 'Petróleo 2023'),
            const SizedBox(width: 16),
            _buildLegendItem(Colors.orange.shade700, 'Gas 2013'),
            const SizedBox(width: 16),
            _buildLegendItem(Colors.deepOrangeAccent.shade400, 'Gas 2023'),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Fuente: Elaboración propia en base a datos de la Secretaría de Energía, Sistema de Información Hidrocarburífera (2013-2023).',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
