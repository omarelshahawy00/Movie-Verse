// import 'package:flutter/material.dart';
// import 'package:movie_app/core/constants/font_family.dart';
// import 'package:movie_app/core/helpers/spaceing.dart';
// import 'package:movie_app/core/helpers/styles.dart';
// import 'package:movie_app/core/widgets/rating_item.dart';
// import 'package:movie_app/features/home/ui/widgets/main_movie_item.dart';

// class MovieCardItem extends StatelessWidget {
//   const MovieCardItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Row(
//         children: [
//           const SizedBox(
//             height: 120,
//             child: AspectRatio(
//               aspectRatio: 2 / 3,
//               child: MainMovieItem(),
//             ),
//           ),
//           horizontalSpace(30),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * .5,
//                   child: Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     'it is a movie name',
//                     style: Styles.textStyle20
//                         .copyWith(fontFamily: kFontGTSectraFineRegular),
//                   ),
//                 ),
//                 const Text(
//                   'its title',
//                   style: Styles.textStyle14,
//                 ),
//                 verticalSpace(20),
//                 Row(
//                   children: [
//                     Text(
//                       'Free',
//                       style: Styles.textStyle20
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                     const Spacer(
//                       flex: 1,
//                     ),
//                     const RatingItem(),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
