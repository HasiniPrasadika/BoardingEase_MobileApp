// import 'package:flutter/material.dart';

// import '../../../../../constants/colors.dart';
// import '../../../models/categories_model.dart';

// class DashboardCategories extends StatelessWidget {
//   const DashboardCategories({
//     super.key,
//     required this.textTheme,
//   });

//   final TextTheme textTheme;

//   @override
//   Widget build(BuildContext context) {
//     final list = BoardingHouseModel(houseName: houseName, location: location, phoneNo: phoneNo).list;
//     return SizedBox(
//       height: 45,
//       child: ListView.builder(
//         itemCount: list.length,
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) => GestureDetector(
//           onTap: list[index].onPress,
//           child: SizedBox(
//             width: 170,
//             height: 45,
//             child: Row(
//               children: [
//                 Container(
//                   width: 45,
//                   height: 45,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: tDarkColor),
//                   child: Center(
//                     child: Text(list[index].title,
//                         style:
//                             textTheme.titleLarge?.apply(color: Colors.white)),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(list[index].heading,
//                           style: textTheme.titleMedium,
//                           overflow: TextOverflow.ellipsis),
//                       Text(list[index].subHeading,
//                           style: textTheme.bodySmall,
//                           overflow: TextOverflow.ellipsis)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
