// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:network/network.dart';
import 'package:repository/src/repositories/movie/movies_repository.dart';
import 'package:repository/src/repositories/search_movie/models/search_movie.dart';

import '../../../exception/repository_exception.dart';

class SearchMovieException extends RepositoryException {
  const SearchMovieException(Object error, StackTrace stackTrace)
      : super(error, stackTrace);
}

/// {@template movies_repository}
///
/// {@endtemplate}
class SearchMoviesRepository {
  final SearchMovieResource resource;

  //#region Initializers

  /// {@macro movies_repository}
  const SearchMoviesRepository({required this.resource});

  //#endregion

  //#region Instances methods

  Future<List<SearchMovie>> searchMovie({required String name}) async {
    try {
      final entry = await resource.search(name: name);
      return entry.map((e) => SearchMovie.fromEntry(e)).toList();
    } catch (e, s) {
      throw FetchMoviesException(e, s);
    }
  }

  //#endregion
}
