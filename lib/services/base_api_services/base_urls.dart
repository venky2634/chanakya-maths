abstract class BaseApiServices {
  // get class list

  final getClassListUrl =
      "https://chanakyamathskendra.batechnology.in/api/get-class-std";

  // SignUp

  final singUpUrl = "https://chanakyamathskendra.batechnology.in/api/register";

  // signup otp

  final signUpOtpUrl =
      "https://chanakyamathskendra.batechnology.in/api/verifyOtp";

  final reSendOtpUrl =
      "https://chanakyamathskendra.batechnology.in/api/resendOtp";

  final String updateUserDetailsURL =
      "https://chanakyamathskendra.batechnology.in/api/auth/update-user";

  final String updateBankDetailURL =
      "https://chanakyamathskendra.batechnology.in/api/auth/add-bank-details";
  final String getuserURI =
      "https://chanakyamathskendra.batechnology.in/api/auth/user-details";

  final String profileupdateURL =
      "https://chanakyamathskendra.batechnology.in/api/auth/update-user";

  final String LoginURI =
      "https://chanakyamathskendra.batechnology.in/api/login";

  final String useravilabilityURI =
      "https://chanakyamathskendra.batechnology.in/api/check-username-availability";

  final String getprivacypolicyURI =
      "https://chanakyamathskendra.batechnology.in/api/privacy-policy";
  final String loginURI =
      "https://chanakyamathskendra.batechnology.in/api/login";

  // get choose plan

  final String getplanUrl =
      "https://chanakyamathskendra.batechnology.in/api/get-plans";

  // add plans
  final String addPlansUrl =
      "https://chanakyamathskendra.batechnology.in/api/auth/add-plans";
  // final String LoginURI="https://chanakyamathskendra.batechnology.in/api/login";

  final String checkAllFilledUpURL =
      "https://chanakyamathskendra.batechnology.in/api/auth/check-screens";

  // qr code
  final String qrCodeUrl =
      "https://chanakyamathskendra.batechnology.in/api/auth/generate-payment-qr";

  final String uploadPaymentURL =
      "https://chanakyamathskendra.batechnology.in/api/auth/update/payment/details";

  final String forgetPasswordUrl =
      "https://chanakyamathskendra.batechnology.in/api/forgot-password";

  final String createPasswordUrl =
      "https://chanakyamathskendra.batechnology.in/api/change-password";

  final String termsandconditionURL =
      "https://chanakyamathskendra.batechnology.in/api/terms-and-conditions";
}
