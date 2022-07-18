import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/router.dart';
import 'package:app/screens_list/manage_address_view.dart';
import 'package:app/secure_storage.dart';
import 'package:app/utils/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _formkey = GlobalKey<FormState>();

class AddNewAddressView extends HookWidget {
  final Addresses? address;
   AddNewAddressView({Key? key, this.address}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final contactNumberCtrl = useTextEditingController();
    final cityCtrl = useTextEditingController();
    final sateCtrl = useTextEditingController();
    final address1Ctrl = useTextEditingController();
    final address2Ctrl = useTextEditingController();
    // final countryCtrl = useTextEditingController();
    final zipCodeCtrl = useTextEditingController();
    // final addressTypeCtrl = useTextEditingController();
    // final isLoading = useProvider(homeViewModelProvider).isLoading;
    // final AddAddress? addAddres;
    final value1 = useState('Home');
    // final context =useContext();
    final addressSetState = useState(false);
    if(address != null && !addressSetState.value){
      addressSetState.value = true;

      nameCtrl.text = address!.customerName!;
      emailCtrl.text = address!.customerEmail!;
      contactNumberCtrl.text = address!.customerPhoneNumber!;
      address1Ctrl.text = address!.customerAddressLine1!;
      address2Ctrl.text = address!.customerAddressLine2!;
      cityCtrl.text = address!.city!;
      sateCtrl.text = address!.state!;
      // countryCtrl.text = address!.country!;
      zipCodeCtrl.text = address!.pincode!;}
      // addressTypeCtrl.text = address!.addressType!;}
    return Scaffold(
      backgroundColor: Color(0xfff7d4d4),
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            // size: 20,
            color: Colors.white,
          ),
        ),
        // title: Text(
        //   'Add New Address',
        //   style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white),
        // ),
      ),
      body:  Form(
        key: _formkey,
        child: Stack(
          children: [
            ListView(
            // padding: EdgeInsets.symmetric( horizontal: 10),
            children: [
              Container(
                height: 150,
                color: Color(0xffC0242D),
                // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/addaddressimg.png',),fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        'Add New Address',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                        color: Color(0xfff7d4d4)
                      ),
                    )
                  ],
                ),
              ),
             Padding(padding: EdgeInsets.symmetric(horizontal: 15),
             child: Column(
               children: [
                 Padding(
                   padding: EdgeInsets.all(10),
                   child: Column(
                     children: [
                       textField(
                         controller: nameCtrl,
                         context: context,
                         validator: (String? val){

                           if(val == null || val.isEmpty){
                             return 'This Field can\'t be blank!';
                           }

                           return null;
                         },
                         hintText: 'Full Name',
                       ),
                       SizedBox(height: 5,),
                       textField(
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(10),
                         ],
                         context: context,
                         validator: (String? val){

                           if(val == null || val.isEmpty){
                             return 'This Field can\'t be blank!';
                           }

                           return null;
                         },
                         controller: contactNumberCtrl,
                         keyboardType: TextInputType.phone,
                         prefixIcon: Icon(
                           Icons.phone,
                           size: 15,
                           color: Colors.black,
                         ),
                         hintText: 'Phone',
                       ),
                       SizedBox(height: 5,),
                       textField(
                         context: context,
                         validator: (String? val){

                           if(val == null || val.isEmpty){
                             return 'This Field can\'t be blank!';
                           }

                           return null;
                         },
                         controller: emailCtrl,
                         prefixIcon: Icon(
                           Icons.mail,
                           size: 15,
                           color: Colors.black,
                         ),
                         hintText: 'Email',
                       ),
                       SizedBox(height: 5,),
                       textField(
                         context: context,
                         validator: (String? val){

                           if(val == null || val.isEmpty){
                             return 'This Field can\'t be blank!';
                           }

                           return null;
                         },
                         controller: address1Ctrl,
                         prefixIcon: Icon(
                           Icons.home,
                           size: 15,
                           color: Colors.black,
                         ),
                         hintText: 'Address line 1',
                       ),
                       SizedBox(height: 5,),
                       textField(
                         context: context,
                         validator: (String? val){

                           if(val == null || val.isEmpty){
                             return 'This Field can\'t be blank!';
                           }

                           return null;
                         },
                         controller: address2Ctrl,
                         prefixIcon: Icon(
                           Icons.home,
                           size: 15,
                           color: Colors.black,
                         ),
                         hintText: 'Address Line 2',
                       ),
                       SizedBox(height: 5,),
                       Container(
                         height: 70,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Expanded(
                               child: Container(
                                 // width: 140,
                                 child: textField(
                                   context: context,
                                   validator: (String? val){

                                     if(val == null || val.isEmpty){
                                       return 'This Field can\'t be blank!';
                                     }

                                     return null;
                                   },
                                   controller: cityCtrl,
                                   // prefixIcon: Icon(
                                   //   Icons.arrow_drop_down,
                                   //   size: 15,
                                   //   color: Colors.black,
                                   // ),
                                   hintText: 'City',
                                 ),
                               ),
                             ),
                             SizedBox(width: 5,),
                             Expanded(
                               child: Container(
                                 // width: 140,
                                 child: textField(
                                   context: context,
                                   controller: sateCtrl,
                                   validator: (String? val){

                                     if(val == null || val.isEmpty){
                                       return 'This Field can\'t be blank!';
                                     }

                                     return null;
                                   },
                                   // prefixIcon: Icon(
                                   //   Icons.arrow_drop_down,
                                   //   size: 15,
                                   //   color: Colors.black,
                                   // ),
                                   hintText: 'State',
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(height: 5,),
                       Row(
                         children: [
                           Container(
                             width: 180,
                             child: textField(
                               inputFormatters: [
                                 LengthLimitingTextInputFormatter(6),
                               ],
                               keyboardType: TextInputType.phone,
                               context: context,
                               validator: (String? val){

                                 if(val == null || val.isEmpty){
                                   return 'This Field can\'t be blank!';
                                 }

                                 return null;
                               },
                               controller: zipCodeCtrl,
                               hintText: 'pin code',
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   height: 70,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text(
                             'Address Type',
                             textAlign: TextAlign.left,
                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: GestureDetector(
                               onTap: (){
                                 value1.value = 'Home';
                                 print(value1.value);
                               },
                               child: Container(
                                 height: 20,
                                 width: 20,
                                 decoration: BoxDecoration(
                                     border: Border.all(color: Colors.black),
                                     color: value1.value == 'Home' ? Colors.green : Colors.white
                                 ),
                                 child: value1.value == 'Home' ? Icon(Icons.done,color: Colors.white,size: 18,) : null,
                               ),
                             ),
                           ),
                           Text(
                             'Home',
                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: GestureDetector(
                               onTap: (){
                                 value1.value = 'Work';
                                 print(value1.value);
                               },
                               child: Container(
                                 height: 20,
                                 width: 20,
                                 decoration: BoxDecoration(
                                     border: Border.all(color: Colors.black),
                                     color: value1.value == 'Work' ? Colors.green : Colors.white
                                 ),
                                 child: value1.value == 'Work' ? Icon(Icons.done,color: Colors.white,size: 18,) : null,
                               ),
                             ),
                           ),
                           Text(
                             'Work',
                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                           ),
                         ],
                       ),

                     ],
                   ),
                 ),
                 SizedBox(
                   height: 40,
                 ),
               ],
             ),
             ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   height: 50,
              //   child: ElevatedButton(
              //
              //       // EasyLoading.showSuccess('Address added successfully');
              //       style: ElevatedButton.styleFrom(
              //           primary: Color(0xffC0242D),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(8))),
              //       child: Text(
              //         'Save your address',
              //         style: TextStyle(fontSize: 18),
              //       )),
              // ),

              // SizedBox(height: 10,)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () async{
                    final customerId = await context.read(secureStorageServiceProvider).getString('id');
                    // print(customerId);
                    if(_formkey.currentState!.validate()){
                      final nameTxt = nameCtrl.text.trim();
                      final emailTxt = emailCtrl.text.trim();
                      final mobileTxt = contactNumberCtrl.text.trim();
                      final address1Txt = address1Ctrl.text.trim();
                      final address2Txt = address2Ctrl.text.trim();
                      final cityTxt = cityCtrl.text.trim();
                      final stateTxt = sateCtrl.text.trim();
                      // final addresstypeTxt = addressTypeCtrl.text.trim();
                      final zipTxt = zipCodeCtrl.text.trim();

                      // final countryTxt = countryCtrl.text.trim();

                      // if(addAddres == null){
                      if(address!=null){
                        context.read(homeViewModelProvider).editAddress(EditAddress(
                          addressId: address!.addressId,
                          customerName: nameTxt.trim(),
                          customerPhoneNumber: mobileTxt.trim(),
                          customerEmail: emailTxt.trim(),
                          customerAddressLine1: address1Txt.trim(),
                          customerAddressLine2: address2Txt.trim(),
                          city: cityTxt.trim(),
                          state: stateTxt.trim(),
                          addressType: value1.value.trim(),
                          pincode: zipTxt.trim(),
                        )).then((value) => context.read(homeViewModelProvider).getCustomerAddresses(customerId)).then((value) =>  EasyLoading.showSuccess('Address Updated Successfully')).then((value) => Navigator.pushNamed(context, AppRoutes.manageAddress,arguments: ManageAddressViewArgs(customerId: int.parse('$customerId'))));


                      }else{
                        context.read(homeViewModelProvider).addAddress(AddAddress(
                          customerId: int.parse('$customerId'),
                          customerName: nameTxt.trim(),
                          customerPhoneNumber: mobileTxt.trim(),
                          customerEmail: emailTxt.trim(),
                          customerAddressLine1: address1Txt.trim(),
                          customerAddressLine2: address2Txt.trim(),
                          city: cityTxt.trim(),
                          state: stateTxt.trim(),
                          addressType: value1.value.trim(),
                          pincode: zipTxt.trim(),
                        )).then((value) => EasyLoading.showSuccess('Address Added Successfully')).then((value) => context.read(homeViewModelProvider).getCustomerAddresses(customerId)).then((value) => Navigator.pushNamed(context, AppRoutes.manageAddress));
                      }
                      // } else {
                      // context.read(homeViewModelProvider).addAddress(AddAddress(
                      //   customerId: 1,
                      //   customerName: nameTxt.trim(),
                      //   customerPhoneNumber: mobileTxt.trim(),
                      //   customerEmail: emailTxt.trim(),
                      //   customerAddressLine1: address1Txt.trim(),
                      //   customerAddressLine2: address2Txt.trim(),
                      //   city: cityTxt.trim(),
                      //   state: stateTxt.trim(),
                      //   addressType: value1.value.trim(),
                      //   pincode: zipTxt.trim(),
                      // ));
                    }
                  },
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffC0242D),
                        // borderRadius: BorderRadius.circular(5)
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )),
            ],
          )
          ]
        ),
      ),
    );
  }
}
