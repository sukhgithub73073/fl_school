part of 'student_bloc.dart';


abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

class GetStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const GetStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
class CreateStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const CreateStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
