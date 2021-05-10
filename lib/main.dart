import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_example/ikincisayfa.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Future<void> veriKaydi() async {
    var sp = await SharedPreferences.getInstance();

    sp.setString("ad", "Fatih");
    sp.setInt("yas", 27);
    sp.setDouble("boy", 1.93);
    sp.setBool("mezunMu", true);

    var bilinenDiller = List<String>();
    bilinenDiller.add("Java");
    bilinenDiller.add("Dart");

    sp.setStringList("bilinenDiller", bilinenDiller);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Tıkla"),
              onPressed: () {
                veriKaydi();
                Navigator.push(context, MaterialPageRoute(builder: (context) => IkinciSayfa()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
