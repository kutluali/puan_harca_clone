import 'package:flutter/material.dart';
import 'package:puan_harca_clone/home_page.dart';
import 'package:puan_harca_clone/main.dart';
import 'package:puan_harca_clone/widgets/custom_nav_bar_page.dart';
import 'package:puan_harca_clone/widgets/phone_input_field.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _kullaniciSozlesmesi = false;
  bool _kvkkAydinlatma = false;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _surnameController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid =
          _nameController.text.isNotEmpty &&
          _surnameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _kullaniciSozlesmesi &&
          _kvkkAydinlatma;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.trim().length < 3) {
          return 'En az 3 karakter girilmelidir.';
        }
        return null;
      },
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red, width: 1),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      // Buton gözükmediği için manuel ekledik
                      Positioned(
                        top: 16,
                        left: 16,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.pinkAccent,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withAlpha(25),
                            shape: CircleBorder(),
                          ),
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
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15),

                          // Form Card
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
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
                                      controller: _nameController,
                                      labelText: 'İsim',
                                      prefixIcon: Icons.person_outline,
                                    ),
                                    SizedBox(height: 10),

                                    // Soyisim TextField
                                    _buildTextField(
                                      controller: _surnameController,
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
                                          controller: _phoneController,
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().length < 10) {
                                              return 'Geçerli bir telefon numarası giriniz.';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Telefon Numarası",
                                            labelStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 16,
                                            ),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.auto,
                                            prefixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(width: 8),
                                                Icon(
                                                  Icons.wifi_calling_outlined,
                                                  color: Colors.grey[600],
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
                                            suffix: Text(
                                              ")",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
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
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 1,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 1,
                                                  ),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),

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
                                    SizedBox(height: 4),

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
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  // Tüm validasyon geçtiyse yönlendirme
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          CustomNavBarPage(),
                                                    ),
                                                  );
                                                }
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
    );
  }
}
