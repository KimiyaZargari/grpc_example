import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:grpc_example/src/generated/route_guide.pbgrpc.dart';
import 'package:grpc_example/src/generated/route_models.pb.dart';
import 'common.dart';


void main(List<String> args) {
  final client = Client();
  client.createChannel();
}
class Client {
  late RouteGuideClient stub;

  Future<void> createChannel() async {
    final channel = ClientChannel('127.0.0.1',
        port: 8080,
        options:
        const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = RouteGuideClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    // Run all of the demos in order.
    try {
      await runGetFeature();
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  void printFeature(Feature feature) {
    final latitude = feature.location.latitude;
    final longitude = feature.location.longitude;
    final name = feature.name.isEmpty
        ? 'no feature'
        : 'feature called "${feature.name}"';
    print(
        'Found $name at ${latitude / coordFactor}, ${longitude / coordFactor}');
  }

  /// Run the getFeature demo. Calls getFeature with a point known to have a
  /// feature and a point known not to have a feature.
  Future<void> runGetFeature() async {
    final point1 = Point()
      ..latitude = 409146138
      ..longitude = -746188906;
    final point2 = Point()
      ..latitude = 0
      ..longitude = 0;

    printFeature(await stub.getFeature(point1));
    printFeature(await stub.getFeature(point2));
  }
}