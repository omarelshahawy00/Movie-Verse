import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/theming/styles.dart';

class RatingItem extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final int count;
  final double avg;
  const RatingItem({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.count,
    required this.avg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFF9D84E),
          size: 13,
        ),
        horizontalSpace(5),
        Text(
          '$avg',
          style: Styles.textStyle16,
        ),
        horizontalSpace(5),
        Text(
          '($count)',
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
