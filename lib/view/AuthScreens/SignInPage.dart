import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/ButtonValidationBloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/SignInBloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/ValidationBloc.dart';
import 'package:news_app/viewmodel/events/AuthEvents/ButtonValidationEvent.dart';
import 'package:news_app/viewmodel/events/AuthEvents/FirebaseAuthEvent.dart';
import 'package:news_app/viewmodel/events/AuthEvents/ValidationEvent.dart';
import 'package:news_app/viewmodel/states/AuthStates/ButtonValidationState.dart';
import 'package:news_app/viewmodel/states/AuthStates/ValidationState.dart';
import 'package:news_app/view/AuthScreens/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color lightGrey = Color(0xFFF5F5F5);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SignInButtonValidationBloc>().add(
      ButtonEnableDisableEvent(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    context.read<SignINEmailValidationbloc>().add(ResetValidationEvent());
    context.read<SignInPasswordValidationBloc>().add(ResetValidationEvent());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              "Sign In",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),

            // Email
            TextField(
              onChanged: (email) {
                context.read<SignINEmailValidationbloc>().add(
                  EmailValidationEvent(email: email),
                );
                context.read<SignInButtonValidationBloc>().add(
                  ButtonEnableDisableEvent(
                    email: email,
                    password: passwordController.text,
                  ),
                );
              },
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGrey,
                hintText: "E-Mail",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: primaryBlue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            BlocBuilder<SignINEmailValidationbloc, EmailValidationState>(
              builder: (_, state) {
                if (state is InitialEmailValidationState) {
                  return Text("");
                } else if (state is InValidEmail) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.message ?? "",
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  );
                } else if (state is ValidEmail) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.message ?? "",
                      style: TextStyle(color: Colors.green, fontSize: 13),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),

            const SizedBox(height: 16),

            // Password
            TextField(
              onChanged: (password) {
                context.read<SignInPasswordValidationBloc>().add(
                  PasswordValidationEvent(password: password),
                );
                context.read<SignInButtonValidationBloc>().add(
                  ButtonEnableDisableEvent(
                    email: emailController.text,
                    password: password,
                  ),
                );
              },
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGrey,
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock_outline, color: primaryBlue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            BlocBuilder<SignInPasswordValidationBloc, PasswordValidationState>(
              builder: (_, state) {
                if (state is InitialPasswordValidationState) {
                  return Text("");
                } else if (state is InValidPassword) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.message ?? "",
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  );
                } else if (state is ValidPassword) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.message ?? "",
                      style: TextStyle(color: Colors.green, fontSize: 13),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),

            const SizedBox(height: 30),

            // Sign In Button
            BlocBuilder<
              SignInButtonValidationBloc,
              SignInButtonvalidationstate
            >(
              builder: (_, state) {
                if (state is SignInEnableState) {
                  return SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(
                          SigInEvent(
                            email: state.email,
                            password: state.password,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                } else if (state is SignInDisableState) {
                  return SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 20),

            // Navigate to Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If not registered yet please ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpPage()),
                    );
                    // navigate to SignUpPage
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
