part of '../login_view.dart';

class _LoginSubmitButton extends StatelessWidget {

  const _LoginSubmitButton();

  @override
  Widget build(BuildContext context) {

    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return MainButton(
      onPressed: isValid
        ? () {
          TextInput.finishAutofillContext();
          context.read<LoginBloc>().add(const LoginSubmitted());
        }
        : null,
      text: 'Continue',
      options: FFButtonOptions(
        width: double.infinity,
        height: 40,
      )
    );
  }
}
