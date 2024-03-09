part of 'classes_bloc.dart';

abstract class ClassesEvent extends Equatable {
  const ClassesEvent();
}
class GetClassesEvent extends ClassesEvent {
  final Map<String , dynamic> map ;
  const GetClassesEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
class GetClassesByGroupEvent extends ClassesEvent {
  final Map<String , dynamic> map ;
  const GetClassesByGroupEvent({required this.map});

  @override
  List<Object?> get props => [map];
}




class CreateClassesEvent extends ClassesEvent {
  final Map<String , dynamic> map ;
  const CreateClassesEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
