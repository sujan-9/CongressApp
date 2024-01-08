import 'package:congressapp/app/config/routes/path_root.dart';
import 'package:congressapp/app/config/routes/router.dart';
import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/presentation/more/pages/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: AppStrings.titleSetting,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: Column(
            children: [
              CustomContainer(
                  text: AppStrings.profile,
                  onTap: () {
                    // context.push(Paths.profilePageScreenRoute.path);
                    AppRouter.router
                        .pushNamed(Paths.profilePageScreenRoute.routeName);
                  },
                  icon: Icons.person_2_outlined),
              CustomContainer(
                  onTap: () {
                    AppRouter.router
                        .pushNamed(Paths.galleryPageScreenRoute.routeName);
                  },
                  text: AppStrings.gallery,
                  icon: Icons.photo_album_rounded),
              CustomContainer(
                  onTap: () {
                    AppRouter.router
                        .pushNamed(Paths.clenderPageScreenRoute.routeName);
                  },
                  text: AppStrings.calender,
                  icon: Icons.calendar_month_rounded),
              CustomContainer(
                  onTap: () {},
                  text: AppStrings.meetLeader,
                  icon: Icons.meeting_room_rounded),
              CustomContainer(
                  onTap: () {
                    AppRouter.router.pushNamed(
                        Paths.reportproblemPageScreenRoute.routeName);
                  },
                  text: AppStrings.reportProblem,
                  icon: Icons.report_gmailerrorred_rounded),
              CustomContainer(
                  onTap: () {
                    AppRouter.router
                        .pushNamed(Paths.settingPageScreenRoute.routeName);
                  },
                  text: AppStrings.setting,
                  icon: Icons.settings_backup_restore_rounded),
              CustomContainer(
                  onTap: () {
                    AppRouter.router
                        .pushNamed(Paths.addPolicyPageScreenRoute.routeName);
                  },
                  text: 'Add Policy',
                  icon: Icons.policy_rounded),
              CustomContainer(
                  onTap: () {
                    AppRouter.router
                        .pushNamed(Paths.viewIDPageScreenRoute.routeName);
                  },
                  text: 'View My ID',
                  icon: Icons.person_2_rounded),
            ],
          ),
        ));
  }
}
