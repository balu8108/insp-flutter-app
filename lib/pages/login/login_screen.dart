import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:insp/base/base.dart';
import 'package:insp/pages/login/login_redux.dart';
import 'package:insp/redux/AppState.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static void dispatch(BuildContext context, LoginAction action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      body: Center(
        child: StoreConnector<AppState, LoginAppState>(
          converter: (store) => store.state.loginState,
          builder: (context, LoginAppState state) => Scaffold(
            backgroundColor: const Color.fromRGBO(247, 251, 253, 1),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double formWidth = constraints.maxWidth > 600
                          ? constraints.maxWidth * 0.3
                          : constraints.maxWidth;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          SizedBox(
                            width: formWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    store
                                        .dispatch(UpdateEmailId(emailId: text));
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
                                    store.dispatch(
                                        UpdatePassword(password: text));
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
                                        store.dispatch(
                                          UpdatePasswordVisibleStatus(
                                            isPasswordVisible:
                                                !state.isPasswordVisible,
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
                                      store.dispatch(handleLogin(context));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                        const Color(0xFF3C8DBC),
                                      ),
                                      padding:
                                          WidgetStateProperty.all<EdgeInsets>(
                                        const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical: 10.0,
                                        ),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
