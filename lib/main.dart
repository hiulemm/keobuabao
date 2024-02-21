import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Keo bua bao',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Keo bua bao Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int mayra;
  late int input;
  bool btn1 = false;
  bool btn2 = false;
  bool btn3 = false;
  TextEditingController txtMayRa = new TextEditingController();
  TextEditingController txtKetQua = new TextEditingController();

  void xuLyRa() {
    setState(() {
      var rng = new Random();
      mayra = rng.nextInt(3);
      if(mayra==0){
        txtMayRa.text= "Keo";
      }else if(mayra==1){
        txtMayRa.text="Bua";
      }else{
        txtMayRa.text="Bao";
      }
      int kq= input-mayra;
      if(kq==0){
        txtKetQua.text="Hoa";
      }else if(kq==1||kq==-2){
        txtKetQua.text="Ban thang";
      }else{
        txtKetQua.text="Ban thua";
      }
    });
  }
  void _reset() {
    setState(() {
      txtKetQua = "" as TextEditingController;
      txtMayRa = "" as TextEditingController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.deepPurple,
              child: const Center(
                child: Text(
                  "KEO - BUA - BAO",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey
                  ),
                )
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Center(
                child: Text(
                  "Ban ra gi?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(340, 5, 0, 0),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        btn1 = true;
                        btn2 = false;
                        btn3= false;
                        input=0;
                        xuLyRa();
                      });
                    },

                    child: Text("Keo"),

                  ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          btn1 = false;
                          btn2 = true;
                          btn3= false;
                          input=1;
                          xuLyRa();
                        });
                      },

                      child: Text("Bua"),

                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          btn1 = false;
                          btn2 = false;
                          btn3= true;
                          input=2;
                          xuLyRa();
                        });
                      },

                      child: Text("Bao"),

                    ),
                  ),
        ],
      ),
            ),
                  Padding(padding: const EdgeInsets.fromLTRB(0  , 0, 0, 0),
                    child: Center(
                        child: TextField(
                        controller: txtMayRa,
                        enabled: false,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: const InputDecoration(labelText: "May ra: "),
               ),
              ),
               ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 240),
              child: Center(
                child: TextField(
                  controller: txtKetQua,
                  enabled: false,
                  style: TextStyle(fontSize: 20,color: Colors.black),
                  decoration: const InputDecoration(labelText: "Ket qua: "),
            ),

            ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  SystemNavigator.pop();
                },
                child: Text("Nghi choi"),
              ),
            )
        ],
    ),
      )
    );
  }
}
