class EndPoint {
  static String baseUrl = "http://78.89.159.126:9393/TheOneAPIRehana/api";

  /// auth

  static String login = "$baseUrl/Member/loginMember";
  static String forgetpassw = "$baseUrl/Member/forgotpassword";
  static String changePassconfirm = "$baseUrl/Member/resetpassword";
  static String logout = "$baseUrl/Member/logout";

  /// invitation
  static String recurring = "$baseUrl/Invitation/recurring";
  static String oneTime = "$baseUrl/Invitation/oneTime";
  static String group = "$baseUrl/Invitation/group";

  /// get info about invitation
  static String invitation = "$baseUrl/Member/byStatus?status=";

  static String addFamilyDependant = "$baseUrl/Member/addFamilyDependant";
  static String getfammilydata = "$baseUrl/Member/familyDependants";
  static String deletememberid = "$baseUrl/Member/";
  static String familydependts = "$baseUrl/Member/familyDependants";

  /// chat
  static const String hubUrl =
      'http://78.89.159.126:9393/TheOneAPIRehana/chatHub';

  static String chat = "$baseUrl/Chat/messages";
  static String sendmessage = "$baseUrl/Chat/sendMessage";

  ///finance

  static String finnance = "$baseUrl/Member/bondsSummaryByYear";
  static String cancel = "$baseUrl/Member/cancelInvitation/";
  static String reschudle = "$baseUrl/Member/invitation/reschedule";
}
