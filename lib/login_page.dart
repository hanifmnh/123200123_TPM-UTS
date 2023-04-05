import 'package:flutter/material.dart';
import 'package:uts/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UTS TPM"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "LOGIN FORM",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
                ),
                const SizedBox(height: 100),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: userController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if(value == "123200123") {
                      return null;
                    } else if(value!.isEmpty) {
                      return "Username is required";
                    } else {
                      return "Invalid username";
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    contentPadding: const EdgeInsets.all(8.0),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off
                      ),
                    ),
                  ),
                  validator: (value) {
                    if(value == "hanif") {
                      return null;
                    } else if(value!.isEmpty) {
                      return "Password is required";
                    } else {
                      return "Invalid password";
                    }
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if(_formfield.currentState!.validate()) {
                      userController.clear();
                      passController.clear();

                      Route route = MaterialPageRoute(
                      builder: (context) => const HomePage());
                      Navigator.push(context, route);
                    } 
                  },
                  child: const SizedBox(
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}