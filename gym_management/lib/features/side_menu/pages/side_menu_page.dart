import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/side_menu/widgets/drawer_list_tile_widget.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/widgets/user_avatar_letter_widget.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: StyleConstants.defaultPadding * 3,
                  ),
                  Expanded(
                      child: UserAvatarLetterWidget(username: "Alex Popescu")),
                  SizedBox(
                    height: StyleConstants.defaultPadding,
                  ),
                  Text(
                    "Alex Popescu",
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            DrawerListTileWidget(
              title: "Dashboard",
              icon: Icons.dashboard,
              route: RoutesEnum.dashboard,
            ),
            DrawerListTileWidget(
              title: "Subscriptions",
              icon: Icons.subscriptions,
              route: RoutesEnum.subscription,
            ),
            DrawerListTileWidget(
              title: "Users",
              icon: Icons.account_box,
              route: RoutesEnum.user,
            ),
          ],
        ),
      ),
    );
  }
}
