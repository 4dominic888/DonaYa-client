part of '../register_view.dart';

class _RegisterSubmitButton extends StatelessWidget {
  const _RegisterSubmitButton();

  @override
  Widget build(BuildContext context) {

    final isInProgressOrSuccess = context.select(
      (RegisterBloc bloc) => bloc.state.status.isInProgressOrSuccess
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((RegisterBloc bloc) => bloc.state.isValid);

    return MainButton(
      onPressed: isValid ? () {
        TextInput.finishAutofillContext();
        context.read<RegisterBloc>().add(const RegisterSubmitted());
      } : null,
      text: 'Register',
      options: FFButtonOptions(
        width: double.infinity,
        height: 45,
      )
    );
  }
}