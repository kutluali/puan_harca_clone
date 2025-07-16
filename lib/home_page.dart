import 'package:flutter/material.dart';
import 'package:puan_harca_clone/widgets/banners.dart';
import 'package:puan_harca_clone/widgets/custom_carousel.dart';
import 'package:puan_harca_clone/widgets/custom_tab_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Geri butonunu gizler
        backgroundColor: Colors.white,
        title: Stack(
          //Logoyu ortaladık
          alignment: Alignment.center,
          children: [
            //Logo
            Container(
              height: 80,
              width: 95,
              child: Image.asset("images/logoNew.png"),
            ),
            //Row ile Iconları Sıralıyoruz
            Row(
              //Bu Sayede Iconların 1 tanesi Sola Yerleşirken İkinci Row ile 2 tane Icon Sağa yerleşti
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _builderAppBarCircleIcon(Icons.dataset_sharp),
                Row(
                  children: [
                    _builderAppBarCircleIcon(Icons.shopping_bag),
                    SizedBox(width: 5),
                    _builderAppBarCircleIcon(Icons.notifications),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Bannerları ekstra metod olarak kullandık
              Banners(),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Kampanyalar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  Text("Tümü", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  _builderAppBarCircleIcon(Icons.arrow_circle_right_outlined),
                ],
              ),
              SizedBox(height: 15),
              //Slider Kısmı
              CustomCarousel(
                imageList: [
                  'images/slider1.jpg',
                  'images/slider2.jpg',
                  'images/slider3.jpg',
                  'images/slider4.jpg',
                ],
                height: 160,
              ),
              SizedBox(height: 15),
              CustomCarousel(imageList: ["images/davet.jpg"]),
              SizedBox(height: 15),
              CustomTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Container arkadasiniGetir() {
    return Container(
      height: 150,
      color: Colors.deepPurpleAccent.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
              children: [
                TextSpan(
                  text: "ARKADAŞINI GETİR\n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: "Davet kodunu paylaş\narkadaşların ile birlikte",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: "\nTiko Puan Kazan!", // ALT SATIRDA bu kısım!
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Kendim tanımladığım Carousel
  Container slider() {
    return Container(
      height: 160,
      color: Colors.amber.shade700,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ÜCRETSİZ OBİLET İNDİRİM KODLARI PUAN HARCA'DA!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Uçak, otel, araç kiralama ve feribot harcamalarında geçerli!",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(child: Container(child: Image.asset("images/logo.png"))),
          ],
        ),
      ),
    );
  }

  Widget _builderAppBarCircleIcon(IconData iconData) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade100,
      child: Icon(iconData, color: Colors.pinkAccent),
    );
  }
}
