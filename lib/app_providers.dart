import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/providers/auth/auth_provider.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/add_user_benefits_provider.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/benefits_provider.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/create_benefits_provider.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/get_my_benefits_provider.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/redeem_benefits_provider.dart';
import 'package:jci_manila_v2/core/providers/games/games_provider.dart';
import 'package:jci_manila_v2/core/providers/events/events_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/create_comment_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/create_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/get_all_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/reaction_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/get_profile_annual_dues_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/get_profile_gmm_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/get_profile_projects_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/get_settings_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/patch_settings_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/add_project_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/committee_member_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/get_my_projects_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/project_information_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/update_project_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/update_profile_provider.dart';
import 'package:jci_manila_v2/core/services/benefits/get_my_benefits_services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    //Auth
    ChangeNotifierProvider(create: (_) => AuthProvider()),

    //Profile
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => UpdateProfileProvider()),
    ChangeNotifierProvider(create: (_) => GetProfileGmmProvider()),
    ChangeNotifierProvider(create: (_) => GetProfileAnnualDuesProvider()),
    ChangeNotifierProvider(create: (_) => GetProfileProjectsProvider()),
    ChangeNotifierProvider(create: (_) => GetSettingsProvider()),
    ChangeNotifierProvider(create: (_) => PatchSettingsProvider()),

    //Games
    ChangeNotifierProvider(create: (_) => GamesProvider()),

    //Events
    ChangeNotifierProvider(create: (_) => EventsProvider()),

    //Posts
    ChangeNotifierProvider(create: (_) => GetAllPostsProvider()),
    ChangeNotifierProvider(create: (_) => CreatePostsProvider()),
    ChangeNotifierProvider(create: (_) => CreateCommentProvider()),
    ChangeNotifierProvider(create: (_) => ReactionProvider()),

    //project
    ChangeNotifierProvider(create: (_) => GetMyProjectsProvider()),
    ChangeNotifierProvider(create: (_) => AddProjectProvider()),
    ChangeNotifierProvider(create: (_) => ProjectInformationProvider()),
    ChangeNotifierProvider(create: (_) => CommitteeMemberProvider()),
    ChangeNotifierProvider(create: (_) => UpdateProjectProvider()),

    //benefits
    ChangeNotifierProvider(create: (_) => BenefitsProvider()),
    ChangeNotifierProvider(
      create:
          (_) =>
              GetMyBenefitsProvider(GetMyBenefitsServices(BaseApiServices())),
    ),
    ChangeNotifierProvider(create: (_) => RedeemBenefitsProvider()),
    ChangeNotifierProvider(create: (_) => AddUserBenefitsProvider()),
    ChangeNotifierProvider(create: (_) => CreateBenefitsProvider()),
  ];
}
