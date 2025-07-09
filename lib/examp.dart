import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeSurname = FocusNode();
  final FocusNode _focusNodePhone = FocusNode();

  bool _isAnyTextFieldFocused = false;
  bool _agreeTerms = false;
  bool _agreePrivacy = false;

  @override
  void initState() {
    super.initState();

    void addFocusListener(FocusNode node) {
      node.addListener(() {
        setState(() {
          _isAnyTextFieldFocused =
              _focusNodeName.hasFocus ||
              _focusNodeSurname.hasFocus ||
              _focusNodePhone.hasFocus;
        });
      });
    }

    addFocusListener(_focusNodeName);
    addFocusListener(_focusNodeSurname);
    addFocusListener(_focusNodePhone);
  }

  @override
  //initState: FocusNode'a listener ekler
  //dispose: Bellek sızıntısını önlemek için FocusNode'u temizler
  void dispose() {
    _focusNodeName.dispose();
    _focusNodeSurname.dispose();
    _focusNodePhone.dispose();
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFDEBF4), Color(0xFFE3F0F9)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: -15,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.lightBlue,
                    ),
                  ),
                  Positioned(
                    top: -35,
                    right: 35,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.pinkAccent,
                    ),
                  ),
                  Positioned(
                    top: 75,
                    right: 75,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 75,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  0,
                  _isAnyTextFieldFocused && keyboardHeight > 0
                      ? -(screenHeight * 0.25)
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
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          "Üye Ol!",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Üyelik bilgilerinizi doldurun ve Puan Harca dünyasını keşfedin!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 30),

                        //İsim Input
                        TextField(
                          focusNode: _focusNodeName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_sharp),
                            labelText: "İsim",
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
                        //Soyisim Input
                        SizedBox(height: 10),
                        TextField(
                          focusNode: _focusNodeSurname,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_sharp),
                            labelText: "Soyisim",
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
                        SizedBox(height: 15),
                        //Telefon Numarası  Input
                        TextField(
                          focusNode: _focusNodePhone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Telefon Telefonu",
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
                        SizedBox(height: 8),
                        CheckboxListTile(
                          title: Text(
                            "*Kullanıcı Sözleşmesi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity
                              .leading, // ✅ tik sola geçer
                          activeColor: Colors.pink.shade50,
                          checkColor: Colors.pink.shade600,
                          value: _agreeTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeTerms = value!;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        CheckboxListTile(
                          title: Text(
                            "*KVKK ve İşletmesi Aydınlaşma Metni",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity
                              .leading, // ✅ tik sola geçer
                          activeColor: Colors.pink.shade50,
                          checkColor: Colors.pink.shade600,
                          value: _agreePrivacy,
                          onChanged: (value) {
                            setState(() {
                              _agreePrivacy = value!;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // 🎁 Hediye ikonu
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.pinkAccent,
                                size: 32,
                              ),

                              // 🟠 Turuncu yuvarlak (ikonun üstünde 1.)
                              Positioned(
                                bottom: 85,
                                left: -22,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 95,
                                left: -15,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 88,
                                left: -0,
                                right: -18,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 5),
                        Container(
                          width: double.infinity, // Tam genişlik
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade300,
                              foregroundColor: Colors.grey,
                              minimumSize: Size(250, 50),

                              //Bu Kısımda ButonlaraSide ile Border verenbiliyoruz
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "İLERİ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
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
