// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:network/network.dart';
import 'package:repository/src/repositories/movie/movies_repository.dart';

import '../../../exception/repository_exception.dart';

class FetchMoviesException extends RepositoryException {
  const FetchMoviesException(Object error, StackTrace stackTrace)
      : super(error, stackTrace);
}

class FetchEpisodesException extends RepositoryException {
  const FetchEpisodesException(Object error, StackTrace stackTrace)
      : super(error, stackTrace);
}

/// {@template movies_repository}
///
/// {@endtemplate}
class MoviesRepository {
  final MovieResource resource;

  //#region Initializers

  /// {@macro movies_repository}
  const MoviesRepository({required this.resource});

  //#endregion

  //#region Instances methods

  Future<List<Movie>> fetchMovies() async {
    try {
      final entry = await resource.fetchMovies();
      return entry.map((e) => Movie.fromEntry(e)).toList();
    } catch (e, s) {
      throw FetchMoviesException(e, s);
    }
  }

  Future<List<Episode>> fetchEpisodes({required int showId}) async {
    try {
      final entry = await resource.fetchEpisodes(showId: showId);
      return entry.map((e) => Episode.fromEntry(e)).toList();
    } catch (e, s) {
      throw FetchEpisodesException(e, s);
    }
  }

  //#endregion
}
