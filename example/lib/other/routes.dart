import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:explorator/explorator.dart';
import 'package:explorator_example/other/variables_screen.dart';

import 'other_screen.dart';

@Service(tags: [#routeProvider])
class OtherRouteProvider implements RouteProvider {
  @override
  List<RegisteredRoute> get routes => [
        RegisteredRoute(
          path: '/other',
          builder: (provider) => (ctx) => provider.resolve<OtherScreen>(),
        ),
        RegisteredRoute(
          path: '/variables/{type}',
          builder: (provider) => (ctx) => provider.resolve<VariablesScreen>(),
        ),
      ];
}
