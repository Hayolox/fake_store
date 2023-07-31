import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_app/data/model/detail_store_model.dart';
import 'package:fake_store_app/data/model/home_store_model.dart';
import 'package:fake_store_app/data/repositories/store_repo.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepo storeRepo = StoreRepo();
  StoreBloc() : super(StoreInitial()) {
    Future.delayed(Duration.zero, () {
      add(GetDataStore());
    });
    on<GetDataStore>((event, emit) async {
      try {
        emit(
          LoadStore(),
        );
        List<HomeStoreModel> homeStoreModel = await storeRepo.dataHome();
        emit(
          GetDataStoreCompletedState(homeStoreModel),
        );
      } catch (e) {
        emit(ErrorStore(e.toString()));
      }
    });

    on<GetDataDetailStoreEvent>((event, emit) async {
      try {
        emit(
          LoadStore(),
        );

        DetailStoreModel detailStoreModel =
            await storeRepo.dataDetail(event.id);
        emit(GetDetailDataStoreCompleted(detailStoreModel));
      } catch (e) {
        emit(ErrorStore(e.toString()));
      }
    });
  }
}
