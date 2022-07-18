import 'package:flutter/material.dart';

class _Sizes {
  static const double avatarCircleRadius = 24;
}

class AvatarRow extends StatelessWidget {
  final String userImageUri;

  const AvatarRow({
    Key? key,
    required this.userImageUri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('AvatarRow_Row'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          key: Key('AvatarRow_Container'),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Container(
            key: Key('AvatarRow_ChildContainer'),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              key: Key('AvatarRow_CircleAvatar'),
              radius: _Sizes.avatarCircleRadius,
              backgroundImage: NetworkImage(userImageUri),
            ),
          ),
        ),
      ],
    );
  }
}
