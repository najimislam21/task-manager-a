import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TmaAppbar extends StatelessWidget implements PreferredSize{
  const TmaAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.PColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://i.postimg.cc/1Xp4Gjm5/image.jpg'),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Md Najim Islam',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white
                ),
              ),Text('najimislameng@gmail.com',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}