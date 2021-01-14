import 'package:WeightIsLife/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final String uid;
  final List weightData;
  LineChart(this.uid, this.weightData);
  @override
  _LineChartState createState() => _LineChartState(uid, weightData);
}

class _LineChartState extends State<LineChart> {
  final String uid;
  final List weightData;
  _LineChartState(this.uid, this.weightData);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SfCartesianChart(
          title: ChartTitle(
              text: 'Weight Chart',
              textStyle: TextStyle(color: Colors.white, fontFamily: 'Proxima')),
          tooltipBehavior: TooltipBehavior(
              enable: true,
              color: primaryyColor,
              canShowMarker: true,
              header: 'Weight of the day'),
          primaryXAxis: CategoryAxis(),
          series: <LineSeries<WeightData, String>>[
            LineSeries<WeightData, String>(
                color: primaryyColor,
                // Bind data source
                dataSource: getDatar(weightData),
                xValueMapper: (WeightData sales, _) => sales.date,
                yValueMapper: (WeightData sales, _) => sales.weight,
                markerSettings:
                    MarkerSettings(isVisible: true, color: primaryyColor))
          ]),
    );
  }

  getDatar(List data) {
    List<WeightData> datas = [];
    for (int i = 0; i <= data.length - 1; i++) {
      datas.add(WeightData(data[i]['date'], data[i]['weight']));
    }
    return datas;
  }
}

class WeightData {
  final String date;
  final double weight;
  WeightData(this.date, this.weight);
}
