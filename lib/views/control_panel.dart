
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hjra_system/model/bar_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_data.dart';
import 'fabbar.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    var storages = ["تقرير سجل الأعلاف", "مخزون الأعلاف","تقرير سجل الأدوبة","مخزون الأدوية","عرض المستودعات"];
  var menues = ["قائمة العملاء","قائمة المناديب","قائمة الموردين","قائمة المبيعات","قائمة المشتريات"] ; 
   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final List<ChartData> chartData = <ChartData>[
            ChartData(0, 14000, 13000,7000,4000),
            ChartData(1, 11000, 8000,4500,3000),
            ChartData(2, 12000, 12000,8200,3900),
            ChartData(3, 11500, 7000,4100,2000),
            ChartData(4, 13000, 9000,6200,5800),
            ChartData(5, 11500, 8900,5900,2000),
            ChartData(6, 14000, 10500,6000,4000),
            ChartData(7, 12000, 10500,6000,4000),
            ];
            final List<BarData> barData = <BarData>[
              BarData("القطيع 1", 4,2.1),
              BarData("القطيع 2", 5,3.1),
              BarData("القطيع 3", 4,0),
              
            ];
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: Directionality
        (
          textDirection: TextDirection.rtl,
          child: Container(
            
            margin: EdgeInsets.only(top: 45),
            child: SingleChildScrollView(
              child: Column(
                children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(icon: Icon(Icons.sort, color:Color(0xff9f8040),size: 45),onPressed: (() {
                    _scaffoldKey.currentState!.closeEndDrawer();
                  })),
                ),
                
                ExpansionTile(
                  iconColor:Color(0xff9f8040)  ,
                  title: Row(
                    children: [
                      Icon(Icons.storage,color: Colors.grey ,size: 20,),
                      SizedBox(width: 10,),
                      Text("المستودعات",style: TextStyle(color:Color(0xff9f8040) , fontSize: 20 , fontWeight: FontWeight.bold ),),
                    ],
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: storages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Colors.grey[300],
                          leading: Icon(Icons.document_scanner,color:Colors.grey,),
                          title: Text(storages[index],style: TextStyle(color:Color(0xff9f8040) , fontSize: 20 , fontWeight: FontWeight.bold ))
                        );
                      },)
                  ],
                ),
                ExpansionTile(
                  iconColor:Color(0xff9f8040)  ,
                  title: Row(
                    children: [
                      Icon(Icons.storage,color: Colors.grey ,size: 20,),
                      SizedBox(width: 10,),
                      Text("التّقارير",style: TextStyle(color:Color(0xff9f8040) , fontSize: 20 , fontWeight: FontWeight.bold ),),
                    ],
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: menues.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Colors.grey[300],
                          leading: Icon(Icons.document_scanner,color:Colors.grey,),
                          title: Text(menues[index],style: TextStyle(color:Color(0xff9f8040) , fontSize: 20 , fontWeight: FontWeight.bold ))
                        );
                      },)
                  ],
                )
                
              ],),
            ),
          ),)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
      },
      backgroundColor: Colors.grey,
      child: Icon(Icons.dashboard , color: Colors.white,),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: "",
        iconSize: 35,
        color: Colors.grey,
        backgroundColor: Colors.white,
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.person , text: ""),
          FABBottomAppBarItem(iconData: Icons.notifications , text: ""),
          FABBottomAppBarItem(iconData: Icons.settings , text: ""),
          FABBottomAppBarItem(iconData: Icons.language , text: "")
        ],
        onTabSelected: (value) {
          if(value==0){
           Get.toNamed("/managers");
          }
          //clich on home
        },),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        leading: 
            Image.asset("images/hjralogo.jpeg"),
            title: const Text("نظام شركة الهجرة",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold ,color:Color(0xff9f8040) ),),
        actions:  [
         Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(icon: Icon(Icons.sort, color:Color(0xff9f8040),size: 35),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            }
            ),
          )),
        ],
      ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text("لوحة التّحكّم",style: TextStyle(color: Color(0xff9f8040) , fontSize: 15 , fontWeight: FontWeight.bold)),
          ),
          Card(
            child: Column(
              children: [
                Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
           child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      isInversed: true,
                      isVisible: false,
                      labelStyle: TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold)
                      
                    ),
                      primaryYAxis: CategoryAxis(
                        minimum: 0,
                        maximum: 14000,
                    opposedPosition: true,
                      labelStyle: TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold)
                      ),
                      title: ChartTitle(
                        alignment: ChartAlignment.far,
                        text: "حالات القطعان" , textStyle: TextStyle(color: Color(0xff9f8040) , fontSize: 15 , fontWeight: FontWeight.bold)),
                      series: <ChartSeries>[
                        
                        SplineAreaSeries<ChartData , int >(
                          
                          color: Colors.green,
                          dataSource: chartData, 
                          xValueMapper: (ChartData datachart, index) {
                            return datachart.x;
                          }, 
                          yValueMapper: (ChartData datachart, index) {
                            return datachart.y;
                          }),
                          SplineAreaSeries<ChartData , int >(
                          color: Colors.purple[100],
                          dataSource: chartData, 
                          xValueMapper: (ChartData datachart, index) {
                            return datachart.x;
                          }, 
                          yValueMapper: (ChartData datachart, index) {
                            return datachart.y1;
                          }),
                          SplineAreaSeries<ChartData , int >(
                          color: Colors.blue[600],
                          dataSource: chartData, 
                          xValueMapper: (ChartData datachart, index) {
                            return datachart.x;
                          }, 
                          yValueMapper: (ChartData datachart, index) {
                            return datachart.y2;
                          }),
                          SplineAreaSeries<ChartData , int >(
                          color: Colors.red[300],
                          dataSource: chartData, 
                          xValueMapper: (ChartData datachart, index) {
                            return datachart.x;
                          }, 
                          yValueMapper: (ChartData datachart, index) {
                            return datachart.y3;
                          }),
                          
                      ],
                    ),
                    
                  ) ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text("الوفيّات",style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    width: 30,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(
                       width: 3 
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[300]
                    ),
                  ),
                  Text("الذكور",style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    width: 30,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(
                       width: 3 
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[600]
                    ),
                  ),Text("الإناث",style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    width: 30,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(
                       width: 3 
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple[100]
                    ),
                  ),Text("الانتاج",style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    width: 30,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(
                       width: 3 
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green
                    ),
                  )
                ],)
              ],
            ),
          ),
          SizedBox(height: 50),
          Card(
            child: Column(
              children: [
                Directionality(
                textDirection: TextDirection.rtl, 
                child: SfCartesianChart(
                   title: ChartTitle(
                        alignment: ChartAlignment.far,
                        text: "المراحل الزّمنيّة للقطعان" , textStyle: TextStyle(color: Color(0xff9f8040) , fontSize: 15 , fontWeight: FontWeight.bold)),
                  primaryXAxis: CategoryAxis(
                    isInversed: true,
                    opposedPosition: true,
                    labelStyle: TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold)
                   
                  ),
                  
                  primaryYAxis: CategoryAxis(
                    minimum: 0,
                    maximum: 6,    
                  axisLabelFormatter: (axisLabelRenderArgs) {
                    if(axisLabelRenderArgs.value==0){
                      return ChartAxisLabel("الاسبوع الأول", TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold));
                    }
                    else if (axisLabelRenderArgs.value==2){
                      return ChartAxisLabel("الاسبوع الثاني", TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold));
                    }
                    else if (axisLabelRenderArgs.value==4){
                      return ChartAxisLabel("الاسبوع الثالث", TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold));
                    }
                    else {
                      return ChartAxisLabel("الاسبوع الرّابع", TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold ));
                    }
                  },
                  isInversed: true,
                  labelStyle: TextStyle(color:  Color(0xff9f8040) , fontWeight: FontWeight.bold)),
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                    iconWidth: 15,
                    iconHeight: 15,
                    alignment: ChartAlignment.center
                    
                  ),
                  series:<ChartSeries>[
                     BarSeries<BarData,String>(
                      legendIconType: LegendIconType.circle,
                      name: "الإنتاج",
                      color: Colors.amber,
                   dataSource:barData,
                   isVisible: true,
                   xValueMapper: (BarData bar, _)=> bar.type,
                   yValueMapper: (BarData bar, _)=> bar.week
                  ),
                  BarSeries<BarData,String>(
                    legendIconType: LegendIconType.circle,
                    name: "التربية",
                   color: Colors.green[600],
                   dataSource:barData,
                   xValueMapper: (BarData bar, _)=> bar.type,
                   yValueMapper: (BarData bar, _)=> bar.week2
                  ),
                  ]
                )
                )
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}