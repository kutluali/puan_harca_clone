import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 1; // Default "Yeni Gelen" seçili

  final List<TabData> tabs = [
    TabData(
      title: "Popüler",
      icon: Icons.trending_up,
      offers: [
        OfferData(
          logo: "images/hayhay.jpg",
          title: "E-Şans Puan",
          price: "100 ₺",
        ),
        OfferData(
          logo: "images/hediyenkart.jpg",
          title: "Opet Yakıt Çeki",
          price: "250 ₺",
        ),
        OfferData(
          logo: "images/gastro.jpg",
          title: "GastroClub Kupon Kodu",
          price: "100 ₺",
        ),
      ],
    ),
    TabData(
      title: "Yeni Gelen",
      icon: Icons.card_giftcard,
      offers: [
        OfferData(
          logo: "images/starbucks.png",
          title: "E-Şans Puan",
          price: "100 ₺",
        ),
        OfferData(
          logo: "images/obilet.jpg",
          title: "Opet Yakıt Çeki",
          price: "250 ₺",
        ),
        OfferData(
          logo: "images/fizy.jpg",
          title: "GastroClub Kupon Kodu",
          price: "100 ₺",
        ),
      ],
    ),
    TabData(
      title: "Fırsatlar",
      icon: Icons.local_offer,
      offers: [
        OfferData(
          logo: "images/binbin.jpg",
          title: "E-Şans Puan",
          price: "100 ₺",
        ),
        OfferData(
          logo: "images/abonesepeti.jpg",
          title: "Opet Yakıt Çeki",
          price: "250 ₺",
        ),
        OfferData(
          logo: "images/petrolofisi.jpg",
          title: "GastroClub Kupon Kodu",
          price: "100 ₺",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: List.generate(
              tabs.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? const Color(0xFFE91E63)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            tabs[index].icon,
                            size: 20,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.pinkAccent,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            tabs[index].title,
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.pinkAccent,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // GridView - Revize edilmiş kısım
        Container(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            shrinkWrap:
                true, // ✅ Önemli: GridView boyutunu içeriğe göre ayarlar
            physics:
                const NeverScrollableScrollPhysics(), // ✅ Scroll problemini çözer
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75, // ✅ Biraz daha geniş oran
            ),
            itemCount: tabs[selectedIndex].offers.length,
            itemBuilder: (context, index) {
              final offer = tabs[selectedIndex].offers[index];
              return Container(
                decoration: BoxDecoration(
                  // ✅ Mavi tonlu gradient arka plan
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFE3F2FD), // Açık mavi
                      Color(0xFFBBDEFB), // Orta mavi
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // ✅ Eşit dağılım
                    children: [
                      // ✅ Logo kısmı - Flexible ile responsive
                      Flexible(
                        flex: 2,
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 60,
                            maxHeight: 45,
                          ),
                          child: Image.asset(
                            offer.logo,
                            fit: BoxFit.contain, // ✅ Logonun oranını korur
                          ),
                        ),
                      ),

                      // ✅ Fiyat kısmı - Flexible ile responsive
                      Flexible(
                        flex: 1,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            offer.price,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // ✅ Koyu mavi renk
                            ),
                          ),
                        ),
                      ),

                      // ✅ Başlık kısmı - İki satır için optimize
                      Flexible(
                        flex: 1,
                        child: Text(
                          offer.title,
                          textAlign: TextAlign.center,
                          maxLines: 2, // ✅ Maksimum 2 satır
                          overflow:
                              TextOverflow.ellipsis, // ✅ Taşma durumunda ...
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            height: 1.2, // ✅ Satır yüksekliği
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TabData {
  final String title;
  final IconData icon;
  final List<OfferData> offers;

  TabData({required this.title, required this.icon, required this.offers});
}

class OfferData {
  final String logo;
  final String title;
  final String price;

  OfferData({required this.logo, required this.title, required this.price});
}
