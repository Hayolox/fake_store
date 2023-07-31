part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

class StoreInitial extends StoreState {}

class LoadStore extends StoreState {}

class ErrorStore extends StoreState {
  String message;
  ErrorStore(this.message);
}

class GetDataStoreCompletedState extends StoreState {
  List<HomeStoreModel> dataHomeStore;
  GetDataStoreCompletedState(this.dataHomeStore);

  List<Object> get props => [dataHomeStore];
}

class GetDetailDataStoreCompleted extends StoreState {
  DetailStoreModel dataDetailStore;
  GetDetailDataStoreCompleted(this.dataDetailStore);
}
