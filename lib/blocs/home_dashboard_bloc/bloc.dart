import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_banners/blocs/home_dashboard_bloc/state.dart';

import '../../modal/data_modal.dart';


  class JsonDataCubit extends Cubit<JsonDataState> {
  JsonDataCubit() : super(JsonDataInitial());

  Future<void> fetchData() async {
    emit(JsonDataLoadingState());
    try {
      final String response = await rootBundle.loadString('assets/json_data/data.json');
      final dataModal = dataModalFromJson(response);
      emit(JsonDataLoadedState(dataModal: dataModal));
    } catch (e) {
      emit(JsonDataErrorState(message: 'Failed to load data: $e'));
    }
  }
}