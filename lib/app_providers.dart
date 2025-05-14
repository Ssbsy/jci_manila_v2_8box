import 'package:jci_manila_v2/core/providers/auth/auth_provider.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/benefits_provider.dart';
import 'package:jci_manila_v2/core/providers/games_provider.dart';
import 'package:jci_manila_v2/core/providers/events_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/create_comment_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/create_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/get_all_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/like_comment_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/reaction_provider.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/add_project.dart';
import 'package:jci_manila_v2/core/providers/project_provider/committee_member_provider.dart';
import 'package:jci_manila_v2/core/providers/project_provider/project_information_provider.dart';
import 'package:jci_manila_v2/core/providers/update_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => UpdateProfileProvider()),
    ChangeNotifierProvider(create: (_) => GamesProvider()),
    ChangeNotifierProvider(create: (_) => EventsProvider()),
    ChangeNotifierProvider(create: (_) => GetAllPostsProvider()),
    ChangeNotifierProvider(create: (_) => CreatePostsProvider()),
    ChangeNotifierProvider(create: (_) => CreateCommentProvider()),
    ChangeNotifierProvider(create: (_) => ReactionProvider()),
    ChangeNotifierProvider(create: (_) => LikeCommentProvider()),

    //project
    ChangeNotifierProvider(create: (_) => AddProjectProvider()),
    ChangeNotifierProvider(create: (_) => ProjectInformationProvider()),
    ChangeNotifierProvider(create: (_) => CommitteeMemberProvider()),

    //benefits
    ChangeNotifierProvider(create: (_) => BenefitsProvider()),
  ];
}
