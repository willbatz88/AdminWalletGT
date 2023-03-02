import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Servicios Wallet Group Code

class ServiciosWalletGroup {
  static String baseUrl = 'https://farmapagogt.azurewebsites.net/api';
  static Map<String, String> headers = {};
  static MenuCall menuCall = MenuCall();
}

class MenuCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Menu',
      apiUrl: '${ServiciosWalletGroup.baseUrl}/walletGT/Menus',
      callType: ApiCallType.GET,
      headers: {
        ...ServiciosWalletGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic listaMenu(dynamic response) => getJsonField(
        response,
        r'''$[:].nombre''',
        true,
      );
}

/// End Servicios Wallet Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
