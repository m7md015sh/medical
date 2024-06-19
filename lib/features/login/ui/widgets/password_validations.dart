import 'package:flutter/material.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
      Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration:  BoxDecoration(
            color:hasValidated? Colors.blue:Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
         hasValidated? const Icon(
          Icons.check,
          color: ColorsManager.moreLightGray,
          size: 12,
        ): const Icon(
           Icons.close,
           color: Colors.white,
           size: 12,
         ),
      ],
    ),
         horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decorationColor: ColorsManager.darkBlue,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.darkBlue : ColorsManager.gray,
          ),
        )

    ],
    );
  }
}
