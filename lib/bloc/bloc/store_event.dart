part of 'store_bloc.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object> get props => [];
}

class GetDataStore extends StoreEvent {}

// ignore: must_be_immutable
class GetDataDetailStoreEvent extends StoreEvent {
  int id;
  GetDataDetailStoreEvent(this.id);
  @override
  List<Object> get props => [id];
}
