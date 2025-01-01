import 'package:appointed_client/models/user.dart';
import 'package:appointed_client/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointed_client/blocs/auth/auth_event.dart';
import 'package:appointed_client/blocs/auth/auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()){
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAuthCheckRequested(AuthCheckRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final UserModel? user = await authService.getCurrentUser();
      if (user != null) {
        emit (Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (error) {
      emit(Unauthenticated());
      emit(AuthError(message: error.toString()));
      throw Exception('Failed to check authentication: $error');
    }
  }

  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final UserModel? user = await authService.register(event.email, event.password);
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (error){
      emit(AuthError(message: error.toString()));
      throw Exception('Failed to register: $error');
    }
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final UserModel? user = await authService.signIn(event.email, event.password);
      if (user != null) {
        emit(Authenticated(user: user));
      }
    } catch (error) {
      emit(AuthError(message: error.toString()));
      throw Exception('Failed to login: $error');
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authService.signOut();
      emit(Unauthenticated());
    } catch (error) {
      emit(AuthError(message: error.toString()));
      throw Exception('Failed to logout: $error');
    }
  }
} 