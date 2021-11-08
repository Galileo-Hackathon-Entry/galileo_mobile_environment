import 'dart:convert';
import 'dart:io';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:http/http.dart' as http;

class Common {}

class ReferenceValueData {
  static const int MARRIAGE_ID = 2;
  static const int BANK_TRANSFER = 7;
}

class ApiMessage {
  static const String ERROR = "Unable to establish connection. \nPlease contact your system administrator.";
  static const String CONNECT_TO_INTERNET = "Please connect to the internet.";
  static const String TIME_OUT = "Timeout.";
}

class CommonData {
  // API Setup
  //static const String API_BASE_URL = "https://192.168.0.4:45455/api"; // LOCAL
  static const String API_BASE_URL = "http://dgmonitoringapi-dev.ap-southeast-1.elasticbeanstalk.com/api"; // SERVER
  static const String API_VERSION = "APIVersion_1.0";
  static const String API_GATEWAY_URL = "$API_BASE_URL/api/APIGateway/APIRequest";
  static const int TIME_OUT_PERIOD = 60;
  //static const String API_IMAGE_PATH = "https://192.168.0.8:45455/dg_monitoring/price_reward";
  static const String API_PRICE_IMAGE_PATH = "https://dgmonitoring.s3.ap-southeast-1.amazonaws.com/price_reward/";
  static const String API_PROFILE_IMAGE_PATH = "https://dgmonitoring.s3.ap-southeast-1.amazonaws.com/profile_picture/";
  static const String API_TASK_PROOF_IMAGE_PATH = "https://dgmonitoring.s3.ap-southeast-1.amazonaws.com/proof_of_task/";

  // Other
  static const String APP_VERSION = "1.0.0";
  static const int IMAGE_QUALITY = 25;
}

class CommonMessage {
  static const String INVALID_CREDENTIALS = "Invalid Credentials";
  static const String CONFIRM_SUBMIT_LOAN_APPLICATION = "Are you sure to Submit  Loan Application";
  static const String CONFIRM_DRAFT_LOAN_APPLICATION = "Do you want to save Loan Application as Draft?";
}

class CommonFunctions {
  /// To Compress Image file to 200kb, because the max post request is 2mb
   static Future<File> compressFile(File file, {int sizeLimit}) async {
    if (sizeLimit == null) sizeLimit = 200;

    int bytes = file.lengthSync();
    while (bytes > sizeLimit * 1024) {
      File prevFilePath = file;
      file = await FlutterNativeImage.compressImage(file.path, quality: 90);
      bytes = file.lengthSync();
      prevFilePath.delete();
    }

    return file;
  }
}

class CommonGatewayAPICode {
  // User
  static const String REGISTER_USER = "RegisterUser";
  static const String LOGIN_USER = "LoginUser";
  static const String VALIDATE_IF_USER_EXIST = "ValidateUserIfExist";
  static const String VALIDATE_IF_ACCOUNT_EXIST = "ValidateAccountIfExist";
  static const String DOWNLOAD_SPECIFIC = "DownloadSpecific";
  static const String SUBMIT_LOAN_APPLICATION = "SubmitLoanApplication";
  static const String SAVE_CUSTOMER_INFO = "SaveCustomerInfo";
  static const String UPDATE_CUSTOMER_INFO = "UpdateCustomerInfo";
  static const String GET_CUSTOMER_INFO = "GetCustomerInfo";

  // Dropdown Values
  static const String GET_BUSINESS_CATEGORY = "GetDropDownBusinessCategory";
  static const String GET_BUSINESS_NATURE = "GetDropDownBusinessNature";
  static const String GET_PROVINCE = "GetDropDownProvince";
  static const String GET_CITY = "GetDropDownCity";
  static const String GET_BARANGAY = "GetDropDownBarangay";
  static const String GET_ZIPCODE = "GetDropDownZipcode";
  static const String GET_OCCUPATION_CATEGORY = "GetDropDownOccupationCategory";
  static const String GET_OCCUPATION = "GetDropDownOccupation";
  static const String GET_PRODUCT_NAME = "GetDropDownProductName";
  static const String GET_BANK_ACCOUNT = "GetDropDownBankListDisbursed";

  // Loan
  static const String SEND_TO_ELMS = "ELMSSendLoanApplication";
  static const String GET_LOAN_STAT_TRACKER = "GetLoanStatTracker";

  // Inquiry
  static const String GET_FAQS = "GetFAQs";
  static const String ADD_INQUIRY = "AddInquiry";
  static const String SEND_CHAT_INQUIRY = "ChatInquiry";
  static const String GET_INQUIRIES = "GetInquiries";
  static const String GET_INQUIRY_CONVERSATION = "GetInquiryConversation";

  // Notification
  static const String SEND_NOTIFICATION = "SendNotification";

  // OTP
  static const String SEND_OTP = "SendOTP";
  static const String VALIDATE_OTP = "ValidateOTP";

  // Zoloz
  static const String GET_ZOLOZ_ID = "GetZolozID";
  static const String GET_ZOLOZ_REQUIREMENT = "GetZolozRequirement";
}

class CommonAPIError {
  static String handleError(http.Response response) {
    if (response.statusCode == 400) {
      var data = json.decode(response.body);
      return data;
    } else if (response.statusCode == 404) {
      return ApiMessage.ERROR;
    } else if (response.statusCode == 500) {
      if (response.body.isEmpty) {
        return ApiMessage.ERROR;
      } else {
        var data = json.decode(response.body);
        return data["MessageList"][0];
      }
    } else {
      return ApiMessage.ERROR;
    }
  }
}

class CommonMethods {
  /// Convert Boolean to Int
  /// Passing in ELMS API, not accepting boolean, BIT only
  int convertBoolToInt(bool data) {
    return data.toString().toUpperCase() == "TRUE" ? 1 : 0;
  }

  /// Validate if connected in Internet
  Future<bool> isConnectedToInternet() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup("www.google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) isConnected = true;
    } on SocketException catch (_) {
      throw "Please Connect to Internet.";
    }
    return isConnected;
  }

  /// Validate if email is Valid Email Address
  bool isEmailValid(String email) {
    if (email.isEmpty) return false;
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  /// Compute Age from selected date
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
