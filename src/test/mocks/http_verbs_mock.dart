import 'dart:convert';

import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'mocks.mocks.dart';

void mockGetList({
  required MockClient httpmockClient,
  required int statusCode,
  required List<Map<String, dynamic>> json,
}) {
  when(
    httpmockClient.get(
      any,
      headers: anyNamed('headers'),
    ),
  ).thenAnswer((_) async => Response(jsonEncode(json), statusCode));
}

void mockGetOne({
  required MockClient httpmockClient,
  required int statusCode,
  required dynamic result,
}) {
  when(
    httpmockClient.get(
      any,
      headers: anyNamed('headers'),
    ),
  ).thenAnswer((_) async => Response(jsonEncode(result), statusCode));
}

void mockPost({
  required MockClient httpmockClient,
  required int statusCode,
  required dynamic result,
}) {
  when(httpmockClient.post(
    any,
    headers: anyNamed('headers'),
  )).thenAnswer((_) async => Response(result, statusCode));
}
