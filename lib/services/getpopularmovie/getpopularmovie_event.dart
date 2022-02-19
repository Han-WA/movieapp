part of 'getlatestnews_bloc.dart';

abstract class GetLatestNewsEvent extends Equatable {
  const GetLatestNewsEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetLatestNewsFetched extends GetLatestNewsEvent {}

class GetLatestNewsReload extends GetLatestNewsEvent {}
