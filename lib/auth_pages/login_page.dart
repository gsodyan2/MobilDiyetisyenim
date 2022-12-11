import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenProfilPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/test.dart';
import 'package:flutter_application_1/insertMeal.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:flutter_application_1/service/auth.dart';
import 'signin_page.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class login_page extends StatelessWidget {
  login_page({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset("assets/giriş_resim.png"),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Hoşgeldiniz!',
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Mobil Diyetisyeniniz Sizi Bekliyor..',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3,
                          color: const Color.fromRGBO(255, 139, 113, 1)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                            width: 3,
                            color: const Color.fromRGBO(255, 139, 113, 1)),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Şifre'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                        onPressed: () {
                          _authService
                              .signIn(_emailController.text,
                                  _passwordController.text)
                              .then((value) => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test(value)),
                                    )
                                  });
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(180, 2),
                        ),
                        child: const Text(
                          'Giriş',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Hala aramıza katılmadın mı? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          child: const Text(
                            'Kayıt Ol',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 139, 113, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signin_page()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          )),
        ));
  }
}
//child: Image.asset("assets/giriş_resim.png"),
