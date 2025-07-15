import 'package:flutter/material.dart';
import 'package:puan_harca_clone/widgets/custom_app_bar.dart';
import 'package:puan_harca_clone/widgets/custom_carousel.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  int selectedMenuIndex = 0;
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Tümü", "icon": Icons.apps},
    {"title": "Favoriler", "icon": Icons.favorite},
    {"title": "Yeme & İçme", "icon": Icons.fastfood_outlined},
    {"title": "Pazaryeri", "icon": Icons.store_mall_directory},
    {"title": "Ulaşım", "icon": Icons.location_on},
    {"title": "İletişim", "icon": Icons.forum_outlined},
    {"title": "Araç", "icon": Icons.car_repair},
    {"title": "Market", "icon": Icons.shopping_cart},
    {"title": "Cüzdan", "icon": Icons.account_balance_wallet},
    {"title": "Elektronik", "icon": Icons.computer_outlined},
    {"title": "Aile", "icon": Icons.bedroom_parent_sharp},
    {"title": "Giyim & Moda", "icon": Icons.checkroom},
  ];

  final List<Map<String, String>> brands = [
    {
      "logo": "images/milli.jpg",
      "name": "Milli Piyango",
      "category": "Tümü",
      "isFavorite": "false",
    },
    {
      "logo": "images/obilet.jpg",
      "name": "obilet",
      "category": "Ulaşım",
      "isFavorite": "false",
    },
    {
      "logo": "images/hayhay.jpg",
      "name": "Hayhay",
      "category": "Favoriler",
      "isFavorite": "false",
    },
    {
      "logo": "images/gastro.jpg",
      "name": "GASTRO",
      "category": "Yeme & İçme",
      "isFavorite": "false",
    },
    {
      "logo": "images/starbucks.png",
      "name": "Starbucks",
      "category": "Yeme & İçme",
      "isFavorite": "false",
    },
    {
      "logo": "images/petrolofisi.jpg",
      "name": "Petrol Ofisi",
      "category": "Araç",
      "isFavorite": "false",
    },
    {
      "logo": "images/abonesepeti.jpg",
      "name": "Abone sepeti",
      "category": "Pazaryeri",
      "isFavorite": "false",
    },
    {
      "logo": "images/tiklagelsin.jpg",
      "name": "tiklagelsin",
      "category": "Yeme & İçme",
      "isFavorite": "false",
    },
  ];

  /*
Yani eğer seçilen kategori "Tümü" ise hiçbir filtre uygulanmıyor, hepsi geliyor.
Eğer category alanı olmayan bir mağaza varsa, filtreye takılmıyor, sadece "Tümü" seçiliyken görünüyor.
Ama "Favoriler" gibi bir kategori seçilirse ve o mağazada "category" tanımı yoksa, o öğe filtreye girmez ve görünmez olur.
🔧 Tavsiyem: Her brand öğesinde mutlaka "category" tanımlı olmalı. Böylece filtre sistemi daha sağlıklı çalışır

  List<Map<String, String>> get filteredBrands {
    if (menuItems[selectedMenuIndex]["title"] == "Tümü") {
      return brands;
    } else {
      return brands
          .where(
            (brand) =>
                brand["category"] == menuItems[selectedMenuIndex]["title"],
          )
          .toList();
    }
  }
 */

  List<Map<String, dynamic>> get filteredBrands {
    final selectedCategory = menuItems[selectedMenuIndex]["title"];
    if (selectedCategory == "Tümü") {
      return brands;
    } else if (selectedCategory == "Favoriler") {
      return brands.where((b) => b["isFavorite"] == "true").toList();
    } else {
      return brands.where((b) => b["category"] == selectedCategory).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBar(
          titleText: "Alışveriş",
          tikoAmount: 0,
          tikoImagePath: "images/tikopuan.png",
          basketAmount: 0,
          iconData: Icons.shopping_bag,
        ),
      ),
      body: Column(
        children: [
          // Carousel ve Noktalar
          CustomCarousel(
            imageList: [
              'images/alisveris1.jpg',
              'images/alisveris2.jpg',
              'images/alisveris3.jpg',
              'images/alisveris4.jpg',
            ],
          ),

          SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                // Sol Menü
                Container(
                  width: 80,
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      bool selected = index == selectedMenuIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMenuIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: selected
                                ? Colors.pink.shade100
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                menuItems[index]["icon"],
                                color: Colors.pink,
                              ),
                              SizedBox(height: 5),
                              Text(
                                menuItems[index]["title"],
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Sağ Taraftaki Arama ve Grid
                Expanded(
                  child: Column(
                    children: [
                      // 🔍 Arama Çubuğu
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Markanı bul",
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.filter_alt_outlined),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      // 🧱 Marka GridView + Kalp İkonu
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.8,
                              ),
                          itemCount: filteredBrands.length,
                          itemBuilder: (context, index) {
                            final item = filteredBrands[index];
                            final originalIndex = brands.indexWhere(
                              (e) => e["name"] == item["name"],
                            );
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  // 🔲 İçerik (Logo + Yazı) Ortalanmış
                                  Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          item["logo"],
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          item["name"],
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ❤️ Kalp İkonu Sağ Üstte
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 6,
                                        right: 6,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            brands[originalIndex]["isFavorite"] =
                                                (brands[originalIndex]["isFavorite"] ==
                                                    "true")
                                                ? "false"
                                                : "true";
                                          });
                                        },
                                        child: Icon(
                                          item["isFavorite"] == "true"
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 18,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
