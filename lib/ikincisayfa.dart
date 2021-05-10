import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IkinciSayfa extends StatefulWidget {
  @override
  _IkinciSayfaState createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {
  Future<void> veriOku() async {
    var sp = await SharedPreferences.getInstance();

    String ad = sp.getString("ad") ?? "isim yok";
    int yas = sp.getInt("yas") ?? 0;
    double boy = sp.getDouble("boy") ?? 0.00;
    bool mezunMu = sp.getBool("mezunMu") ?? false;

    var bilinenDiller = sp.getStringList("bilinenDiller") ?? null;

    print("Ad : $ad");
    print("Yaş : $yas");
    print("Boy : $boy");
    print("Mezun mu ? : $mezunMu");
    for (var a in bilinenDiller) {
      print("Bilinen Diller : $a");
    }
  }

  /*Future<void> veriSil() async {
    var sp = await SharedPreferences.getInstance();           Veri silmek için.
    sp.remove("ad");
  }*/

  /*Future<void> veriGuncelle() async {
    var sp = await SharedPreferences.getInstance();           Veri güncellemek için.
    sp.setInt("yas", 50);
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Veriler Konsolda"),
      ),
    );
  }
}
