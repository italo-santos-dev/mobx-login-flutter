import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_project/app/app_images.dart';
import 'package:mobx_project/screens/login_screen.dart';
import 'package:mobx_project/stores/login_store.dart';
import 'package:mobx_project/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  LoginStore loginStore = LoginStore();

  late ReactionDisposer disposer;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
  //     if (loggedIn != null)
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(AppImages.profilei),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        // Observer(
                        //   builder: (_) {
                        //     return CustomTextField(
                        //       hint: 'E-mail',
                        //       prefix: Icon(Icons.account_circle),
                        //       textInputType: TextInputType.emailAddress,
                        //       onChanged: loginStore.setEmail,
                        //       enabled: !loginStore.loading, suffix: Icon(Icons.account_circle),
                        //       controller: TextEditingController(),
                        //     );
                        //   },
                        // ),
                        SizedBox(
                          height: 16.0,
                        ),
                        // Observer(
                        //   builder: (_) {
                        //     return SizedBox(
                        //       height: 44.0,
                        //       child: ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Theme.of(context).primaryColor,
                        //           textStyle: TextStyle(
                        //             fontSize: 15.0,
                        //           ),
                        //         ),
                        //         onPressed: loginStore.loginPressed,
                        //         child: loginStore.loading
                        //             ? CircularProgressIndicator(
                        //           valueColor:
                        //           AlwaysStoppedAnimation(Colors.white),
                        //         )
                        //             : Text('Login'),
                        //       ),
                        //     );
                        //   },
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
