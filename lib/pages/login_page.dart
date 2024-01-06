import 'package:dio_flutter_navigation_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');
  bool _isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 230, 237, 241),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 4,
                    child: Image.network(
                        'https://vaspbr.com.br/assets/images/logo.png')),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(
              height: 110,
            ),
            const Text(
              'Já tem cadastro?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Text('Faça seu login e viaje bem...',
                style: TextStyle(fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 70,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: TextField(
                controller: _emailController,
                onChanged: (value) {
                  debugPrint(value);
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: -6),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: TextField(
                obscureText: _isObscureText,
                controller: _passController,
                onChanged: (value) {
                  debugPrint(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: -6),
                  hintText: 'Senha',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isObscureText = !_isObscureText;
                      });
                    },
                    child: Icon(
                      _isObscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              // height: 30,
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (_emailController.text.trim() == 'email@email.com' &&
                        _passController.text.trim() == '123') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Erro ao efetuar o login!')));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Text('Esqueci minha senha'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Text('Criar conta',
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 111, 194),
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
