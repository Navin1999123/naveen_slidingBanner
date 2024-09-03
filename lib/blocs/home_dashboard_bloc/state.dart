import '../../modal/data_modal.dart';

abstract class JsonDataState {}

class JsonDataInitial extends JsonDataState {}

class JsonDataLoadingState extends JsonDataState {}

class JsonDataLoadedState extends JsonDataState {
  final DataModal dataModal;

  JsonDataLoadedState({required this.dataModal});
}

class JsonDataErrorState extends JsonDataState {
  final String message;

  JsonDataErrorState({required this.message});
}
