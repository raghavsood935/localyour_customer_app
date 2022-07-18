import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loader {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}

showSnackBar(BuildContext context, String msg){
  final snackBar = SnackBar(
    content: Text(msg),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Dialogs {
  static Future<void> showDeleteConfirmDialog(
      BuildContext context, GlobalKey key, void Function() onPressed) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: Color(0XFFFC2323).withOpacity(0.1), // button color
                                        child: InkWell(
                                          splashColor: Colors.grey, // inkwell color
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.delete_outline_outlined, color: Colors.red,),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6,),
                                    Expanded(
                                      child: Text("Do you want to remove the wish?", style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0XFF121212)
                                      ),),
                                    ),
                                    SizedBox(width: 8,),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close_rounded, color: Colors.grey,)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12,),
                                ElevatedButton(
                                  onPressed: onPressed,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text('delete', style: TextStyle(color: const Color(0XFFFC2323), fontSize: 18),),
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                        side: BorderSide(width: 1.0, color: const Color(0XFFFC2323),)
                                    ),
                                    primary: const Color(0XFFFFFFFF),
                                  ),
                                ),
                                SizedBox(height: 12,),
                              ],
                            ),
                          ),
                        )
                    )
                  ]));
        });
  }
}

final searchIcon = Column(
  crossAxisAlignment:
  CrossAxisAlignment.center,
  mainAxisAlignment:
  MainAxisAlignment.center,
  children: [
    // Text(
    //   "\u{0023}",
    //   style: TextStyle(
    //     fontSize: 22,
    //     fontWeight: FontWeight.w300,
    //   ),
    // ),
    Icon(Icons.search, color: Colors.grey,)
  ],
);

Widget textField({
  required BuildContext context,
  String labelText = '',
  TextEditingController? controller,
  String? hintText,
  String? Function(String?)? validator,
  void Function(bool)? onFocusChangeFn,
  TextInputType keyboardType = TextInputType.text,
  int minLines = 1,
  int maxLines = 1,
  Widget? prefixIcon,
  Widget? suffixIcon,
  FocusNode? focusNode,
  inputDecoration = true,
  bool autoFocus = false,
  List<TextInputFormatter>? inputFormatters,
  double letterSpacing = 1,
  double borderRadius = 8,
  TextStyle? errorStyle,
}) { // new
  return Focus(
    onFocusChange: onFocusChangeFn,
    child: Container(
      child: Column(
        children: [
          labelText.isNotEmpty ? InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              isDense: true,
              labelStyle: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontSize: 18, color: Color(0XFFa3a3a3), fontWeight: FontWeight.w600),
              border: InputBorder.none,
            ),
            textAlign: TextAlign.left,
          ) : Padding(padding: EdgeInsets.zero),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            minLines: minLines,
            maxLines: maxLines,
            inputFormatters: inputFormatters,
            style: TextStyle(color: Color(0XFF747474), fontWeight: FontWeight.w700, letterSpacing: letterSpacing),
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                  color: Color(0XFF747474).withOpacity(0.45),
                  fontSize: 16.0),
              filled: true,
              // fillColor: Color(0XFFF6F8FC),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                BorderSide(color: Color(0xFFdcdcdc), width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                BorderSide(color: Color(0xFFFC2323), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                BorderSide(color: Color(0xFFdcdcdc), width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                BorderSide(color: Color(0xFFFC2323), width: 1),
              ),
              errorStyle: errorStyle
            ),
            validator: validator,
            focusNode: focusNode,
            autofocus: autoFocus,
          )
        ],
      ),
    ),
  );
}
