import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'name is required'),
  PatternValidator(r"(^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$)",
      errorText: "Enter only alphabates"),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'email is required'),
  EmailValidator(errorText: 'enter a valid email address'),
]);

final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'phone is required'),
  MinLengthValidator(10, errorText: "phone should be 10 digit"),
  MaxLengthValidator(10, errorText: "phone should be 10 digit"),
  PatternValidator(r'(^(0|[1-9][0-9]{0,9})$)',
      errorText: 'enter valid phone number'),
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character'),
]);
