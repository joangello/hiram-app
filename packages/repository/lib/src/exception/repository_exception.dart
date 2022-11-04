// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

/// {@template repository_exception}
/// Failure thrown when a error occurs.
/// {@endtemplate}
abstract class RepositoryException implements Exception {
  //#region Initializers

  /// {@macro network_failure}
  const RepositoryException(this.exception, this.stackTrace);
  //#endregion

  /// Underlying original exception
  final Object exception;

  /// Original stacktrace
  final StackTrace stackTrace;
}
