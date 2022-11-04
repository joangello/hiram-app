enum DataLoadStatus {
  /// Initial state
  initial,

  /// Whether the status is loading
  /// any async call
  loading,

  /// Flags the status as failed
  failure,

  /// Whether the status is refreshing
  /// Normally used for pull down to refreshs
  refreshing,

  /// Whether the async call has been finished
  /// succesfully
  success,
}
