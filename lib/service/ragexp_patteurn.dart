class RagExpPatteurn {
  static final userNamePasswordPattern =
      RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$');
  static final emailPattern = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*$');
  // 다른 정규식 패턴들을 필요에 따라 추가할 수 있습니다.
}
