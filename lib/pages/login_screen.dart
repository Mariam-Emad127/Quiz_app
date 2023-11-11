
import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'package:quiz/pages/resgister_page.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

 static String id="LoginPage";

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
          backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
               // SizedBox(height: 100,),
                Image.asset("assets/images/scholar.png",height: 100,),
                const Text(
                  "Scholar Chat",
                  style: (TextStyle(
                      fontSize: 30, fontFamily: "Pacifico", color: Colors.white)),
                ),
                const SizedBox(height: 15,),
                const Row(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),

                  ],
                ),
                const SizedBox(height: 10,),
                CustomTextField(hintText: "Email",onChanged:(data){email=data;},),
                 const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscureText: true,

                  //obscureText: true,
                  hintText: "Password",onChanged: (data){password=data;},),
                const SizedBox(height: 10,),
                CustomButon(text: "Login",
                onTap:()async {
                  if (formKey.currentState!.validate()) {
                  isloading = true;
                  setState(() {});
                  try {
                  //UserCredential user =
                  await loginUser();
                  //showSnackBar(context, " success");
                  Navigator.pushNamed(context, HomePage.id,arguments: email);
                  // print(user.user!.displayName);
                  } on FirebaseAuthException catch (ex) {
                  if (ex.code == 'user-not-found') {
                  showSnackBar(context, "user not found");
                  } else if (ex.code == 'wrong-password') {
                  showSnackBar(context, 'wrong password');
                  //SnackBar(content, 'email already exists');
                  }
                  } catch (ex) {
                    print(ex);
                  showSnackBar(context, " 'there was an error'");
                  }
                  isloading = false;
                  setState(() {});
                  } else {}
                  },


                ),
           const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'dont\'t have an account?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,RegisterPage.id);

                    },
                child: const Text(
                    '  Register',
                    style: TextStyle(
                      color: Color(0xffC7EDE6),
                    ),
                ),
              ),
              ]
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

}
