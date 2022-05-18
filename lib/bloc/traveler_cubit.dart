import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningtask/models/get_traveler.dart';
import 'package:learningtask/services/traveler_service.dart';

class TravelerBlocCubit extends Cubit<TravelerState> {
  TravelerBlocCubit() : super(TravelerInitial());

  fetchingTravelerData(int page) async {
    emit(TravelerInitial());
    TravelerServices apiServices = TravelerServices();
    final travelerResponse = await apiServices.getPageTraveler();
    if (travelerResponse is TravelPageResponse) {
      emit(TravelerPageLoaded(travelerResponse));
    } else {
      emit(TravelerFailedLoad(travelerResponse));
    }
  }

  postTravelerData(String name, String email, String address) async {
    TravelerServices apiServices = TravelerServices();
    final travelerResponse =
        await apiServices.postTraveler(name, email, address);
    if (travelerResponse is TravelPostResponse) {
      emit(TravelerPostSuccess(travelerResponse));
    } else {
      emit(TravelerFailedLoad(travelerResponse));
    }
  }

  putTravelerData(String id, String name, String email, String address) async {
    TravelerServices apiServices = TravelerServices();
    final travelerResponse =
        await apiServices.putTraveler(id, name, email, address);
    if (travelerResponse is TravelPostResponse) {
      emit(TravelerPutSuccess(travelerResponse));
    } else {
      emit(TravelerFailedLoad(travelerResponse));
    }
  }
}

abstract class TravelerState extends Equatable {
  const TravelerState();

  @override
  List<Object> get props => [];
}

class TravelerInitial extends TravelerState {}

class TravelerPageLoaded extends TravelerState {
  final TravelPageResponse travelerPageResponse;

  const TravelerPageLoaded(this.travelerPageResponse);

  @override
  List<Object> get props => [travelerPageResponse];
}

class TravelerPostSuccess extends TravelerState {
  final TravelPostResponse travelerPageResponse;

  const TravelerPostSuccess(this.travelerPageResponse);

  @override
  List<Object> get props => [travelerPageResponse];
}

class TravelerPutSuccess extends TravelerState {
  final TravelPostResponse travelerPageResponse;

  const TravelerPutSuccess(this.travelerPageResponse);

  @override
  List<Object> get props => [travelerPageResponse];
}

class TravelerFailedLoad extends TravelerState {
  final String message;

  const TravelerFailedLoad(this.message);

  @override
  List<Object> get props => [message];
}
