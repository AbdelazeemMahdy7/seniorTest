import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {

 final TextEditingController emailcontroller=TextEditingController();
 final TextEditingController passwordController=TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: Form(
            key: formkey,
            child: Column(children: [
              TextFormField(
                controller: emailcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email Required";
                  }
                  if (!value.contains("@") && !value.contains(".")) {
                    return "Email Valid";
                  }
                  return null;
                },
                enabled: true,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value!.length < 8) {
                    return "Email must Have a 8 Characters";
                  }
                  return null;
                },
                enabled: true,
                maxLines: 1,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: ()=> register(),
                  child: const Text("Register"),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

void register() {
    String email =emailcontroller.text;
    String password =passwordController.text;

    context.read<AuthCubit>().createAccount(email: email, password: password);

  }
}


