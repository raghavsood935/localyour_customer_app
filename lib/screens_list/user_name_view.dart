import 'package:flutter/material.dart';

class UserNameView extends StatelessWidget {
  const UserNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
        leading: IconButton(icon: Icon(Icons.arrow_back,size: 25,)
        ,
        onPressed: (){},),
        centerTitle: true,
        title: Text(
          'User Name',
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      backgroundColor: Color(0xffDEDCE1),
      body: ListView(
        children: [
          Container(height: 30,),
          Card(
            color: Color(0xffFFFFFF),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child:Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 21),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                       Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('khardah,Rahara,Paschimpara: ',
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.w300
                             ),),
                           Text('West Bengal',
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.w300
                             ),),
                           Text('Kolkata-700118',
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.w300
                             ),)
                         ],
                       )
                      ],
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.delete,
                  size: 28,
                  color: Color(0xff878787),), onPressed: (){},
                )
              ],
            ),
          ),
          ),
          Card(
            color: Color(0xffFFFFFF),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child:Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 21),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Weather Coat Anti Dirt Paint',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300
                                ),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('Subtotal: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  Text('Rs.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300
                                    ),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(icon: Icon(Icons.delete,
                    size: 28,
                    color: Color(0xff878787),), onPressed: (){},
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12,),
         Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15)
           ),
           height: 60,
           margin: EdgeInsets.symmetric(horizontal: 10,),
           child: Expanded(child:  ElevatedButton(onPressed: (){},
               style: ElevatedButton.styleFrom(
                 primary: Color(0xffC0242D),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8)
                   )
               ),
               child: Text('Proceed',style: TextStyle(fontSize: 18),textAlign: TextAlign.center,)),),
         )

        ],
      ),
    );
  }
}
