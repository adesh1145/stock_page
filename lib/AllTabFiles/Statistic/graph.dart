// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
  var colour = Color.fromRGBO(63, 115, 111, 1);

List<StockDetail>stockdetail=[
  StockDetail('Starbucks',"jan 12,2022","-\$ 150.00","assets/starbucks.png",spotpointrandom()),
  StockDetail( "Transfer","Yesterday","-\$ 85.00","assets/transfer.png",spotpointrandom()),
  StockDetail( "Youtube","Jan 16,2022","-\$ 11.99","assets/youtube.png",spotpointrandom()),
  StockDetail('Star',"feb 10,2022","-\$ 50.00","assets/starbucks.png",spotpointrandom()),
]; 
var stockDetailIndex=1;
class StockDetail{
  String name,time,rate,pic;
  List<FlSpot> flspots;
  StockDetail(this.name,this.time,this.rate,this.pic,this.flspots);
}
List <FlSpot> spotpointrandom(){
  var point=<FlSpot>[];

  Random ran=Random();
  for(int i=0;i<20;i++){
    point.add(
      FlSpot(i.toDouble(), ran.nextInt(16).toDouble())
    );
    
  }
  return point;
}

 
 List<FlSpot> flspots = [
    FlSpot(0, 0),
    
  ];
// Start------------Graph Function-----
Widget graphView(){
  
  return LineChart(
                          LineChartData(
                            gridData: FlGridData(
                              show: false,
                            ),
                            titlesData: FlTitlesData(
                              // show: false,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 4,
                                    getTitlesWidget: ((value, meta) {
                                      return Text("Date");
                                    })),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: false,
                                ),
                              ),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            minX: 0,
                            minY: 0,
                            maxX: 20,
                            maxY: 20,
                            lineBarsData: [
                              LineChartBarData(
                                spots: stockdetail.map((e) => e.flspots).toList()[stockDetailIndex],
                                barWidth: 3,
                                isCurved: true,
                                color: colour,
                                dotData: FlDotData(
                                  show: false,
                                ),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Color.fromRGBO(63, 115, 111, .2),
                                ),
                              ),
                            ],
                            lineTouchData: LineTouchData(
                              touchTooltipData: LineTouchTooltipData(
                                tooltipRoundedRadius: 10,
                                tooltipMargin: 15,
                                tooltipPadding: EdgeInsets.all(15),
                                tooltipBgColor:
                                    Color.fromRGBO(63, 115, 111, .1),
                                tooltipBorder: BorderSide(
                                  color: Color.fromRGBO(76, 74, 74, .5),
                                  width: 2,
                                ),
                              ),
                              getTouchedSpotIndicator:
                                  (LineChartBarData barData,
                                      List<int> indicators) {
                                return indicators.map(
                                  (int index) {
                                    final line = FlLine(
                                        color: Color.fromRGBO(76, 74, 74, .5),
                                        strokeWidth: 2,
                                        dashArray: [9, 8]);
                                    return TouchedSpotIndicatorData(
                                      line,
                                      FlDotData(show: true),
                                    );
                                  },
                                ).toList();
                              },
                            ),
                          ),
                        );
                    
} 
      
                        