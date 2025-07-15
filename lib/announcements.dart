import 'package:flutter/material.dart';
import 'package:puan_harca_clone/widgets/custom_app_bar_plus.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  int selectedIndex = 0; // Default olarak "Puan Harca" seçili

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 242, 250),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomAppBarPlus(
            textTitle: "Duyurular",
            //imageLogoPath: "images/logo.png",
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //2.Column alma sebebimiz arka plan renginin beyaz olması
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 270, // Büyük kart
                            height: 110,
                            //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                            clipBehavior:
                                Clip.hardEdge, // Köşeleri kesmek için şart!
                            child: Image.asset(
                              "images/row1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 270, // Küçük kart
                            height: 110,
                            //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              "images/row2.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Kampanyalar Buton Kısımları
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kampanyalar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        //Bu kısımda Kodları nasıl kullanıcam widget olarak o yazığ
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              _buildButton(
                                Icons.card_giftcard,
                                "Puan Harca",
                                0,
                              ),
                              _buildButton(
                                Icons.account_balance_wallet,
                                "Banka",
                                1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //-- Kampanyalar Buton Bitiş
              ],
            ),

            //Bu kısmın arka plan rengi flue mavi Bu sebeple 2.Column devam
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 8,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Kampanya Ara",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.pinkAccent,
                  ), // Sol ikon
                  suffixIcon: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.pinkAccent,
                  ), // Sağ ikon
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
            ),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String text, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.pinkAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.pinkAccent,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.pinkAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedIndex == 0) {
      // Puan Harca içeriği
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 140,
                //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                clipBehavior: Clip.hardEdge, // Köşeleri kesmek için şart!
                child: Image.asset("images/offer1.jpg", fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 140,
                //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                clipBehavior: Clip.hardEdge, // Köşeleri kesmek için şart!
                child: Image.asset("images/offer2.jpg", fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 140,
                //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                clipBehavior: Clip.hardEdge, // Köşeleri kesmek için şart!
                child: Image.asset("images/offer3.jpg", fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 140,
                //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                clipBehavior: Clip.hardEdge, // Köşeleri kesmek için şart!
                child: Image.asset("images/offer4.jpg", fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 140,
                //clipBehavior: Sınır dışında taşan yerleri kesip oval görüntü sağlar. Default olarak none
                clipBehavior: Clip.hardEdge, // Köşeleri kesmek için şart!
                child: Image.asset("images/offer5.jpg", fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      );
    } else {
      // Banka içeriği
      return Column(
        children: [
          Container(
            height: 120,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "ARKADAŞINDAN ALDIĞIN DAVET KODUNU GİR 50 TL'YE KADAR PUAN KAZAN!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Daha fazla banka içeriği buraya
        ],
      );
    }
  }
}
