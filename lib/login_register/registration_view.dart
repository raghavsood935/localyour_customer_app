import 'package:app/login_register/view_model.dart';
import 'package:app/router.dart';
import 'package:app/utils/utils.dart';
import 'package:app/utils/views.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationView extends HookWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final phoneCtrl = useTextEditingController();

    return Scaffold(
      body: ProviderListener<LoginRegisterViewModel>(
        provider: loginRegViewModelProvider,
        onChange: (context, state){
          if(state.isLoading){
            EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.clear);
          } else {
            EasyLoading.dismiss();
          }

          if(state.isSuccess){
            Navigator.pushNamed(context, AppRoutes.verifyOtp, arguments: phoneCtrl.text.trim());
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 75),
                // height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(height: 20,),
              textField(
                context: context,
                controller: nameCtrl,
                hintText: 'Enter your name',
                labelText: 'Name',
                validator: (String? val){
                  if(val == null || val.isEmpty){
                    return 'Name can\'t be blank!';
                  }

                  return null;
                }
              ),
              SizedBox(height: 4,),
              textField(
                context: context,
                controller: emailCtrl,
                hintText: 'Enter your email',
                labelText: 'Email',
                  validator: (String? val){
                    if(val == null || !isEmail(val)){
                      return 'Enter a valid email!';
                    }

                    return null;
                  },
                keyboardType: TextInputType.emailAddress
              ),
              SizedBox(height: 4,),
              textField(
                context: context,
                 controller: phoneCtrl,
                hintText: 'Enter your phone number',
                labelText: 'Phone',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (String? val){
                  if(val == null || !isPhoneNumber(val)){
                    return 'Enter a valid phone no.';
                  }

                  return null;
                },
                keyboardType: TextInputType.phone
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                ),
                height: 50,
                child:
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    final nameTxt = nameCtrl.text.trim();
                    final mobileTxt = phoneCtrl.text.trim();
                    final emailTxt = emailCtrl.text.trim();

                    context.read(loginRegViewModelProvider).register(nameTxt, emailTxt, mobileTxt);
                  }
                },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffC0242D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: Text('Register',style: TextStyle(fontSize: 18),textAlign: TextAlign.center,)),
              ),
              SizedBox(height: 20,),
              Text('or',textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Text('Login to Your Account',style: TextStyle(color: AppColors.primaryColor),textAlign: TextAlign.center,)
              )
            ],
          ),
        ),
      ),
    );
  }
}
