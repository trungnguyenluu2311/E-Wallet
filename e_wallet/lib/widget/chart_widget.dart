import 'package:charts_flutter/flutter.dart' as charts;
import 'package:e_wallet/models/chart_column.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  List<ChartColumn>  datathu;
  List<ChartColumn>  datachi;

  ChartWidget({
   this.datathu,this.datachi
  });
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartColumn, String >> series
    = [
      charts.Series(
        id: "Thu cho trong thang",
        data: datathu,
        domainFn: (ChartColumn series, _) =>
        series.year,
        measureFn: (ChartColumn series, _)=>
        series.thuchi,
        colorFn: (ChartColumn series, _)=>
        series.barColor,
      ),
      charts.Series(
        id: "chi cho trong thang",
        data: datachi,
        domainFn: (ChartColumn series, _) =>
        series.year,
        measureFn: (ChartColumn series, _)=>
        series.thuchi,
        colorFn: (ChartColumn series, _)=>
        series.barColor,
      )
    ];
    return Container(
      height: 560,
      padding: EdgeInsets.only(
        top: 20.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Card(
        color: Color(0xff1B1C1E),
        child: Column(
          children: [
            SizedBox(height: 12,),
            Text("Statistics",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto Slap',
                  color: Colors.white,
              )),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 390,
                width: 600,
                color: Color(0xff1B1C1E),
                child: charts.BarChart(series,animate: true,
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(
                      labelStyle: charts.TextStyleSpec(
                        fontSize: 20,
                        color: charts.ColorUtil.fromDartColor(
                            Colors.white),
                      ),
                    ),
                  ),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(
                      labelStyle: charts.TextStyleSpec(
                        fontSize: 20,
                        color: charts.ColorUtil.fromDartColor(
                            Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
