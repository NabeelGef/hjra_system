import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRemember = false;
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
                 child: Text("قم بملئ البيانات المطلوبة لتسجيل الدّخول " , style: 
                 TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.black, 
                 ),)),
             ),
            Center(
              child: Column(
                children: [
                 Directionality(
                  textDirection: TextDirection.rtl,
                   child: SizedBox(
                    width: 300,
                     child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "اسم المستخدم" ,
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
                        prefixIcon: Icon(Icons.key),
                        hintText: "كلمةالمرور",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("تذكرني",style: TextStyle(fontWeight: FontWeight.bold),),
                      Checkbox(
                        value: isRemember, 
                        activeColor: Colors.green,
                        onChanged: (value){
                          setState(() {
                          isRemember = value!;  
                          });
                          
                      }),
                    ],
                  ),
                )
                ],
              ),
            ),
              Center(
              child:InkWell(
                 onTap: () {
                   //forget password
                 },
                child: const Text("نسيت كلمة المرور", style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold ,
                
                color:Color(0xff9f8040))
                ,),
              ),
             ),
              ElevatedButton(
                     onPressed: (() {
                       //login
                       Get.toNamed("/home");
                     }),
                     
                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green
                      , minimumSize: Size(200, 40)),
                     child: const Text("تسجيل الدّخول",
                     style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)
                     ,)
                     ),
                     Container(
                      margin: const EdgeInsets.only(top: 50),
                       child: InkWell(
                        onTap: () {
                          Get.offNamed("/hr");
                        },
                         child: const Text("التّواصل مع الموارد البشريّة",style: TextStyle(
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