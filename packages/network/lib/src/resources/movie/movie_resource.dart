// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:network/src/resources/movie/movie.dart';

/// {@template movie_resource}
///
/// {@endtemplate}
class MovieResource {
  //#region Initializers

  /// {@macro movie_resource}
  MovieResource();

  //#endregion

  //#region Instances methods

  Future<List<MovieEntry>> fetchMovies() async {
    try {
      final url = Uri.parse('https://api.tvmaze.com/shows');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final list = data as List<dynamic>;
        final content = list.map((e) => MovieEntry.fromJson(e)).toList();

        return content;
      } else {
        throw const HttpException('Request fail');
      }
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<EpisodeEntry>> fetchEpisodes({required int showId}) async {
    try {
      final url = Uri.parse('https://api.tvmaze.com/shows/$showId/episodes');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final list = data as List<dynamic>;
        final content = list.map((e) => EpisodeEntry.fromJson(e)).toList();

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
