import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final Widget topRightWidget;
  final String amountText;
  final String titleText;
  final String buttonText;
  final Color backgroundColor;
  final Color buttonColor;
  final VoidCallback onPressed;

  const BannerCard({
    super.key,
    required this.topRightWidget,
    required this.amountText,
    required this.titleText,
    required this.buttonText,
    required this.backgroundColor,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 28, width: 28, child: topRightWidget),
              ],
            ),
            Text(
              amountText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Text(
              titleText,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BannerCard(
            topRightWidget: Icon(
              Icons.add_card_rounded,
              color: Colors.orange,
              size: 28,
            ),
            amountText: "0 ₺",
            titleText: "Banka Puanlarım",
            buttonText: "Tiko Puan'a Çevir",
            backgroundColor: Colors.amber.shade100,
            buttonColor: Colors.orangeAccent,
            onPressed: () {},
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: BannerCard(
            topRightWidget: Image.asset("images/tikopuan.png"), // logo görseli
            amountText: "0 ₺",
            titleText: "Tiko Puanım",
            buttonText: "Hemen Harca",
            backgroundColor: const Color.fromARGB(255, 252, 228, 237),
            buttonColor: Colors.pinkAccent,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
