// import 'package:flutter/material.dart';
// import 'package:food_prediction_app/features/model/meal_rec.dart';

// class RecommendationCard extends StatelessWidget {
//   const RecommendationCard({super.key, required this.mealrecommendationModel});

//   final MealRecommedationModle mealrecommendationModel;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

//         elevation: 5,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (mealrecommendationModel.mptfd.toLowerCase() != "none")
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.food_bank_rounded,
//                           color: Color(0xFF00A875).withOpacity(0.9),
//                           size: 30,
//                         ),
//                         Text(
//                           'Most Preferred Food',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       mealrecommendationModel.mptfd,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey.withOpacity(0.5),
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ],
//                 ),

//               if (mealrecommendationModel.mps.toLowerCase() != "none")
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.food_bank_rounded,
//                           color: Color(0xFF00A875).withOpacity(0.9),
//                           size: 30,
//                         ),
//                         Text(
//                           'Most Preferred Suppliment',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       mealrecommendationModel.mps,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey.withOpacity(0.5),
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ],
//                 ),

//               if (mealrecommendationModel.mptm.toLowerCase() != "none")
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.food_bank_rounded,
//                           color: Color(0xFF00A875).withOpacity(0.9),
//                           size: 30,
//                         ),
//                         Text(
//                           'Most Preferred Meal',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       mealrecommendationModel.mptm,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey.withOpacity(0.5),
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ],
//                 ),

//               if (mealrecommendationModel.mpsw.toLowerCase() != "none")
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.food_bank_rounded,
//                           color: Color(0xFF00A875).withOpacity(0.9),
//                           size: 30,
//                         ),
//                         Text(
//                           'Most Preferred Food',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       mealrecommendationModel.mpsw,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey.withOpacity(0.5),
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               if (mealrecommendationModel.mpdk.toLowerCase() != "none")
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.food_bank_rounded,
//                           color: Color(0xFF00A875).withOpacity(0.9),
//                           size: 30,
//                         ),
//                         Text(
//                           'Most Preferred Drink',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       mealrecommendationModel.mpdk,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey.withOpacity(0.5),
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               if (mealrecommendationModel.mpft.toLowerCase() != "none")
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.food_bank_rounded,
//                           color: Color(0xFF00A875).withOpacity(0.9),
//                           size: 30,
//                         ),
//                         Text(
//                           'Most Preferred Fruit',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       mealrecommendationModel.mpft,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey.withOpacity(0.5),
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
