// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class CreditCardWidget extends StatelessWidget {
//   final String title;
//   final String subtitle;

//   final int creditAmount;
//   final int maxCredit;
//   final double interestRate;
//   final String footer;

//   const CreditCardWidget({
//     super.key,
//     required this.creditAmount,
//     required this.maxCredit,
//     required this.interestRate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double progress = creditAmount / maxCredit;

//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Title
//           const Text(
//             "nikunj, how much do you need?",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 8),
//           // Subtitle
//           Text(
//             "Move the dial and set any amount you need up to ₹${maxCredit.toStringAsFixed(0)}",
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           // Circular Slider
//           CircularPercentIndicator(
//             radius: 100.0,
//             lineWidth: 12.0,
//             percent: progress,
//             center: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "credit amount",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   "₹${creditAmount.toStringAsFixed(0)}",
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   "@${interestRate.toStringAsFixed(2)}% monthly",
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             progressColor: Colors.orange,
//             backgroundColor: Colors.orange.withOpacity(0.3),
//             circularStrokeCap: CircularStrokeCap.round,
//           ),
//           const SizedBox(height: 16),

//           Text(
//             "stash is instant. money will be credited within seconds",
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
