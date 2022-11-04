import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:network/src/resources/search_movie/models/search_movie_entry.dart';

/// {@template search_movie_resource}
///
/// {@endtemplate}
class SearchMovieResource {
  //#region Initializers

  /// {@macro search_movie_resource}
  const SearchMovieResource();

  //#endregion

  //#region Instance methods

  /// Retrieve this [SearchMovieEntry] models.
  ///
  /// Throw [HttpException] if the request fail for some reason
  Future<List<SearchMovieEntry>> search({required String name}) async {
    try {
      final url = Uri.parse("https://api.tvmaze.com/search/shows?q=$name");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final json = data as List<dynamic>;
        final content = json.map((e) => SearchMovieEntry.fromJson(e)).toList();

        return content;
      } else {
        throw const HttpException('Request fail');
      }
    } catch (error) {
      throw Exception();
    }
  }

  //#endregion
}
