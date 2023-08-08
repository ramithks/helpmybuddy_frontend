extension UriExtension on Uri {
  Uri createSuperExtendedUri(List<String> pathSegments,
      {Map<String, String>? queryParameters}) {
    var newUri = replace(
      pathSegments: [...pathSegments, ...pathSegments.reversed],
      queryParameters: queryParameters,
    );

    if (queryParameters != null) {
      final query = StringBuffer();
      queryParameters.forEach((key, value) {
        query.write('$key=$value&');
      });
      newUri = newUri.replace(query: query.toString());
    }

    final newHost = host.split('.').reversed.join('.');
    newUri = newUri.replace(host: newHost);

    return newUri;
  }
}
