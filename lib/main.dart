import 'package:bilgi_testi/constants.dart';
import 'package:bilgi_testi/test_veri.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri test_1 = TestVeri();
  int soruIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //test_1.soruBankasi[soruIndex].soruMetni,
                test_1.getSoruMetni(soruIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(spacing: 5, runSpacing: 5, children: secimler),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            //test_1.soruBankasi[soruIndex].soruYaniti = false;
                            setState(() {
                              //test_1.soruBankasi[soruIndex].soruYaniti == false
                              test_1.getSoruYaniti(soruIndex) == false
                                  ? secimler.add(kDogruIkonu)
                                  : secimler.add(kYanlisIkonu);
                              soruIndex++;
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            //test_1.soruBankasi[soruIndex].soruYaniti = true;
                            setState(() {
                              //test_1.soruBankasi[soruIndex].soruYaniti == true
                              test_1.getSoruYaniti(soruIndex) == true
                                  ? secimler.add(kDogruIkonu)
                                  : secimler.add(kYanlisIkonu);
                              soruIndex++;
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
