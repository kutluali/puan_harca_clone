import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.phone,
      maxLength: 10, // Kullanıcıya 10 karakter girme zorunluluğu getirdik
      decoration: InputDecoration(
        labelText: "Cep Telefonu",
        labelStyle: TextStyle(color: Colors.pinkAccent, fontSize: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Icon(
              Icons.wifi_calling_outlined,
              color: Colors.pinkAccent,
              size: 20,
            ),
            SizedBox(width: 9),
            Text("+90 (", style: TextStyle(color: Colors.black, fontSize: 16)),
          ],
        ),
        // Alan aktif değilken (odakta değilken) gri kenarlık gösterilir
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        // Alan odaktayken focus durumunda
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        // Hata durumunda kenarlık kırmızı olarak gösterilir
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        counterText:
            "", // maxLength sayacını gizler Yani 10 karakter olma durumu
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen telefon numaranızı girin'; //Boş olma durumu kontrolü
        }
        if (!RegExp(r'^\d+$').hasMatch(value)) {
          return 'Sadece rakam giriniz'; // Rakam durumu olma kontorolü
        }
        if (value.length < 10) {
          return 'Telefon numarası 10 haneli olmalıdır';
        }
        if (value.length > 10) {
          return 'Telefon numarası 10 haneden fazla olamaz';
        }
        return null; // Geçerli ise null döner
      },
      onChanged: onChanged,
    );
  }
}
