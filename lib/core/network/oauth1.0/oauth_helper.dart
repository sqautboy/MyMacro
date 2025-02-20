import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

// OAuth 1.0 관련 signature 및 params 관리 클래스
class OAuthHelper {
  final String consumerKey;
  final String consumerSecret;

  OAuthHelper(this.consumerKey, this.consumerSecret);

  // OAuth 기본 파라미터 생성
  Map<String, String> getOAuthParams() {
    return {
      'oauth_consumer_key': consumerKey,
      'oauth_signature_method': 'HMAC-SHA1',
      'oauth_timestamp': (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
      'oauth_nonce': Random().nextInt(1000000).toString(),
      'oauth_version': '1.0',
    };
  }

  // OAuth 1.0 Signature 생성
  String generateSignature(String httpMethod, String baseUrl, Map<String, String> params, {String? tokenSecret}) {
    final sortedParams = Map.fromEntries(params.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
    final parameterString = sortedParams.entries.map((e) => '${e.key}=${e.value}').join('&');
    final signatureBaseString = '$httpMethod&${Uri.encodeComponent(baseUrl)}&${Uri.encodeComponent(parameterString)}';
    final signingKey = '$consumerSecret&${tokenSecret ?? ''}';

    final hmacSha1 = Hmac(sha1, utf8.encode(signingKey));
    final signature = hmacSha1.convert(utf8.encode(signatureBaseString));
    return base64Encode(signature.bytes);
  }
}
