import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StoreConnector<LoginAppState, LoginAppState>(
          converter: (store) => store.state,
          builder: (context, LoginAppState state) => Scaffold(
            backgroundColor: const Color.fromRGBO(247, 251, 253, 1),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image.asset('assets/images/insplogo.png'),
                      ),
                      const SizedBox(height: 23),
                      const Center(
                        child: Text(
                          'Welcome to INSP! 👋🏻',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const Text(
                        'Email ID',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(58, 53, 65, 0.85),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        onChanged: (text) {
                          dispatch(context, UpdateEmailId(emailId: text));
                        },
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0x613A3541),
                          ),
                          contentPadding: EdgeInsets.all(14.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(58, 53, 65, 0.23),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(58, 53, 65, 0.85),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        onChanged: (text) {
                          dispatch(context, UpdatePassword(password: text));
                        },
                        obscureText: !state.isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0x613A3541),
                          ),
                          contentPadding: const EdgeInsets.all(14.0),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(58, 53, 65, 0.23),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              dispatch(
                                context,
                                UpdatePasswordVisibleStatus(
                                  isPasswordVisible: !state.isPasswordVisible,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            dispatch(context, handleLogin(context));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF3C8DBC),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0,
                              ),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          child: !state.isLoading
                              ? const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                )
                              : const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static getScreen() {
    return getBaseScreen<LoginAppState, LoginScreen>(
        loginStateReducer, const LoginAppState(), const LoginScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LoginAppState>(context, action);
  }
}
