import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../utils/core/styles.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'МИССИЯ И СТРАТЕГИЯ',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CustomParagraph extends StatelessWidget {
  const CustomParagraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Enter Engineering продолжает укреплять свои позиции на рынке Узбекистана, реализуя крупномасштабные строительные проекты в нефтегазовом, промышленном и гражданском секторах.Компания имеет хорошие возможности как для сохранения лидерства на рынке нефти и газа, так и для расширения участия в энергетическом и химическом секторах:стабильное присутствие на рынке  ",
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[800],
        height: 1.5,
      ),
    );
  }
}

class CustomPie extends StatelessWidget {
  const CustomPie({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, double> data;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: data,
      colorList: pieColors, // if not declared, random colors will be chosen
      animationDuration: Duration(milliseconds: 1500),
      chartLegendSpacing: 32.0,
      chartRadius: MediaQuery.of(context).size.width /
          2.7, //determines the size of the chart
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // grad//can be changed to top, left, bottom

      initialAngleInDegree: 0,

      chartType: ChartType.disc, //can be changed to ChartType.ring
    );
  }
}
