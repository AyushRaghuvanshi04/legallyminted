// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: Text("LegalAI", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),), backgroundColor: Colors.black,),
      
//     );
//   }
// }






// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final List<String> _messages = [];
//   final TextEditingController _textController = TextEditingController();

//   void _handleSendPressed() {
//     final text = _textController.text;
//     if (text.isNotEmpty) {
//       setState(() {
//         _messages.insert(0, text);
//         _textController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("LegalAI", style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.white),),
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_messages[index]),
//                 );
//               },
//             ),
//           ),
//           TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//               hintText: 'Type a message',
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.send),
//                 onPressed: _handleSendPressed,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// //