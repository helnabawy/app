import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_operation.dart';

import 'app_center_event_enum_base.dart';

enum AppCenterEventEnum implements AppCenterEventEnumBase {
  Dashboard(
    'Dashboard',
    OperationType.Inquire,
    'open micro app',
    'الدخول على خدمة',
  ),
  LoadNotificationDashboard(
    'Dashboard.LoadNotificationDashboard',
    OperationType.ApiIntegration,
    'Load notification in dashboard',
    'تحميل الإشعارات في لوحة المعلومات',
  ),
  LoadNotificationCountDashboard(
    'Dashboard.LoadNotificationCountDashboard',
    OperationType.ApiIntegration,
    'Load notification count in dashboard',
    'تحميل إجمالي الإشعارات في لوحة المعلومات',
  ),
  SaveUserSessions(
    'Dashboard.SaveUserSessions',
    OperationType.ApiIntegration,
    'Save User Sessions in dashboard',
    'تسجيل معلومات المستخدم',
  ),
  GetUserInfo(
    'Dashboard.GetUserInfo',
    OperationType.ApiIntegration,
    'Get User Information in dashboard',
    'جلب بيانات المستخدم',
  ),
  LoadVerificationMenu(
    'Landing.LoadVerificationMenu',
    OperationType.ApiIntegration,
    'Load verification menu',
    'تحميل خدمات التحقق',
  ),
  ErrorWhileGetUserDataFromJwt(
    'Landing.ErrorWhileGetUserDataFromJwt',
    OperationType.Inquire,
    'Error While Get User Data after login',
    'خطأ اثناء تحميل بيانات المستخدم بعد تسجيل الدخول',
  ),
  LoadExecutionDashboard(
    'Dashboard.LoadExcutionDashboard',
    OperationType.ApiIntegration,
    'Load excution in dashboard',
    'تحميل خدمات التنفيذ في لوحة المعلومات',
  ),
  LoadLawSuitsDashboard(
    'Dashboard.LoadLawSuitsDashboard',
    OperationType.ApiIntegration,
    'Load law suits in dashboard',
    'تحميل خدمات القضاء في لوحة المعلومات',
  ),
  LoadLawyersDashboard(
    'Dashboard.LoadLawyersDashboard',
    OperationType.ApiIntegration,
    'Load lawyers in dashboard',
    'تحميل التراخيص ف لوحة المعلومات',
  ),
  LoadRealEstateDashboard(
    'Dashboard.LoadRealEstateDashboard',
    OperationType.ApiIntegration,
    'Load real estate in dashboard',
    'تحميل العقارات ف لوحة المعلومات',
  ),
  LoadServiceDescriptionDashboard(
    'Dashboard.LoadServiceDescriptionDashboard',
    OperationType.ApiIntegration,
    'Load service description',
    'تحميل وصف الخدمة ف لوحة المعلومات',
  ),
  ElectronicServiceDescriptionDashboard(
    'Dashboard.ElectronicServiceDescriptionDashboard',
    OperationType.Inquire,
    'open service description',
    'الدخول علي وصف خدمة',
  ),
  LoadFavouritesDashboard(
    'Dashboard.LoadFavouritesDashboard',
    OperationType.ApiIntegration,
    'Load Favourites in dashboard',
    'تحميل قائمة المفضلة في لوحة المعلومات',
  ),
  MarkNotificationAsRead(
    'Dashboard.MarkNotificationAsRead',
    OperationType.ApiIntegration,
    'Mark notification as read',
    'وضع علامة على الاشعار كمقروء',
  ),
  LoadElectronicServiceCategoriesDashboard(
    'Dashboard.LoadElectronicServiceCategoriesDashboard',
    OperationType.ApiIntegration,
    'Load electronic service categories',
    'تحميل فئات الخدمات الإلكترونية',
  ),
  UpdateServiceFavouriteStatusDashboard(
    'Dashboard.UpdateServiceFavouriteStatusDashboard',
    OperationType.ApiIntegration,
    'Update service favourite status',
    'تحديث حالة الخدمة المفضلة',
  ),
  LandingFAQ(
    'Landing.FAQ',
    OperationType.Inquire,
    'Log into Frequently Asked Questions',
    'الدخول على الأسئلة المتكررة',
  ),
  LoadingFAQ(
    'Landing.FAQ',
    OperationType.ApiIntegration,
    'Load Frequently Asked Questions',
    'تحميل الأسئلة المتكررة',
  ),
  LandingChat(
    'Landing.Chat',
    OperationType.Inquire,
    'Entering the instant chat in landing',
    'الدخول على المحادثة الفورية في صفحة الهبوط',
  ),
  DashboardChat(
    'Dashboard.Chat',
    OperationType.Inquire,
    'Entering the instant chat in dashboard',
    'الدخول على المحادثة الفورية في لوحة المعلومات',
  ),
  LandingPrivacyPolicy(
    'Landing.PrivacyPolicy',
    OperationType.Inquire,
    'Entering privacy policy',
    'الدخول على سياسة الخصوصية',
  ),
  LoadingPrivacyPolicy(
    'Loading.PrivacyPolicy',
    OperationType.ApiIntegration,
    'Load privacy policy & terms and conditions',
    'تحميل سياسة الخصوصية & شروط الاستخدام',
  ),
  LandingTermsAndConditions(
    'Landing.TermsAndConditions',
    OperationType.Inquire,
    'Entering the Terms and Conditions',
    'الدخول على الشروط و الاحكام',
  ),
  LandingNajizPartners(
    'Landing.NajizPartners',
    OperationType.Inquire,
    'Entering najiz partners',
    'الدخول على شركاء ناجز',
  ),
  LoadingNajizPartners(
    'Loading.NajizPartners',
    OperationType.ApiIntegration,
    'Load najiz partners',
    'تحميل شركاء ناجز',
  ),
  LandingLogin(
    'Landing.Login',
    OperationType.Procedural,
    'User Login',
    'الضغط على زر تسجيل الدخول',
  ),
  CancelingLoginClicked(
    'Landing.CancelLoginClicked',
    OperationType.Procedural,
    'cancel Login clicked by user',
    ' الغاء تسجيل الدخول بواسطة المستخدم',
  ),
  EnterAllVerficationMenuLaning(
    'Landing.EnterAllVerificationMenu',
    OperationType.Inquire,
    'Enter All Verification Menu',
    'الدخول علي شاشة جميع التحقق',
  ),
  EnterAllVerficationMenuDashboard(
    'Dashboard.EnterAllVerficationMenu',
    OperationType.Inquire,
    'Enter All Verfication Menu',
    'الدخول علي شاشة جميع التحقق',
  ),
  LoadMicroApps(
    'Landing.LoadMicropApps',
    OperationType.ApiIntegration,
    'Load micro apps',
    'تحميل تطبيقات الايونك',
  ),
  LoadingFaqCats(
    'Landing.FAQCategories',
    OperationType.ApiIntegration,
    'Load faq categories',
    'تحميل الفئات الاسئلة المتكررة',
  ),
  LandingFaqCats(
    'Landing.FAQCategories',
    OperationType.Inquire,
    'enter faq categories',
    'عرض الفئات الاسئلة المتكررة',
  ),
  LoadCondig(
    'Landing.LoadCondig',
    OperationType.Verification,
    'Load App Condig',
    'تحميل اعدادات النظام',
  );

  @override
  final String eventName;
  @override
  final OperationType operationType;
  @override
  final String serviceNameEn;
  @override
  final String serviceNameAr;

  const AppCenterEventEnum(
    this.eventName,
    this.operationType,
    this.serviceNameEn,
    this.serviceNameAr,
  );
}
