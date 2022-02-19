import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mnhrc_app/models/latestnewsmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../repo.dart';
part 'getlatestnews_event.dart';
part 'getlatestnews_state.dart';

class GetLatestNewsBloc extends Bloc<GetLatestNewsEvent, GetLatestNewsState> {
  GetLatestNewsBloc({required this.apiRepository})
      : super(const GetLatestNewsState());

  final Repo apiRepository;

  @override
  Stream<Transition<GetLatestNewsEvent, GetLatestNewsState>> transformEvents(
    Stream<GetLatestNewsEvent> events,
    TransitionFunction<GetLatestNewsEvent, GetLatestNewsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<GetLatestNewsState> mapEventToState(GetLatestNewsEvent event) async* {
    if (event is GetLatestNewsFetched) {
      yield await _mapPostToState(state);
    } else if (event is GetLatestNewsReload) {
      yield await _mapPostToState(state.copyWith(
          postList: [],
          hasReachedMax: false,
          status: GetLatestNewsStatus.initial));
    }
  }

  Future<GetLatestNewsState> _mapPostToState(GetLatestNewsState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == GetLatestNewsStatus.initial) {
        final postList = await getAllLatestNews();
        return state.copyWith(
          status: GetLatestNewsStatus.success,
          postList: postList,
          hasReachedMax: false,
        );
      }
      final postList = await getAllLatestNews();
      return postList.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: GetLatestNewsStatus.success,
              postList: List.of(state.newsList)..addAll(postList),
              hasReachedMax: false,
            );
    } catch (e) {
      print(e.toString());
      return state.copyWith(status: GetLatestNewsStatus.failure);
    }
  }

  set setPage(data) => page = data;

  int page = 1;

  Future<List<DataModel>> getAllLatestNews() async {
    try {
      LatestNewsModel newsModel = await apiRepository.getLatestNews();
      List<DataModel> newsList = newsModel.data;
      return newsList;
    } catch (e) {
      return [];
    }
  }
}
