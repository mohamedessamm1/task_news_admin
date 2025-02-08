part of 'home_manager_cubit.dart';

@immutable
sealed class HomeManagerState {}

final class HomeManagerInitial extends HomeManagerState {}
final class ProfileimgSuccess extends HomeManagerState {}
final class ImageSuccessUploadState extends HomeManagerState {}
final class DataBaseUploadedState extends HomeManagerState {}
final class ChangeSwitchSuccessState extends HomeManagerState {}
final class GetDataFromDataBaseState extends HomeManagerState {}
final class GetDataFromDataBaseLoadingState extends HomeManagerState {}
final class RadioChangeState extends HomeManagerState {}
