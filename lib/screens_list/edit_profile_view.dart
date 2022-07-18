import 'package:app/auth/auth_user_model.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router.dart';

final _formKey = GlobalKey<FormState>();

class EditProfileViewArgs{
  final String? name;
  final String? email;
  final String? phoneNumber;
  // final String? gender;
  EditProfileViewArgs({
    this.name,
    this.email,
    this.phoneNumber,
    // this.gender,
  });
}

class EditProfileView extends HookWidget {
  // final CustomerProfile? csProfile;
  final EditProfileViewArgs? args;
  const EditProfileView({Key? key, this.args}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final phoneCtrl = useTextEditingController();
    // final genderCtrl = useTextEditingController();
    final profileSetState = useState(false);
    profileSetState.value = true;
    nameCtrl.text = args!.name!;
    emailCtrl.text = args!.email!;
    phoneCtrl.text =  args!.phoneNumber!;

    final userGender = useState('');
    int _value = 1;
    return Scaffold(

        body:  ProviderListener<HomeViewModel>(
        provider: homeViewModelProvider,
        onChange: (_, state) async{
      final userId = await context.read(secureStorageServiceProvider).getString('id');
      if(state.isLoading){
        EasyLoading.show(maskType: EasyLoadingMaskType.clear);
      }else{
        if(state.isSuccess){
          EasyLoading.dismiss();

             Navigator.pushNamed(context, AppRoutes.myProfile);
              EasyLoading.showSuccess('Profile Updated');
        }
      }
    },
    child:Form(
          key: _formKey,
          child: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/images/editprofilebackground.png')
            //     )
            // ),
            child: ListView(

                children: [
                  // SizedBox(height: 50,),
                  Container(
                    child: Stack(
                      children: [
                        Container(height: 130,),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 100,
                          color: Color(0xffC0242D),
                          child: Column(
                            children: [
                              Row(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700
                                        )
                                    )]
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Text(
                              '${args!.name![0]}',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffC0242D)
                              ),
                            ),
                            // backgroundImage: AssetImage('assets/images/userprofimg.jpeg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InputField(
                      context: context,
                      text: 'name',
                      suffix: Icon(null),
                      validatorText: 'name',
                      controller: nameCtrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InputField(
                      context: context,
                      text: 'email',
                      suffix: Icon(null),
                      validatorText: 'email',
                      controller: emailCtrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InputField(
                      context: context,
                      text: 'phone',
                      suffix: Icon(null),
                      validatorText: 'phone',
                      controller: phoneCtrl,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: InputField(
                  //     context: context,
                  //     text: 'gender',
                  //     suffix: Icon(null),
                  //     validatorText: 'gender',
                  //     controller: genderCtrl,
                  //   ),
                  // ),
                  SizedBox(height: 20,),

                  Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async{
                        final userId = await context.read(secureStorageServiceProvider).getString('id');
                        if(_formKey.currentState!.validate()){
                          final nameTxt = nameCtrl.text.trim();
                          final emailTxt = emailCtrl.text.trim();
                          final phoneTxt = phoneCtrl.text.trim();
                          final genderTxt = userGender.value.trim();
                          context.read(homeViewModelProvider).editProfile(
                              UpdateProfile(
                                  id: userId,
                                  name: nameTxt,
                                  email: emailTxt,
                                  phone: phoneTxt
                              )
                          )
                          .then((value) => context.read(homeViewModelProvider).customerProfileInfo(CustomerId(customerID: int.parse('$userId'))));
                          // .then((value) =>  context.read(homeViewModelProvider).customerProfileInfo(
                          //     CustomerId(
                          //         customerID: int.parse('$userId')
                          //     )
                          // )).then((value) => Navigator.pushNamed(context, AppRoutes.myProfile,))
                          // .then((value) => EasyLoading.showSuccess('Profile updated successfully!'))
                          // ;
                          // print(userGender);
                          //
                        }},
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffC0242D),
                      ),
                    ),
                  ),
                  // Abc()
                ]
            ),
          ),
        ),
      ));
  }
}

class InputField extends StatelessWidget {
  final BuildContext context;
  final String text;
  final String validatorText;
  final Icon suffix;
  final TextEditingController controller;
  // final String controller;
  const InputField(
      {required this.context,
        required this.text,
        required this.suffix,
        required this.validatorText,
        required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: (String? val) {
          if (val == null || val.isEmpty) {
            return '$validatorText can\'t be blank!';
          }

          return null;
        },
        // controller: ${controller},
        decoration: InputDecoration(
            labelText: '$text',
            labelStyle: TextStyle(
              fontSize: 15,
            ),
            suffixIcon: suffix,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
