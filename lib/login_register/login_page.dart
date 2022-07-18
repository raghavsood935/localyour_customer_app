import 'package:app/login_register/view_model.dart';
import 'package:app/utils/utils.dart';
import 'package:app/utils/views.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final phoneCtrl = useTextEditingController();
    AlertBox() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are You Sure You Want to Exit?'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  child: Text('No'),
                )
              ],
            );
          });
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ProviderListener<LoginRegisterViewModel>(
        provider: loginRegViewModelProvider,
        onChange: (context, state) {
          if (state.isLoading) {
            EasyLoading.show(
                status: 'loading...', maskType: EasyLoadingMaskType.clear);
          } else {
            EasyLoading.dismiss();
          }

          if (state.isSuccess) {
            Navigator.pushNamed(context, AppRoutes.verifyOtp,
                arguments: phoneCtrl.text.trim());
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          body: Form(
            key: _formKey,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/loginbackground.png'),
                      fit: BoxFit.fill)),
              child: Stack(children: [
                ListView(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: ButtonStyle(
                          mouseCursor: MaterialStateProperty.all(
                              MouseCursor.uncontrolled),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.homePage);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Container(
                      height: 70,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo-2.png'))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Trusted and affordable home services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff878787),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: textField(
                        context: context,
                        hintText: '10 digits mobile no.',
                        controller: phoneCtrl,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (String? val) {
                          if (val == null || !isPhoneNumber(val)) {
                            return 'Enter a valid phone no.';
                          }
                        },
                        keyboardType: TextInputType.phone,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 10,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                    image: AssetImage(
                                  'assets/images/flag_prefix.jpg',
                                ))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final mobileTxt = phoneCtrl.text.trim();
                              await context
                                  .read(loginRegViewModelProvider)
                                  .sendOtp(mobileTxt);
                            } else {
                              focusNode.requestFocus();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffC0242D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.register);
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'New User ? ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: 'Register here',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily),
                                    )
                                  ]),
                            ),
                          ),
                          // Text(
                          //   'Forgot password?',
                          //   style: TextStyle(
                          //       color: Colors.blueAccent
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'By clicking ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: 'login',
                                      style:
                                          TextStyle(color: Color(0xffC0242D)))
                                ]),
                          ),
                          Text('you are agreeing to our terms and conditions'),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
