class ApiEndpoints {
  static final String baseUrl = 'https://test4u.kacs.my/api/';
  static final String token =
      'Bearer 6fb1e74c98b335dbac6ea6cec08b24b020ed56401e88d88d829bbe77bb1dd94b9845301283b2819f84003aee71bf03a297f56ab10ce107c5dafcf2fce2bb914bde8f4078cf2f27b9b1347602a23db6ab61d95e4e3b0b4c1aae9fed638a1cdac956cbf2c27eeba9dba86c660b2174adbac25834ed9ef825e1889309de33205972';
  static AuthEndPoints authEndPoints = AuthEndPoints();
  static GeneralEndPoints generalEndPoints = GeneralEndPoints();
  static NovelEndPoints novelEndPoints = NovelEndPoints();
}

class AuthEndPoints {
  final String signup = 'register';
  final String login = 'login';
  final String validateOtp = 'validateOtp';
}

class GeneralEndPoints {
  final String countryCode = 'countryCode';
}

class NovelEndPoints {
  final String fetchNovel = 'fetchNovel';
  final String novel = 'novel';
}
