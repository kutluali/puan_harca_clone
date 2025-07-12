import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puan_harca_clone/examp.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  //initState: FocusNode'a listener ekler
  //dispose: Bellek sızıntısını önlemek için FocusNode'u temizler
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //viewInsets.bottom: Klavye yüksekliğini algılar
    //size.height: Ekran yüksekliğini alır
    //Kullanım: Klavye açıldığında UI'yı dinamik olarak ayarlar
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDEBF4), Color(0xFFE3F0F9)],
          ),
        ),
        child: Column(
          children: [
            AppBar(),

            // Alt Kısım (%65) - Beyaz Kart
            Expanded(
              flex: 65,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  0,
                  _isTextFieldFocused && keyboardHeight > 0
                      ? -(screenHeight * 0.25) // Ekranın %25'i kadar yukarı
                      : 0,
                  0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: Offset(0, -5),
                        //offset: Offset(0, -Y) → Gölge yukarı çıkar.
                        //offset: Offset(0, Y) → Gölge aşağıya düşer.
                        //offset: Offset(X, 0) → Gölge yana kayar.
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        //Başlık
                        Text(
                          "Giriş Yap",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Bilgilerinizle giriş yapın.",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(height: 35),

                        //Telefon Numarası  Input
                        TextField(
                          focusNode: _focusNode,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Cep Telefonu",
                            labelStyle: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 16,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior
                                .always, //floatingLabelBehavior: FloatingLabelBehavior.always ile label her zaman yukarıda kalır.
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
                                Text(
                                  "+90 (",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: double.infinity, // Tam genişlik
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              foregroundColor: Colors.white,
                              minimumSize: Size(0, 50), // Genişlik otomatik
                            ),
                            onPressed: () {},
                            child: Text(
                              "GİRİŞ YAP",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity, // Tam genişlik
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.pinkAccent,
                              minimumSize: Size(250, 50),

                              //Bu Kısımda ButonlaraSide ile Border verenbiliyoruz
                              side: BorderSide(
                                color: Colors.pinkAccent,
                                width: 1,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "VAZGEÇ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hesabın Yok Mu?"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ),
                                );
                              },
                              child: Text(
                                " Üye Ol",
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 35,
      child: Stack(
        children: [
          Positioned(
            top: -35,
            right: 35,
            child: CircleAvatar(radius: 40, backgroundColor: Colors.pinkAccent),
          ),
          Positioned(
            top: 75,
            right: 75,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orangeAccent,
            ),
          ),
          Positioned(
            top: 90,
            right: -18,
            child: CircleAvatar(radius: 25, backgroundColor: Colors.lightBlue),
          ),
        ],
      ),
    );
  }
}
