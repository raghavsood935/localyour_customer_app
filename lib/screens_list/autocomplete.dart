// import 'package:app/network_files/view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
//
// import '../providers/analysis_route_provider.dart';
//
// class AutoCompleteTextfieldTwo extends StatefulWidget {
//   @override
//   _AutoCompleteTextfieldTwoState createState() =>
//       _AutoCompleteTextfieldTwoState();
// }
//
// class _AutoCompleteTextfieldTwoState extends State<AutoCompleteTextfieldTwo> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField(
//       hideOnEmpty: true,
//       textFieldConfiguration: TextFieldConfiguration(
//         style: TextStyle(
//           color: Colors.white,
//         ),
//         autofocus: false,
//         controller: this._controller,
//         keyboardType: TextInputType.text,
//         enabled: true,
//         focusNode: FocusNode(),
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(
//               width: 2,
//               color: Colors.blue,
//             ),
//           ),
//           hintText: 'Type in company name or ticker symbol',
//           hintStyle: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ),
//       getImmediateSuggestions: true,
//       hideOnError: true,
//       suggestionsCallback: (pattern) async {
//         return await context.read();
//       },
//       itemBuilder: (context, itemData) {
//         return ListTile(
//           title: Text(itemData['name'].toString()),
//           subtitle: Text(itemData['symbol'].toString()),
//         );
//       },
//       onSuggestionSelected: (suggestion) {
//         print('selected');
//
//         FocusNode().unfocus();
//         this._controller.text = suggestion['name'].toString();
//         _controller.clear();
//       },
//     );
//   }
// }