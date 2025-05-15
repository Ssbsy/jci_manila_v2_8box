import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/components/profile_appbar.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_options.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProfileProvider>(context, listen: false).fetchProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        if (profileProvider.isLoading) {
          return Scaffold(
            backgroundColor: Palette.veryDarkBluishGray,
            appBar: ProfileAppbar(),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: Palette.veryDarkBluishGray,
          appBar: ProfileAppbar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  profileProvider.photo,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.accentBlue,
                      ),
                      child: Icon(Icons.person, color: Palette.white, size: 60),
                    );
                  },
                ),
              ),
              const Gap(5),
              WidgetText(
                title:
                    profileProvider.firstName.isEmpty
                        ? 'Padiernos, Jan Adrian D.'
                        : profileProvider.firstName,
                color: Palette.white,
                isBold: true,
                size: 16,
              ),
              const Gap(5),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15, child: Images.whiteBadge),
                  WidgetText(title: 'Gold Member', color: Palette.white),
                ],
              ),
              const Gap(30),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        QrImageView(
                          data:
                              profileProvider.qrData.isNotEmpty
                                  ? profileProvider.qrData
                                  : '1234567890',
                          version: QrVersions.auto,
                          size: 150.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Palette.neutralLightGray,
                          ),
                          child: Row(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _col(
                                'GMM Count',
                                profileProvider.freeGmmCount.toString(),
                              ),
                              _col(
                                'Member Points',
                                profileProvider.memberPoints.toString(),
                              ),
                              _col(
                                'No. of Projects',
                                profileProvider.projectsCount.toString(),
                              ),
                            ],
                          ),
                        ),
                        const Gap(15),
                        ProfileOptions(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column _col(String title, String subTitle, {bool isCentered = true}) {
    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true),
        WidgetText(title: subTitle),
      ],
    );
  }
}
