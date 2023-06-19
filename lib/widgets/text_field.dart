import 'package:flutter/material.dart';
import '../components/constants.dart';

class TextFieldCustom extends SizedBox {
  TextFieldCustom(
      {super.key,
      Function()? onTap,
      Widget? child,
      controller,
      bool? obscureText,
      onSubmitted,
      onChanged,
      hintText,
      suffixIcon})
      : super(
          height: 50,
          width: double.infinity,
          child: TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            onSubmitted: onSubmitted,
            onTap: onTap,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 14, color: kTextColorButton),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: SizedBox(
                  width: 22,
                  child: Center(child: child),
                ),
                suffixIcon: suffixIcon,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(width: 1, color: kTextColorButton)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(width: 1, color: kPrimaryColor))),
          ),
        );
}
