import 'package:e_project/home_screen.dart';
import 'package:e_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  bool isHide = true;

  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPass = TextEditingController();

  void login() async {
    String email = userEmail.text;
    String password = userPass.text;

    if (email == "admin" && password == "12345678") {
      SharedPreferences userCred = await SharedPreferences.getInstance();
      userCred.setString("email", email);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const bottom()));
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        SharedPreferences userCred = await SharedPreferences.getInstance();
        userCred.setString("email", email);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.code.toString())),
        );
      }
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  void dispose(){
    userEmail.dispose();
    userPass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return  Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://images.pexels.com/photos/2330507/pexels-photo-2330507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
radius: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text('Explore. Dream. Discover.',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),),),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60,vertical: 20),
              child: TextFormField(
                controller: userEmail,
validator: (value){
  if(value == null || value.isEmpty || value==' '){
return "Please Enter correct email Address";
  }else{
    return null;
  }
},
                decoration: const InputDecoration(
                  hintText: 'abc@gmail.com',
                  label: Text("Email Address"),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: TextFormField(
                controller: userPass,
                validator: (value) {
                  if (value == null || value.isEmpty || value == " ") {
                    return "Please Enter Your Password";
                  }
                  if (value.length < 8) {
                    return "Password must be of 8 Digits or more";
                  } else {
                    return null;
                  }
                },
                obscureText: isHide == true ? true : false,
                decoration:  InputDecoration(
                  hintText: '*********',
                    label: const Text("Password"),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHide = !isHide;
                          });
                        },
                        icon: isHide == true
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.panorama_fish_eye)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    debugPrint(userEmail.text);
                    debugPrint(userPass.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("User Logged in as: ${userEmail.text}, at ${time.hour}:${time.minute}"),
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            backgroundColor: Colors.green,));
                    userEmail.clear();
                    userPass.clear();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const bottom(),));
                  }
                },
                child: const Text("Login"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Forgot Password?"),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () { },
              child: const Text('Reset Password'),
            )
          ],
        ),
      ),
    );
  }
}
