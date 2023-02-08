import 'package:grpc_example/src/common.dart';
import 'package:grpc_example/src/generated/route_guide.pbgrpc.dart';
import 'package:grpc_example/src/generated/route_models.pb.dart';
import 'package:grpc/grpc.dart' as grpc;

class RouteGuideService extends RouteGuideServiceBase {
  /// GetFeature handler. Returns a feature for the given location.
  /// The [context] object provides access to client metadata, cancellation, etc.
  @override
  Future<Feature> getFeature(grpc.ServiceCall call, Point request) async {
    return featuresDb.firstWhere((f) => f.location == request,
        orElse: () => Feature()..location = request);
  }
}

  Future<void> main(List<String> args) async {
    final server = grpc.Server([RouteGuideService()]);
    await server.serve(port: 8080);
    print('Server listening...');
  }
