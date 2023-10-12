import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Color> thecolor = [
    Colors.green,
    Colors.amber,
    Colors.blueAccent,
    Colors.deepOrange
  ];
  List<Widget> mylist = [
    Container(
      width: 300,
      height: 300,
      color: Colors.green,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.amber,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.blueAccent,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.deepOrange,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('list view'),
        ),
        body: ListView.builder(
          itemCount: thecolor.length,
          itemBuilder: (context, index) {
            return Container(height: 300, width: 300, color: thecolor[index]);
          },
          // scrollDirection: Axis.horizontal,
          // children: mylist
        ),
      ),
    );
  }
}

//hasil p2
// class MyApp extends StatelessWidget {
//   // const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//         title: Text('stack'),
//       ),
//       body: Stack(
//         children: [
//         Container(
//           width: 200,
//           height: 200,
//           color: Colors.green,
//         ),
//          Container(
//           width: 150,
//           height: 150,
//           color: Colors.amber,
//         ),
//          Container(
//           width: 100,
//           height: 100,
//           color: Colors.blueAccent,
//         ),
//          Container(
//           width: 50,
//           height: 50,
//           color: Colors.deepOrange,
//         )
        // body: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.end,
        // children: [
        // Container(
        //   width: 50,
        //   height: 200,
        //   color: Colors.green,
        // ),
        //  Container(
        //   width: 50,
        //   height: 150,
        //   color: Colors.amber,
        // ),
        //  Container(
        //   width: 50,
        //   height: 100,
        //   color: Colors.blueAccent,
        // ),
        //  Container(
        //   width: 50,
        //   height: 50,
        //   color: Colors.deepOrange,
        // )
        // body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // children: [
        // Container(
        //   width: 200,
        //   height: 50,
        //   color: Colors.green,
        // ),
        //  Container(
        //   width: 150,
        //   height: 50,
        //   color: Colors.amber,
        // ),
        //  Container(
        //   width: 100,
        //   height: 50,
        //   color: Colors.blueAccent,
        // ),
        //  Container(
        //   width: 50,
        //   height: 50,
        //   color: Colors.deepOrange,
        // )
//       ]),
//       ),
//     );
//   }
// }


//hasil projek1
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(title: Text('My Apps')),
//       body: Center(
//         child: Text(
//           "Haloosdfjsdjkfhsdjkfjghfjdjdjdghdjhdjhdgjhgdjh
//            gdryetwaweaweawatyfyouhjbnvncvntwerhjkahdlajhfasfhi
//            awuehriwueiwesdfsdfsdfdfsgfdgfiwefwerwioerioweiowceioweiormweoiriwerrrcr",
//           maxLines: 3,
//           overflow: TextOverflow.ellipsis,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             backgroundColor: Colors.orange,
//             color: Colors.black87,
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 10,
//             // fontFamily
//             decorationStyle: TextDecorationStyle.wavy,
//             decoration: TextDecoration.lineThrough,
//             decorationColor: Colors.green,
//             decorationThickness: 2,
//           ),
//         ),
//       ),
//     ));
//   }
// }
