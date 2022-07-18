import 'dart:async';
import 'package:app/login_register/view_model.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/router.dart';
import 'package:app/secure_storage.dart';
import 'package:app/utils/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers.dart';

class VerifyOtpView extends HookWidget {
  final mobile;
  VerifyOtpView(this.mobile);

  @override
  Widget build(BuildContext context) {
    final otpInputCtrl = useTextEditingController();
    final enableSubmit = useState(false);
    final buttonName = useState("RESEND OTP");
    final start = useState(10);
    final wait = useState(false);

    return ProviderListener<LoginRegisterViewModel>(
      provider: loginRegViewModelProvider,
      onChange: (context, state) async {
        final userId =
            await context.read(secureStorageServiceProvider).getString('id');
        if (state.isLoading) {
          EasyLoading.show(
              status: 'loading...', maskType: EasyLoadingMaskType.clear);
        } else {
          EasyLoading.dismiss();
        }

        if (state.isSuccess) {
          if (state.user == null) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.loginPage, ModalRoute.withName('/'));
          } else {
            await Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.addlocation, ModalRoute.withName('/'))
                .then((value) => context
                    .read(homeViewModelProvider)
                    .getCartItems(int.parse('$userId')))
                .then((value) => context
                    .read(homeViewModelProvider)
                    .customerProfileInfo(
                        CustomerId(customerID: int.parse('$userId'))));
          }
        }

        if (state.errorMsg.isNotEmpty) {
          showSnackBar(context, state.errorMsg);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/loginbackground.png'),
                  fit: BoxFit.fill)),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'Enter Verification Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We have sent the verification code to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff878787),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              Text(
                'your mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff878787),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                child: PinCodeTextField(
                  appContext: context,
                  controller: otpInputCtrl,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  autoFocus: true,
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  // validator: (v) {
                  //    if (v.length < 3) {
                  //      return "I'm from validator";
                  //    } else {
                  //      return null;
                  //    }
                  //  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 45,
                    fieldWidth: 40,
                    // activeFillColor: useProvider(authUserViewModelProvider).caughtError ? Colors.orange : Colors.white,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    disabledColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: AppColors.primaryColor,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  //controller: textEditingController,
                  keyboardType: TextInputType.number,
                  // boxShadows: [
                  //    BoxShadow(
                  //      offset: Offset(0, 1),
                  //      color: Colors.black12,
                  //      blurRadius: 10,
                  //    )
                  //  ],
                  onCompleted: (v) {
                    // context.read(loggerProvider).d(v);
                    // // submit(context);
                    enableSubmit.value = true;
                  },
                  onChanged: (value) {
                    // // context.read(otpProvider).state = value;
                    // enableSubmit.value = value.length == 6;
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 45,
                  child: ElevatedButton(
                    onPressed: enableSubmit.value
                        ? () {
                            // Navigator.pushNamed(context, AppRoutes.homePage);
                            if (context
                                .read(loginRegViewModelProvider)
                                .isLoginProcess) {
                              context
                                  .read(loginRegViewModelProvider)
                                  .verifyOtpAndLogin(mobile, otpInputCtrl.text);
                            } else {
                              context
                                  .read(loginRegViewModelProvider)
                                  .registerWithOtp(mobile, otpInputCtrl.text);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffC0242D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Verify',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't Get An OTP ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lato().fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        Fluttertoast.showToast(msg: "Please Wait..");
                        Fluttertoast.showToast(msg: "OTP Sent Again");
                        wait.value = true;
                        const onsec = Duration(seconds: 1);
                        Timer _timer = Timer.periodic(onsec, (timer) {
                          if (start.value == 0) {
                            wait.value = false;
                            start.value = 10;
                            timer.cancel();
                          } else {
                            start.value--;
                          }
                        });
                      },
                      child: Text(
                        buttonName.value,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: wait.value
                              ? Colors.grey
                              : Color(
                                  0xffC0242D,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Send OTP again in,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lato().fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${start.value} Sec",
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0xffC0242D,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
