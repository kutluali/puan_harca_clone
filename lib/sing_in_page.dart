import 'package:flutter/material.dart';
import 'package:puan_harca_clone/first_page.dart';
import 'package:puan_harca_clone/home_page.dart';
import 'package:puan_harca_clone/main.dart';
import 'package:puan_harca_clone/sign_page.dart';
import 'package:puan_harca_clone/widgets/custom_nav_bar_page.dart';
import 'package:puan_harca_clone/widgets/phone_input_field.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
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

                        //Form Telefon Numarası Input Başlangıç
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              PhoneInputField(controller: _phoneController),
                              SizedBox(height: 40),
                              Container(
                                width: double.infinity, // Tam genişlik
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pinkAccent,
                                    foregroundColor: Colors.white,
                                    minimumSize: Size(
                                      0,
                                      50,
                                    ), // Genişlik otomatik
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Geçerli input
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => CustomNavBarPage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "GİRİŞ YAP",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Form Bitiş
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FirstPage(),
                                ),
                              );
                            },
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
                                    builder: (context) => SignPage(),
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
