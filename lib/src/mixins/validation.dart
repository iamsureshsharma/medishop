class ValidationMixin {
  static const String IS_EMPTY = 'This Field Can\'t be empty';
  static const String INVALID_PASSWORD = 'Password must be in between 8-32 characters, excluding spaces';
  static const String INVALID_EMAIL = 'This Email is Invalid';
  static const String IS_EMOJI = 'isEmojiMessage';
  static const String INVALID_OTP = 'invalidOTP';
  static const String INVALID_MOBILE = 'Please enter a valid mobile number';
  static const String IS_NEGATIVE_VALUE = 'isNegativeValue';
  static const String IS_LARGE_VALUE = 'isLargeValue';
  static const String INVALID_VALUE = 'invalidValue';

  /// Validates email
  String validateEmail(String value) {
    String result = validateNonEmoji(value);
    if (result != null) return result;

    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return INVALID_EMAIL;
    } else {
      return null;
    }
  }

  /// Validates if the field is empty or not
  String validateField(String value) {
    String result = validateNonEmoji(value);
    if (result != null) return result;

    if (value.length < 1) {
      return IS_EMPTY;
    } else {
      return null;
    }
  }

  /// Validates the length of the OTP
  String validateOTP(String value) {
    String result = validateNonEmoji(value);
    if (result != null) return result;

    RegExp regExp = RegExp(r'\b\d{5}\b');
    if (!regExp.hasMatch(value)) {
      return INVALID_OTP;
    } else {
      return null;
    }
  }

  /// Validates mobile number
  String validateMobile(String value) {
    String result = validateNonEmoji(value);
    if (result != null) return result;

    String pattern = r'(^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return INVALID_MOBILE;
    } else {
      return null;
    }
  }

  ///method to validate passwords
  String validatePassword(String value) {
    if (value == null || value.trim().isEmpty) {
      return IS_EMPTY;
    }

    String result = validateNonEmoji(value);
    if (result != null) return result;

    if (value.length < 8 || value.length > 32 || value.contains(' ')) {
      return INVALID_PASSWORD;
    } else {
      return null;
    }
  }

  /// Validates if non-emoji is entered or not
  ///
  /// Returns null for non-emoji value
  String validateNonEmoji(String value) {
    if (value == null || value.trim().isEmpty) {
      return IS_EMPTY;
    }

    String pattern =
        r'^(?:(?!(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff]))[^`☺]){1,255}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return IS_EMOJI;
    } else {
      return null;
    }
  }
}
