import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _isimController = TextEditingController();
  final _soyisimController = TextEditingController();
  final _telefonController = TextEditingController();

  bool _kullaniciSozlesmesi = false;
  bool _kvkkAydinlatma = false;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _isimController.addListener(_validateForm);
    _soyisimController.addListener(_validateForm);
    _telefonController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid =
          _isimController.text.isNotEmpty &&
          _soyisimController.text.isNotEmpty &&
          _telefonController.text.isNotEmpty &&
          _kullaniciSozlesmesi &&
          _kvkkAydinlatma;
    });
  }

  @override
  void dispose() {
    _isimController.dispose();
    _soyisimController.dispose();
    _telefonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Klavye açıldığında ekran boyutunu değiştirme
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8E7F0), // Açık pembe
              Color(0xFFE3F2FD), // Açık mavi
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar kısmı
              Expanded(
                flex: 25,
                child: Container(
                  height: 120,
                  child: Stack(
                    children: [
                      // Geri butonu
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
                      Positioned(
                        top: 90,
                        right: -18,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 75,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  transform: Matrix4.translationValues(
                    0,
                    -MediaQuery.of(context).viewInsets.bottom * 0.5,
                    0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        // Form Card
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Başlık
                                    Center(
                                      child: Text(
                                        'Üye Ol!',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Center(
                                      child: Text(
                                        'Üyelik bilgilerinizi doldurun ve Puan Harca dünyasını keşfedin!',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 8),

                                    // İsim TextField
                                    _buildTextField(
                                      controller: _isimController,
                                      labelText: 'İsim',
                                      prefixIcon: Icons.person_outline,
                                    ),
                                    SizedBox(height: 10),

                                    // Soyisim TextField
                                    _buildTextField(
                                      controller: _soyisimController,
                                      labelText: 'Soyisim',
                                      prefixIcon: Icons.person_outline,
                                    ),
                                    SizedBox(height: 10),

                                    // Telefon TextField
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: _telefonController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: "Telefon Telefonu",
                                            labelStyle: TextStyle(
                                              color: Colors.pinkAccent,
                                              fontSize: 16,
                                            ),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),

                                    // Checkbox'lar
                                    _buildCheckbox(
                                      value: _kullaniciSozlesmesi,
                                      text: '*Kullanıcı Sözleşmesi',
                                      onChanged: (value) {
                                        setState(() {
                                          _kullaniciSozlesmesi = value!;
                                        });
                                        _validateForm();
                                      },
                                    ),
                                    SizedBox(height: 2),
                                    _buildCheckbox(
                                      value: _kvkkAydinlatma,
                                      text:
                                          '*KVKK ve İşlenmesi Aydınlatma Metni',
                                      onChanged: (value) {
                                        setState(() {
                                          _kvkkAydinlatma = value!;
                                        });
                                        _validateForm();
                                      },
                                    ),
                                    SizedBox(height: 8),

                                    // Logo
                                    Center(
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                          'images/logo.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    // İleri Butonu
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: _isFormValid
                                            ? () {
                                                // Form submit işlemi
                                                print('Form submitted');
                                              }
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _isFormValid
                                              ? Colors.pink
                                              : Colors.grey[300],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              28,
                                            ),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          'İLERİ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: _isFormValid
                                                ? Colors.white
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(Color color, {bool isActive = false}) {
    return Container(
      width: isActive ? 24 : 16,
      height: isActive ? 24 : 16,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: Colors.grey[600]),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required String text,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.pink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}
