import 'package:jci_manila_v2/core/providers/auth_provider.dart';
import 'package:jci_manila_v2/core/providers/games_provider.dart';
import 'package:jci_manila_v2/core/providers/events_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/create_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/get_all_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
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
  ];
}
