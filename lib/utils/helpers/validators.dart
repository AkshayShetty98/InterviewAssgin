class Validators {
  static dynamic required(
    String? valueCandidate, {
    String errorText = 'This field cannot be empty.',
  }) {
    if (valueCandidate == '' ||
        ((valueCandidate is Iterable || valueCandidate is Map) &&
            valueCandidate!.isEmpty)) {
      return errorText;
    }
    return null;
  }
}
