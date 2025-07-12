import 'package:flutter/material.dart';
import 'package:puan_harca_clone/examp.dart';
import 'package:puan_harca_clone/sing_in_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Yatayda tüm alanı kapla
        height: double.infinity, // Dikeyde tüm alanı kapla
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //Gradient(dereceli geçiş), bir renk geçişi efekti anlamına gelir. Yani bir kutunun veya arka planın bir renkten başka bir renge yumuşak geçiş yaparak boyanmasını sağlar.
            colors: [Color(0xFFEE2D6E), Color(0xFFF96700)],
            begin: Alignment.topCenter,
            //Default olarak soldan sağa doğru(left - right) rengi yayar. Biz bu parametreleri ekleyerek yukarıdan aşağıya doğru renk geçişi yaptık.
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -35, // -35px dışarda
              left: 35, //soldan 35 px ilerde
              child: CircleAvatar(backgroundColor: Colors.white, radius: 40),
            ),
            Positioned(
              top: 90,
              left: -15,
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 20,
              ),
            ),
            Positioned(
              top: 75,
              left: 75,
              child: CircleAvatar(radius: 60, backgroundColor: Colors.orange),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Puan Harca'ya",
                    style: TextStyle(color: Colors.white, fontSize: 29),
                  ),
                  Text(
                    "Hoş Geldiniz!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Burada Harca, Akıllıca Harca",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, //Default olarak beyazdır zaten
                      foregroundColor: Colors.pinkAccent,
                      minimumSize: Size(
                        250,
                        50,
                      ), //minimumSize ile buton genişliği ve yüksekliği verebiliriz.

                      shape: StadiumBorder(),
                      //Butonu stadyum (oval) şekline sokar
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SingInPage()),
                      );
                    },
                    child: Text(
                      "GİRİŞ YAP",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  //Üye Ol Butonu
                  //Outline Buton backgroundColor rengini Eklenmezse sayfanın ranginden alır. ElevatedButton da default olarak Beyazdır.
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      //BorderSide ile Beyaz Kenarlık ekledik.
                      side: BorderSide(color: Colors.white),
                      minimumSize: Size(250, 50),
                      foregroundColor: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text("ÜYE OL!"),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "ŞİMDİ KEŞFET",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        //Yazının altına çizgi vermek için yapılır
                        decorationColor: Colors.white,
                        //Çizginin Rengi
                        decorationThickness: 1,
                        //Çizginin Kalınlığı
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 85,
              left: -22,
              right: 0,
              child: CircleAvatar(radius: 3, backgroundColor: Colors.white),
            ),
            Positioned(
              bottom: 95,
              left: -15,
              right: 0,
              child: CircleAvatar(radius: 6, backgroundColor: Colors.white),
            ),
            Positioned(
              bottom: 88,
              left: -0,
              right: -18,
              child: CircleAvatar(radius: 7, backgroundColor: Colors.white),
            ),
            Positioned(
              bottom: 30,
              left: 0, //Değerleri 0 vererek ortaladık.
              right: 0,
              child: Column(
                children: [
                  Icon(Icons.card_giftcard, color: Colors.white, size: 32),
                  Text(
                    "PUAN HARCA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 1.2,

                      //letterSpacing: Yazılar arası Boşluğu velirler
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
