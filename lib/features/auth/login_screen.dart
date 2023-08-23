import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/router.dart';
import '../../core/widgets/image_fadder.dart';
import '../../core/widgets/main_textbutton.dart';
import '../../core/widgets/main_textformfield.dart';
import '../dash.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController teEmail = TextEditingController();
    TextEditingController tePass = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 190, 20, 30),
          child: Column(
            children: [
              const ImageFadder(
                image:
                    'https://trauxit.com/wp-content/uploads/2023/08/TRAUXIT-2.png',
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome To TRAUXIT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Please Login to Access the App',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff757779),
                ),
              ),
              const SizedBox(height: 50),
              MainTextFormField(
                padding: const EdgeInsetsDirectional.only(bottom: 16),
                teController: teEmail,
                keyboardType: TextInputType.emailAddress,
                lable: 'Email',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email is: m.salah@trauxit.com';
                  }
                  // else if (value != 'm.salah@trauxit.com') {
                  //   return 'Email is Wrong';
                  // }
                },
              ),
              MainTextFormField(
                padding: const EdgeInsetsDirectional.only(bottom: 5),
                teController: tePass,
                lable: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is: 12345678';
                  } else if (value != '12345678' ||
                      teEmail.text != 'm.salah@trauxit.com') {
                    return 'Something is Wrong';
                  }
                },
              ),
              const SizedBox(height: 15),
              MainTextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    if (teEmail.text == "m.salah@trauxit.com" &&
                        tePass.text == '12345678') {
                      RouterNavigator.navigateAndPopAll(const DashScreen());
                      CherryToast.success(
                        title: const Text('Successfully Logged In'),
                        toastPosition: Position.bottom,
                        animationType: AnimationType.fromBottom,
                        borderRadius: 8,
                      ).show(context);
                    }
                  }
                },
                title: 'Login',
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
