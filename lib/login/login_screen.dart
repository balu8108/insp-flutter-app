import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/login/login_redux.dart';

import '../base/base.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, navigateToHomeIfLoggedIn(context));
    return Scaffold(
        body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: StoreConnector<LoginAppState, LoginAppState>(
        converter: (store) => store.state,
        builder: (context, LoginAppState state) => Container(
          padding: const EdgeInsets.all(32.0),
          color: const Color(0xFFF7FBFD),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Image.asset('assets/images/insplogo.png'),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Center(
                    child: Text(
                  'Welcome to INSP! 👋🏻',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
                const SizedBox(
                  height: 64,
                ),
                const Text(
                  'Email Id',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(58, 53, 65, 0.85)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                    onChanged: (text) {
                      dispatch(context, UpdateEmailId(emailId: text));
                    },
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Color(0x3A354161)),
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(14.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          borderSide: BorderSide(
                            color: Color(0x3A35413B),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          borderSide: BorderSide(
                            color: Color(0x3A35413B),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          borderSide: BorderSide(
                            color: Color(0x3A35413B),
                            width: 1.0,
                          ),
                        ))),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(58, 53, 65, 0.85)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (text) {
                    dispatch(context, UpdatePassword(password: text));
                  },
                  obscureText: !state.isPasswordVisible,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Color(0x3A354161)),
                    hintText: "Password",
                    contentPadding: const EdgeInsets.all(14.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x3A35413B),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x3A35413B),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x3A35413B),
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          // Based on passwordVisible state choose the icon
                          state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        dispatch(
                            context,
                            UpdatePasswordVisibleStatus(
                                isPasswordVisible: !state.isPasswordVisible));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                  onPressed: () {
                    dispatch(context, handleLogin(context));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF3C8DBC)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0))),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(14))),
                  child: !state.isLoading
                      ? const Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 18))
                      : const SizedBox(
                          width: 18,
                          height: 18,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  static getScreen() {
    return getBaseScreen<LoginAppState, LoginScreen>(
        loginStateReducer, const LoginAppState(), const LoginScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LoginAppState>(context, action);
  }
}
