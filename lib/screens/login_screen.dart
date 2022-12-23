import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_project/screens/reset_password_screen.dart';
import 'package:mobx_project/stores/login_store.dart';
import 'package:mobx_project/widgets/custom_icon_button.dart';
import 'package:mobx_project/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn != null)
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => ListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.loading,
                        suffix: Icon(Icons.account_circle),
                        controller: TextEditingController(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !loginStore.passwordVisible,
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: loginStore.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: loginStore.togglePasswordVisbility,
                        ),
                        textInputType: TextInputType.text,
                        controller: TextEditingController(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 44.0,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        "Esqueceu sua senha?",
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        height: 44.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListScreen()),
                            );
                          },
                          child: Text("Login"),
                          // onPressed: loginStore.loginPressed,
                          // child: loginStore.loading
                          //     ? CircularProgressIndicator(
                          //         valueColor:
                          //             AlwaysStoppedAnimation(Colors.white),
                          //       )
                          //     : Text('Login'),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
