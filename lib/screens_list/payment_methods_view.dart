import 'package:app/router.dart';
import 'package:app/utils/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethodsView extends StatefulWidget {
 

  @override
  _PaymentMethodsViewState createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
        leading: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
        centerTitle: true,
        title: Text('Payment Methods',style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      backgroundColor: Color(0xffDEDCE1),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage('assets/images/credit.jpg'),fit: BoxFit.fill)),
            // child: Image.asset('assets/images/credit.jpg',fit: BoxFit.fill,),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Icon(Icons.credit_card_rounded,size: 20,),
              SizedBox(width: 10,),
              Text('Edit Card Details',style: TextStyle(fontWeight: FontWeight.w600),)
            ],
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  textField(
                    context: context,
                    labelText: 'Card number',
                    // prefixIcon: Icon(Icons.home,size: 15,color: Colors.black,),
                    // prefixIcon: Icon(Icons),
                    hintText: '**** **** *412',
                    // suffixIcon: Icon(Icons.edit,size: 15,color: Colors.black,),
                  ),
                  textField(
                    context: context,
                    labelText: 'Card Holders Name',
                    // prefixIcon: Icon(Icons.home,size: 15,color: Colors.black,),
                    // prefixIcon: Icon(Icons),
                    hintText: 'Martin Luthor',
                    // suffixIcon: Icon(Icons.edit,size: 15,color: Colors.black,),
                  ),
                  Container(
                    height: 82,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          // margin: EdgeInsets.symmetric(horizontal: 4),
                          child:  textField(
                            context: context,
                            labelText: 'Expiry Date',
                            // prefixIcon: Icon(Icons.arrow_drop_down,size: 15,color: Colors.black,),
                            // prefixIcon: Icon(Icons),
                            hintText: 'DD/MM/YYYY',
                            keyboardType: TextInputType.phone
                            // suffixIcon: Icon(Icons.edit,size: 15,color: Colors.black,),
                          ),
                        ),
                        Container(
                          width: 100,
                          // margin: EdgeInsets.symmetric(horizontal: 4),
                          child:  textField(
                            context: context,
                            labelText: 'CVV',
                            // prefixIcon: Icon(Icons.arrow_drop_down,size: 15,color: Colors.black,),
                            // prefixIcon: Icon(Icons),
                            hintText: '***',
                              keyboardType: TextInputType.phone
                            // suffixIcon: Icon(Icons.edit,size: 15,color: Colors.black,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        height: 40,
                        width: 500,
                        // margin: EdgeInsets.symmetric(
                        //   horizontal: 10,
                        // ),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, AppRoutes.checkoutView);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffC0242D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child:  Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
            text: 'or, ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: 'Pay with',
                style: TextStyle(fontSize: 20)
              )
            ]
          )),
          SizedBox(height: 20,),
          Card(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.ad_units_rounded,size: 10,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('UPI',style: TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),
            ),
          ),

          Card(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.ad_units_rounded,size: 10,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Phone Pay',style: TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),
            ),
          ),

          Card(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.ad_units_rounded,size: 10,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Google Pay',style: TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.ad_units_rounded,size: 10,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Cash on Delivery',style: TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
