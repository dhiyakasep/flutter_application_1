import 'package:dhiya12rpl1_app/screens/home.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPassword = false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(
              maxWidth: 350,
            ),
            child: Form(key: _formKey, child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 100),
                  SizedBox(height: 10,),
                  Text("Selamat Datang Di Aplikasi Flutter!",
                  style: Theme.of(context,).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Masukan Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Email Tidak Boleh Kosong';
                      }
                      final emailRegex = r'^[a-zA-Z0-9. %+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      final emailValid = RegExp(emailRegex).hasMatch(value);
                      if(!emailValid){
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    obscureText: !_isPassword,

                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukan Kata Sandi',
                      prefixIcon: const Icon(Icons.lock_clock_rounded),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(icon: Icon( _isPassword ? Icons.visibility_off : Icons.visibility,), onPressed: () { 
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                       },
                       ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Kata sandi tidak boleh kosong';
                      }
                      if(value.length < 6){
                        return 'Kata sandi minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4,),
                      ),
                    ), onPressed: (){
                      if(_formKey.currentState?.validate() ?? false){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const homePage(),
                        ),
                        );
                      }
                    }, child: const Padding(padding: EdgeInsets.all(10.0),
                    child: Text("Masuk",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                    ),),
                  )
                ],
              ),
            ),),
          ),
        ),
      ),
    );
  }
}