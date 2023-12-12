enum ErrorCodes{
  RESPONSE_BODY_IS_NULL("RESPONSE_BODY_IS_NULL"),
  DATA_IS_NULL("DATA_IS_NULL"),
  NOT_SUCCESS("NOT_SUCCESS");

  final String code;

  const ErrorCodes(this.code);

}