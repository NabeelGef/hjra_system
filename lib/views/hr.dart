import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HR extends StatefulWidget {
  const HR({super.key});

  @override
  State<HR> createState() => _HRState();
}

class _HRState extends State<HR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Center(
                child: Image.asset("images/hjrasystem.jpeg"),
              ),
            ),
             Container(
              margin: const EdgeInsets.only(top: 50),
               child: const Center(
                 child: Text("التّواصل مع الموارد البشريّة " , style: 
                 TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.black, 
                 ),)),
             ),
            Center(
              child: Container(
                margin:const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                   Directionality(
                    textDirection: TextDirection.rtl,
                     child: SizedBox(
                      width: 300,
                       child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "اسم الموظّف" ,
                          hintStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                                     ),
                     ),
                   ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.message),
                          hintText: "الرّسالة",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  ),
                  
                  ],
                ),
              ),
            ),
             
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                       onPressed: (() {
                         //login
                       }),
                       
                       style: ElevatedButton.styleFrom(backgroundColor: Colors.green
                        , minimumSize: Size(200, 40)),
                       child: const Text("إرسال",
                       style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)
                       ,)
                       ),
              ),
                     Container(
                      margin: const EdgeInsets.only(top: 50),
                       child: InkWell(
                        onTap: () {
                          Get.offNamed("/");
                        },
                         child: const Text("الرّجوع إلى صفحة تسجيل الدّخول",style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20 , fontWeight: FontWeight.bold
                         ,color:Color(0xff9f8040) ),),
                       ),
                     )
          ],
        ),
      ),
    );
  }
}