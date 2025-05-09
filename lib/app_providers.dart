import 'package:jci_manila_v2/core/providers/auth_provider.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
import 'package:jci_manila_v2/core/providers/update_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => UpdateProfileProvider()),
  ];
}
