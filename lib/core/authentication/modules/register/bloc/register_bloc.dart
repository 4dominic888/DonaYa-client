import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/models/user_register.dart';
import 'package:dona_ya/core/authentication/modules/login/models/models.dart';
import 'package:dona_ya/core/authentication/modules/register/models/models.dart';
import 'package:dona_ya/core/shared/models/contact_info.dart';
import 'package:dona_ya/core/shared/utils/app_error.dart';
import 'package:dona_ya/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc({
    required AuthService authenticationService,
  }) : _authService = authenticationService,
       super(const RegisterState()) {
    on<RegisterFirstNameChanged>(_onFirstNameChanged);
    on<RegisterSurnameChanged>(_onSurnameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterBirthdateChanged>(_onBirthdateChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final AuthService _authService;

  void _onFirstNameChanged(
    RegisterFirstNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final firstName = NameInput.dirty(event.name);
    emit(
      state.copyWith(
        name: firstName,
        isValid: Formz.validate([firstName, state.surname, state.phone, state.birthdate]),
      ),
    );
  }

  void _onSurnameChanged(
    RegisterSurnameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final surname = SurnameInput.dirty(event.surname);
    emit(
      state.copyWith(
        surname: surname,
        isValid: Formz.validate([surname, state.name, state.phone, state.birthdate]),
      ),
    );
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = EmailInput.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.name, state.surname, state.phone, state.birthdate]),
      ),
    );
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = PasswordInput.dirty(event.password, strict: true);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.name, state.surname, state.email, state.phone, state.birthdate]),
      ),
    );
  }

  void _onPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phone = PhoneInput.dirty(event.phone.completeNumber);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([phone, state.name, state.surname, state.email, state.password, state.birthdate]),
      ),
    );
  }

  void _onBirthdateChanged(
    RegisterBirthdateChanged event,
    Emitter<RegisterState> emit,
  ) {
    final birthdate = BirthdateInput.dirty(event.birthdate);
    emit(
      state.copyWith(
        birthdate: birthdate,
        isValid: Formz.validate([birthdate, state.name, state.surname, state.email, state.password, state.phone]),
      ),
    );
  }

  void _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final result = await _authService.register(
          userRegister: CustomUserRegister(
            birthday: state.birthdate.value!,
            email: EmailContact(state.email.value),
            firstName: state.name.value,
            lastName: state.surname.value,
            phone: PhoneNumber.fromCompleteNumber(completeNumber: state.phone.value),
            address: null,
            avatar: null,
          ),
          password: state.password.value,
        );

        if (result.isErr) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            error: result.unwrapErr(),
          ));
          return;
        }
        
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: NetworkError.unknown,
        ));
        logger.e('Register bloc error', error: e);
      }
    }
  }
}