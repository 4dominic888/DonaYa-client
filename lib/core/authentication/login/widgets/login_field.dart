part of '../login_view.dart';

class _LoginField extends StatelessWidget {

  final String label;
  final String description;
  final FocusNode focusNode;
  final EdgeInsetsGeometry? padding;
  final Widget? additionalWidget;
  final void Function(String fieldValue)? onChanged;
  final dynamic onErrorSelected;

  const _LoginField({
    required this.label,
    required this.description,
    required this.focusNode,
    this.padding,
    this.onErrorSelected,
    this.additionalWidget,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: padding ?? const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: themeContext.textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: themeContext.colorScheme.onSecondary,
                  fontWeight: FontWeight.w500,
                )
              ),
              additionalWidget ?? const SizedBox.shrink(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: TextField(
              key: Key('fieldForm_${label}Input_textField'),
              focusNode: focusNode,
              onChanged: (value) => EasyDebounce.debounce(
                '${label}_${description}_anim',
                Duration(milliseconds: 100),
                () => onChanged?.call(value),
              ),
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                errorText: onErrorSelected != null ? 'invalid $label' : null,
                isDense: true,
                hintText: description,
                hintStyle: themeContext.textTheme.labelMedium!.copyWith(
                  //* neutrall600
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: DonaYaColorsNeutral.n30,
                    // FlutterFlowTheme.of(context).neutral30,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.error,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.error,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
              style: themeContext.textTheme.bodyMedium,
              cursorColor: themeContext.colorScheme.onPrimary
            ),
          ),
        )
      ],
    );
  }
}

