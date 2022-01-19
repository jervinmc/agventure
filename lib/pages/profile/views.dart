import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
Map<String, double> dataMap = {
    "Chili Red Pepper": 0,
    "Bittergourd": 0,
    "String Beans": 0,
    "Ladies Finger": 0,
    "Pumnkin": 0,
  };
class _ProfileState extends State<Profile> {
  List<_SalesData> data = [
    // _SalesData('Ladies Finger', 35),
    // _SalesData('Chili Red Pepper', 28),
    // _SalesData('Cucumber', 34),
    // _SalesData('Pumnkin', 32),
    // _SalesData('Bitter Gourd', 40)
  ];
  void getData()async{
    final prefs = await SharedPreferences.getInstance();
    var ladies_finger ;
    var chili_red_pepper;
    var string_beans;
    var pumpkin;
    var bittergourd =  prefs.getInt("Bittergourd");

    // double bittergourd=0;
       ladies_finger = prefs.getInt("Ladies Finger")==null ? 0 : prefs.getInt("Ladies Finger");
       chili_red_pepper = prefs.getInt("Chili Red Pepper")==null ? 0 : prefs.getInt("Chili Red Pepper");
      string_beans = prefs.getInt("String Beans")==null ? 0 : prefs.getInt("String Beans");
       pumpkin = prefs.getInt("Pumpkin")==null ? 0 : prefs.getInt("Pumpkin");
       bittergourd =  prefs.getInt("Bittergourd")==null ? 0: prefs.getInt("Bittergourd")!;
      setState(() {
       
        data = [
    _SalesData('Ladies Finger',ladies_finger ),
    _SalesData('Chili Red Pepper',chili_red_pepper ),
    _SalesData('String Beans', string_beans),
    _SalesData('Pumpkin', pumpkin),
    _SalesData('Bittergourd', bittergourd!)
  ];
      });
    
  }
  void initState(){
      getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),backgroundColor:Color(0xff06611F)),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top:30)),
          Center(
            child: Text('Scores',style:TextStyle(fontWeight: FontWeight.bold,fontSize:25.0)),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            // child: Pie(dataMap),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: ''),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Score',
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          )
        ],
      )
    );
  }
}

// class Pie extends StatelessWidget {
//   Map<String, double> dataMap ;
//   Pie(this.dataMap);
  
//   @override
//   Widget build(BuildContext context) {
//     return PieChart(
//               dataMap: dataMap, 
//               animationDuration: Duration(milliseconds: 800),
//               chartLegendSpacing: 32,
//               chartRadius: MediaQuery.of(context).size.width / 3.2,
//               colorList: [Colors.black45,Colors.blue,Colors.red,Colors.pink,Colors.green,Colors.orange,Colors.yellow],
//               initialAngleInDegree: 0,
//               chartType: ChartType.ring,
//               ringStrokeWidth: 32,
//               centerText: "Total",
//               legendOptions: LegendOptions(
//                 showLegendsInRow: false,
//                 legendPosition: LegendPosition.right,
//                 showLegends: true,
//                 legendTextStyle: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               chartValuesOptions: ChartValuesOptions(
//                 showChartValueBackground: true,
//                 showChartValues: true,
//                 showChartValuesInPercentage: false,
//                 showChartValuesOutside: false,
//                 decimalPlaces: 1,
//               ),
//             );
//   }
// }
class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final int sales;
}