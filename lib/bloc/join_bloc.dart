import 'package:chat_flutter/models/user_login.dart';
import 'package:chat_flutter/repositories/join_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class JoinEvent {
  final UserLogin _user;
  JoinEvent({user}) : _user = user;

  UserLogin get user => _user;
}
abstract class JoinState {}
class JoinInitial extends JoinState {}
class JoinSuccess extends JoinState {}
class JoinFailure extends JoinState {}

class JoinBloc extends Bloc<JoinEvent, JoinState> {
  late final JoinRepository joinRepository;

  JoinBloc() : super(JoinInitial()) {
    joinRepository = JoinRepository();
    on<JoinEvent>((event, emit) async => emit(await _onJoinEvent(event.user)));
  }

  Future<JoinState> _onJoinEvent(UserLogin user) async {
    final response = await joinRepository.register(user);
    return response.fold((left) => JoinFailure(), (right) => JoinSuccess());
  }

}
