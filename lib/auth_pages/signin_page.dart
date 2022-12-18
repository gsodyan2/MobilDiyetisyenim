import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_pages/login_page.dart';
import 'package:flutter_application_1/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class signin_page extends StatelessWidget {
  signin_page({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Mobil Diyetisyenim'),
            backgroundColor: const Color.fromRGBO(255, 139, 113, 1),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 139, 113, 1),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Kayıt Ol',
                            style: GoogleFonts.bebasNeue(fontSize: 52),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Şifre'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _fullNameController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'İsim Soyisim'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _lengthController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: 'Boy'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _weightController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: 'Kilo'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _genderController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Cinsiyet'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Şehir'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _jobController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Meslek'),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _authService
                                  .signUp(
                                      _emailController.text,
                                      _passwordController.text,
                                      _fullNameController.text,
                                      int.parse(_weightController.text),
                                      int.parse(_lengthController.text),
                                      _genderController.text,
                                      _cityController.text,
                                      _jobController.text)
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login_page())));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: Size(200, 50),
                            ),
                            child: Text('Onayla',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 30, color: Colors.black))),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            ),
          )),
    );
  }
}
