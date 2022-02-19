part of 'getlatestnews_bloc.dart';

enum GetLatestNewsStatus { initial, success, failure }

class GetLatestNewsState extends Equatable {
  const GetLatestNewsState({
    this.status = GetLatestNewsStatus.initial,
    this.newsList = const <DataModel>[],
    this.hasReachedMax = false,
  });

  final GetLatestNewsStatus status;
  final List<DataModel> newsList;
  final bool hasReachedMax;

  GetLatestNewsState copyWith({
    GetLatestNewsStatus? status,
    List<DataModel>? postList,
    bool? hasReachedMax,
  }) {
    return GetLatestNewsState(
      status: status ?? this.status,
      newsList: postList ?? this.newsList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''UserState { status: $status, hasReachedMax: $hasReachedMax, posts: ${newsList.length} }''';
  }

  @override
  List<Object> get props => [status, newsList, hasReachedMax];
}
