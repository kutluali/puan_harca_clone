import 'package:flutter/material.dart';
import 'package:puan_harca_clone/widgets/custom_app_bar.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _TherePageState();
}

class _TherePageState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 242, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBar(
          titleText: "Kartlarım",
          tikoAmount: 0,
          tikoImagePath: "images/tikopuan.png",
          basketAmount: 0,
          iconData: Icons.shopping_bag,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appbarBottomContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
            child: Container(
              child: Column(
                children: [
                  Image.asset("images/card.png"),
                  SizedBox(height: 30),
                  Text(
                    "Henüz Kayıtlı Bir Kartın\nBulunmamaktadır!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Puan Harcanın avantajlarla\ndolu dünyasını keşfetmek için\nkartınızı elemeyi unutmayın.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  SizedBox(height: 60),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.pinkAccent,
                      minimumSize: Size(
                        300,
                        50,
                      ), // Genişlik: 300, Yükseklik: 50
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add_circle),
                    label: Text(
                      "KART EKLE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container appbarBottomContainer() {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 4), // sadece alttan gölge
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color.fromARGB(255, 225, 242, 250),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.asset(
                      "images/card.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "0 ₺",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Banka Kartı Puanları",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 30, width: 2, color: Colors.grey),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "0 ₺",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Banka Kartı Puanları",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white,
                        minimumSize: Size(
                          150,
                          45,
                        ), // Genişlik: 150, Yükseklik: 45
                      ),
                      onPressed: () {},
                      child: Text(
                        "Banka Kartları",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          235,
                          247,
                          253,
                        ),
                        foregroundColor: Colors.pinkAccent,
                        minimumSize: Size(
                          150,
                          45,
                        ), // Genişlik: 150, Yükseklik: 45
                      ),
                      onPressed: () {},
                      child: Text(
                        "Marka Kartları",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
