// Yöntem 1: Stack ile tam kontrol
import 'package:flutter/material.dart';

class CardPointsSection extends StatelessWidget {
  final int bankaKartiPuani;
  final int markaKartiPuani;

  const CardPointsSection({
    super.key,
    this.bankaKartiPuani = 0,
    this.markaKartiPuani = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Ana Row - Puanlar
          IntrinsicHeight(
            // Kartların yüksekliğini eşitler
            child: Row(
              children: [
                Expanded(
                  child: _buildPointCard(
                    title: "Banka Kartı Puanları",
                    points: bankaKartiPuani,
                    isSelected: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildPointCard(
                    title: "Marka Kartı Puanları",
                    points: markaKartiPuani,
                    isSelected: false,
                  ),
                ),
              ],
            ),
          ),
          // Sol alt köşedeki icon - Gerçekten sol alt köşede
          Positioned(
            left: -8,
            bottom: -8,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade300, Colors.orange.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withAlpha(25),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.credit_card,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointCard({
    required String title,
    required int points,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.pink.shade50 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: Colors.pink, width: 2)
            : Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$points ₺",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.pink : Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.pink : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
