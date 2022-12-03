import 'package:flutter/material.dart';
import 'signin_page.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class login_page extends StatelessWidget {
  login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.grey[300],
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
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
                    child: const Center(
                      child: Text(
                        'Giriş',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
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
                                  builder: (context) => const signin_page()),
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
