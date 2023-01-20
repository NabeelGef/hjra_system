import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Managers extends StatefulWidget {
  const Managers({super.key});

  @override
  State<Managers> createState() => _ManagersState();
}

class _ManagersState extends State<Managers> {
  List<String> managers = [
    "مدير عام","مدير موقع","مدير مزرعة","مدير مخزن","مدير مالي","المبيعات","الموارد البشريّة"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: Image.asset("images/hjrasystem.jpeg"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text("قائمة بالمدراء وصفحاتهم",style: TextStyle(fontSize: 25 
                ,color:Color(0xff9f8040)
                ,fontWeight: FontWeight.bold,
                decorationThickness: 5
                )),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: managers.length,
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 25 , vertical: 10),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.label_outline , color: Colors.green[800]),
                      title: Text(managers[index],style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Color(0xff9f8040),
                        decorationThickness: 2
                        ))
                    ),
                  ),
                );
              },)
        ],)),
    );
  }
}