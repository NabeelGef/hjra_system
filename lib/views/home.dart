

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hjra_system/views/fabbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  
  Widget build(BuildContext context) {
  List<String> names = [
    "اسم الموظّف",
    "محمد",
    "محمد",
    "محمد",
    "محمد",
    "محمد"
  ];
  List<String> numberjob = ["الرقم الوظيفي","8","10","15","16","18"];
  List<String> IDS =["#","1","2","3","4","5"];
  var storages = ["تقرير سجل الأعلاف", "مخزون الأعلاف","تقرير سجل الأدوبة","مخزون الأدوية","عرض المستودعات"];
  var menues = ["قائمة العملاء","قائمة المناديب","قائمة الموردين","قائمة المبيعات","قائمة المشتريات"] ; 
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            //
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      
      backgroundColor: Colors.orange,
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
          if(value==3){
            Get.toNamed("/control");
          }
          //clich on home
        },),
         
      body: SingleChildScrollView(
         child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Text("قائمة الموظّفين",style: TextStyle(color: Color(0xff9f8040),
                  fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                                           onPressed: (() {
                         //filter
                                           }),
                                           style: ElevatedButton.styleFrom(backgroundColor: Colors.green
                        , minimumSize: Size(100, 40)),
                                           child: const Text("تصفية ",
                                           style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)
                                           ,)
                                           ),
                      ),
                      Spacer(),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(top: 25,right: 25,bottom: 25),
                        child: TextFormField(
                         decoration: InputDecoration(
                           prefixIcon: Icon(Icons.search,color: Colors.grey,),
                           focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.green),
                             borderRadius: BorderRadius.circular(20)) ,
                           enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.green),
                             borderRadius: BorderRadius.circular(20)), 
                         ),
                        
                        ),
                      )
                      
                    ],),
                    
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                              Text("${names[index]}",style: TextStyle(fontSize: 20),),
                              Text("${numberjob[index]}",style: TextStyle(fontSize: 20)),
                              IDS[index]=="#"?Container(margin: EdgeInsets.only(right: 25),
                              child: Text("${IDS[index]}",style: TextStyle(fontSize: 20)),)
                              :Text("${IDS[index]}",style: TextStyle(fontSize: 20)),
                            ]
                             ),
                             Divider(thickness: 2,)
                        ],
                      );
                    },),
                    
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Text("إضافة موظّف جديد",style: TextStyle(color: Color(0xff9f8040),
                  fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
            ),Card(
              margin: EdgeInsets.only(right: 15 ,left: 15),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 35,
                    height: 35,
                     decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 3,
                      color: Color(0xff9f8040) 
                    ),
                  ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.close),
                      color: Color(0xff9f8040),
                      onPressed: () {
                        //closing
                      },
                    ),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getFields("إسم الموظّف", "محمد نبيل الغفري"),
                getFields("*الرّقم الوظيفي", "ID:424356313"),
              ],
            ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getFields("تاريخ الميلاد", "2022/1/1"),
                getFields("رقم الهويّة", "222222222")
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getFields("رقم الجوال", "96396712753+"),
                getFields("الجنس", "ذكر")
              ],
            )

              ],)
            )
          ],
         ),
      ),
    );
  }
  Widget getFields(String nameText , String nameHint , ){
    return SizedBox(
       width: 150,
       height: 100,
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Text(nameText,style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff9f8040),
                        fontWeight: FontWeight.bold,decorationThickness: 3),  
                            ),
                       SizedBox(
                         child: TextFormField(
                           decoration: InputDecoration(
                            prefixIcon: nameText=="تاريخ الميلاد" ?
                            Icon(Icons.calendar_month,color: Colors.blue[800],):null,
                             hintTextDirection: TextDirection.rtl,
                             hintStyle: TextStyle(fontWeight: FontWeight.bold,decorationThickness: 3),  
                             hintText: nameHint,
                            enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.blue , width: 2)                           
                            
                            ),
                             border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.blue , width: 3)                           
                             )
                           ),
                         ),
                       )
                    ],
                  ),
    );
  }
}