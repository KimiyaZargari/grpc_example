///
//  Generated code. Do not modify.
//  source: route_guide.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'route_models.pb.dart' as $0;
export 'route_guide.pb.dart';

class RouteGuideClient extends $grpc.Client {
  static final _$getFeature = $grpc.ClientMethod<$0.Point, $0.Feature>(
      '/route.api.RouteGuide/GetFeature',
      ($0.Point value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Feature.fromBuffer(value));

  RouteGuideClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Feature> getFeature($0.Point request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFeature, request, options: options);
  }
}

abstract class RouteGuideServiceBase extends $grpc.Service {
  $core.String get $name => 'route.api.RouteGuide';

  RouteGuideServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Point, $0.Feature>(
        'GetFeature',
        getFeature_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Point.fromBuffer(value),
        ($0.Feature value) => value.writeToBuffer()));
  }

  $async.Future<$0.Feature> getFeature_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Point> request) async {
    return getFeature(call, await request);
  }

  $async.Future<$0.Feature> getFeature(
      $grpc.ServiceCall call, $0.Point request);
}
