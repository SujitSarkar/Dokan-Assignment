part of 'widget_imports.dart';

class TextFormFieldWithTitle extends StatefulWidget {
  const TextFormFieldWithTitle(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.onTap,
      this.obscure = false,
      this.readOnly = false,
      this.required = false,
      this.textInputType,
      this.textCapitalization,
      this.textAlign = TextAlign.left,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixColor,
      this.prefixColor,
      this.maxLine,
      this.minLine,
      this.validationErrorMessage,
      this.maxLength,
      this.suffixOnTap,
      this.prefixOnTap,
      this.onChanged,
      this.onEditingComplete,
      this.contentPadding,
      this.focusNode});

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final Color? prefixColor;
  final TextAlign? textAlign;
  final bool obscure;
  final bool required;
  final bool readOnly;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final String? validationErrorMessage;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? suffixOnTap;
  final Function()? prefixOnTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<TextFormFieldWithTitle> createState() => _TextFormFieldWithTitleState();
}

class _TextFormFieldWithTitleState extends State<TextFormFieldWithTitle> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.text.size(16.sp).color(AppColors.hintColor).make(),
        8.heightBox,
        TextFormField(
          validator: (value) {
            if (widget.required && value != null && value.isEmpty) {
              return "${widget.labelText} ${AppString.canNotEmpty}";
            } else if (widget.required &&
                value != null &&
                widget.textInputType == TextInputType.emailAddress &&
                !value.isValidEmail) {
              return AppString.invalidEmailAddress;
            } else {
              return null;
            }
          },
          controller: widget.controller,
          onTap: widget.onTap,
          focusNode: widget.focusNode,
          onChanged: (val) {
            if (widget.onChanged != null) {
              widget.onChanged!(val);
            }
          },
          maxLength: widget.maxLength,
          onEditingComplete: widget.onEditingComplete,
          readOnly: widget.readOnly,
          obscureText: widget.obscure ? _obscure : false,
          keyboardType: widget.textInputType ?? TextInputType.text,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          maxLines: widget.maxLine ?? 1,
          minLines: widget.minLine ?? 1,
          textAlign: widget.textAlign!,
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 17.5.sp),
          decoration: InputDecoration(
              fillColor: AppColors.cardColor,
              filled: true,
              errorText: widget.validationErrorMessage,
              alignLabelWithHint: true,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: AppColors.hintColor, width: 0.5)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: AppColors.hintColor, width: 0.5)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: AppColors.hintColor, width: 0.5)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: AppColors.errorColor, width: 0.5)),
              isDense: true,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              hintText: widget.hintText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintStyle: TextStyle(
                  color: AppColors.textFieldHintColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 17.5.sp),
              prefixIcon: widget.prefixIcon != null
                  ? InkWell(
                      onTap: widget.prefixOnTap,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 10),
                        child: Icon(widget.prefixIcon,
                            size: 20,
                            color: widget.prefixColor ??
                                AppColors.textFieldHintColor),
                      ),
                    )
                  : null,
              suffixIconConstraints: BoxConstraints.loose(size),
              prefixIconConstraints: BoxConstraints.loose(size),
              suffixIcon: widget.obscure
                  ? InkWell(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                            _obscure
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            size: 20,
                            color: widget.suffixColor ??
                                AppColors.textFieldHintColor),
                      ),
                    )
                  : InkWell(
                      onTap: widget.suffixOnTap,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          widget.suffixIcon,
                          size: 28,
                          color: AppColors.textFieldHintColor,
                        ),
                      ),
                    )),
        ),
      ],
    );
  }
}
