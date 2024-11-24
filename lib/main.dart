import 'package:cred_assignment/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


//button 
// Stack(
            //   children: [
            //     Align(
            //       alignment: Alignment.bottomCenter,
            //       child: GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => StackPage(data: snapshot.data!),
            //             ),
            //           );
            //         },
            //         child: Container(
            //           height: 60,
            //           decoration: const BoxDecoration(
            //             color: AppColors.buttonColor,
            //             borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(20),
            //               topRight: Radius.circular(20),
            //             ),
            //           ),
            //           child: const Center(
            //             child: Text(
            //               'Credit Score',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // );