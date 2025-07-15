import 'package:flutter/material.dart';
import 'package:puan_harca_clone/widgets/custom_app_bar_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBarPlus(
          textTitle: "Hesabım",
          imageLogoPath: "images/logo.png",
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 225, 242, 250),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  //Profile bilgisi
                  profile(),
                  //Sipariş Alış Veriş Bilgisi Dökümü
                  shoppingOrder(),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              color: const Color.fromARGB(255, 225, 242, 250),
              padding: EdgeInsets.all(16),
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _listTile(
                      leadingCircleColor: Colors.orangeAccent,
                      leadingIcon: Icons.shopping_cart,
                      textTitle: "Siparişlerim",
                      trailingIcon: Icons.arrow_outward_outlined,
                    ),
                    _listTile(
                      leadingCircleColor: Colors.pinkAccent,
                      leadingIcon: Icons.account_balance_wallet,
                      textTitle: "Cüzdanım",
                      trailingIcon: Icons.arrow_outward_outlined,
                    ),
                    _listTile(
                      leadingCircleColor: Colors.redAccent,
                      leadingIcon: Icons.card_giftcard,
                      textTitle: "Promosyon Kodu Gir",
                      trailingIcon: Icons.arrow_outward_outlined,
                    ),
                    _listTile(
                      leadingCircleColor: Colors.blue.shade700,
                      leadingIcon: Icons.settings_applications_sharp,
                      textTitle: "Güvenlik Ayarları",
                      trailingIcon: Icons.arrow_outward_outlined,
                    ),
                    _listTile(
                      leadingCircleColor: Colors.orange,
                      leadingIcon: Icons.location_on,
                      textTitle: "Adresim",
                      trailingIcon: Icons.arrow_outward_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding profile() {
    return Padding(
      padding: const EdgeInsets.only(top: 33, left: 18, right: 18, bottom: 10),
      child: Stack(
        //clipBehavior: Clip.none dersen, Stack’in dışına taşan widget’lar da görünür.
        clipBehavior: Clip.none,
        //alignment: Alignment.topCenter dersen, Stack’in çocukları yatayda ortalanır ve dikeyde en üste hizalanır
        alignment: Alignment.topCenter,
        children: [
          // Kart
          Card(
            color: Color.fromARGB(255, 225, 242, 250),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 35,
                bottom: 5,
              ), // üstte boşluk bırak!
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Sadece isim
                  Text(
                    "Ali KUTLU",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Dışarı taşan avatar
          Positioned(
            top: -32, // avatar yarıçapı kadar yukarı taşı
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.camera_alt, color: Colors.white, size: 32),
            ),
          ),
        ],
      ),
    );
  }

  Padding shoppingOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 100, // ← Burayı ihtiyacına göre değiştir
            child: Card(
              color: Color.fromARGB(255, 225, 242, 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("Sipariş Sayısı", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Container(height: 25, width: 1, color: Colors.grey.shade300),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "100 ₺",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("Toplam Tutar", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 3,
            bottom: 0,
            child: Image.asset("images/basket.png", width: 40, height: 40),
          ),
        ],
      ),
    );
  }
}

class _listTile extends StatelessWidget {
  final Color leadingCircleColor;
  final IconData leadingIcon;
  final String textTitle;
  final IconData trailingIcon;

  const _listTile({
    super.key,
    required this.leadingCircleColor,
    required this.leadingIcon,
    required this.textTitle,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: CircleAvatar(
            backgroundColor: leadingCircleColor.withAlpha(25),
            child: Icon(leadingIcon, color: leadingCircleColor),
          ),
          title: Text(textTitle),
          trailing: Icon(trailingIcon, color: leadingCircleColor),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(height: 1, color: Colors.grey[100]),
        ),
      ],
    );
  }
}
