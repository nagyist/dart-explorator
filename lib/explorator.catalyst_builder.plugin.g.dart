// ignore_for_file: prefer_relative_imports, public_member_api_docs, implementation_imports
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:catalyst_builder_contracts/catalyst_builder_contracts.dart'
    as _i1;
import 'package:explorator/src/route_matcher.dart' as _i4;
import 'package:explorator/src/route_resolver.dart' as _i3;
import 'package:explorator/src/routing.dart' as _i2;

class Explorator implements _i1.ServiceContainerPlugin {
  @override
  Map<Type, _i1.ServiceDescriptor> provideKnownServices(
    _i1.AbstractServiceContainer c,
  ) {
    return <Type, _i1.ServiceDescriptor>{
      _i2.Routing: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i2.Routing),
        () => _i2.Routing(
          navigatorKey: c.resolveOrGetParameter(_i2.Routing, 'navigatorKey'),
        ),
      ),
      _i3.RouteResolver: _i1.ServiceDescriptor(
        const _i1.Service(),
        () => _i3.RouteResolver(
          c.resolveOrGetParameter(_i3.RouteResolver, '_routeMatcher'),
          c.resolveOrGetParameter(_i3.RouteResolver, '_routeBuilder'),
          c.resolveOrGetParameter(_i3.RouteResolver, '_serviceContainer'),
        ),
      ),
      _i4.RouteMatcher: _i1.ServiceDescriptor(
        const _i1.Service(),
        () => _i4.RouteMatcher(c.resolveByTag(#routeProvider).cast()),
      ),
    };
  }

  @override
  Map<Type, Type> provideExposes() {
    return <Type, Type>{_i2.Routing: _i2.Routing};
  }

  @override
  List<Type> providePreloadedTypes() {
    return [];
  }

  @override
  Map<Symbol, List<Type>> provideServiceTags() {
    return <Symbol, List<Type>>{};
  }
}

extension ExploratorExtension on _i1.AbstractServiceContainer {
  void useExplorator() {
    applyPlugin(Explorator());
  }
}
