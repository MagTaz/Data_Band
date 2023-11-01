// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Passowrd`
  String get password {
    return Intl.message(
      'Passowrd',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the Email`
  String get emptyEmail {
    return Intl.message(
      'Please Enter the Email',
      name: 'emptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the Password`
  String get emptypassword {
    return Intl.message(
      'Please Enter the Password',
      name: 'emptypassword',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get progress {
    return Intl.message(
      'In Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message(
      'Rejected',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Color`
  String get change_color {
    return Intl.message(
      'Change Color',
      name: 'change_color',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get SettingsPage_AboutUs {
    return Intl.message(
      'About Us',
      name: 'SettingsPage_AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Reported`
  String get Reported {
    return Intl.message(
      'Reported',
      name: 'Reported',
      desc: '',
      args: [],
    );
  }

  /// `Affected`
  String get Affected {
    return Intl.message(
      'Affected',
      name: 'Affected',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `By Status`
  String get ByStatus {
    return Intl.message(
      'By Status',
      name: 'ByStatus',
      desc: '',
      args: [],
    );
  }

  /// `By Reported`
  String get ByReported {
    return Intl.message(
      'By Reported',
      name: 'ByReported',
      desc: '',
      args: [],
    );
  }

  /// `by Affected`
  String get ByAffected {
    return Intl.message(
      'by Affected',
      name: 'ByAffected',
      desc: '',
      args: [],
    );
  }

  /// `Select date`
  String get SelectDate {
    return Intl.message(
      'Select date',
      name: 'SelectDate',
      desc: '',
      args: [],
    );
  }

  /// `There is no Requests !!!`
  String get EmployeeFilter_ThereIsNoRequests {
    return Intl.message(
      'There is no Requests !!!',
      name: 'EmployeeFilter_ThereIsNoRequests',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get AppBar_Settings {
    return Intl.message(
      'Settings',
      name: 'AppBar_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get AppBar_Home {
    return Intl.message(
      'Home',
      name: 'AppBar_Home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get AppBar_Search {
    return Intl.message(
      'Search',
      name: 'AppBar_Search',
      desc: '',
      args: [],
    );
  }

  /// `Tasks Count`
  String get TasksChartWidget_TasksCount {
    return Intl.message(
      'Tasks Count',
      name: 'TasksChartWidget_TasksCount',
      desc: '',
      args: [],
    );
  }

  /// `Tasks Filter`
  String get Tasker_Filter_Page {
    return Intl.message(
      'Tasks Filter',
      name: 'Tasker_Filter_Page',
      desc: '',
      args: [],
    );
  }

  /// `Task Details`
  String get details {
    return Intl.message(
      'Task Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get Toast_LoginSuccessful {
    return Intl.message(
      'Login successful',
      name: 'Toast_LoginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Username or password is incorrect`
  String get Toast_UsernameOrPasswordIncorrect {
    return Intl.message(
      'Username or password is incorrect',
      name: 'Toast_UsernameOrPasswordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Task Info `
  String get TaskDetails_TaskInfo {
    return Intl.message(
      'Task Info ',
      name: 'TaskDetails_TaskInfo',
      desc: '',
      args: [],
    );
  }

  /// `From `
  String get TaskDetails_TaskInfoWidget_From {
    return Intl.message(
      'From ',
      name: 'TaskDetails_TaskInfoWidget_From',
      desc: '',
      args: [],
    );
  }

  /// `TO `
  String get TaskDetails_TaskInfoWidget_To {
    return Intl.message(
      'TO ',
      name: 'TaskDetails_TaskInfoWidget_To',
      desc: '',
      args: [],
    );
  }

  /// `Task Date`
  String get TaskDetails_TaskInfoWidget_TaskDate {
    return Intl.message(
      'Task Date',
      name: 'TaskDetails_TaskInfoWidget_TaskDate',
      desc: '',
      args: [],
    );
  }

  /// `Work Order`
  String get TaskDetails_TaskInfoWidget_WorkOrder {
    return Intl.message(
      'Work Order',
      name: 'TaskDetails_TaskInfoWidget_WorkOrder',
      desc: '',
      args: [],
    );
  }

  /// `Task Number`
  String get TaskDetails_TaskInfoWidget_TaskNumber {
    return Intl.message(
      'Task Number',
      name: 'TaskDetails_TaskInfoWidget_TaskNumber',
      desc: '',
      args: [],
    );
  }

  /// `Work Type`
  String get TaskDetails_TaskInfoWidget_WorkType {
    return Intl.message(
      'Work Type',
      name: 'TaskDetails_TaskInfoWidget_WorkType',
      desc: '',
      args: [],
    );
  }

  /// `Working Time`
  String get TaskDetails_TaskInfoWidget_WorkingTime {
    return Intl.message(
      'Working Time',
      name: 'TaskDetails_TaskInfoWidget_WorkingTime',
      desc: '',
      args: [],
    );
  }

  /// `Task Description`
  String get TaskDetails_TaskInfoWidget_TaskDescription {
    return Intl.message(
      'Task Description',
      name: 'TaskDetails_TaskInfoWidget_TaskDescription',
      desc: '',
      args: [],
    );
  }

  /// `Asset Info `
  String get TaskDetails_AssetInfo {
    return Intl.message(
      'Asset Info ',
      name: 'TaskDetails_AssetInfo',
      desc: '',
      args: [],
    );
  }

  /// `Asset Code`
  String get TaskDetails_AssetInfo_AssetCode {
    return Intl.message(
      'Asset Code',
      name: 'TaskDetails_AssetInfo_AssetCode',
      desc: '',
      args: [],
    );
  }

  /// `Asset Name`
  String get TaskDetails_AssetInfo_AssetName {
    return Intl.message(
      'Asset Name',
      name: 'TaskDetails_AssetInfo_AssetName',
      desc: '',
      args: [],
    );
  }

  /// `Asset Type`
  String get TaskDetails_AssetInfo_AssetType {
    return Intl.message(
      'Asset Type',
      name: 'TaskDetails_AssetInfo_AssetType',
      desc: '',
      args: [],
    );
  }

  /// `Asset Group`
  String get TaskDetails_AssetInfo_AssetGroup {
    return Intl.message(
      'Asset Group',
      name: 'TaskDetails_AssetInfo_AssetGroup',
      desc: '',
      args: [],
    );
  }

  /// `Description `
  String get TaskDetails_Description {
    return Intl.message(
      'Description ',
      name: 'TaskDetails_Description',
      desc: '',
      args: [],
    );
  }

  /// `Classify`
  String get TaskDetails_Description_Classify {
    return Intl.message(
      'Classify',
      name: 'TaskDetails_Description_Classify',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get TaskDetails_Description_Summary {
    return Intl.message(
      'Summary',
      name: 'TaskDetails_Description_Summary',
      desc: '',
      args: [],
    );
  }

  /// `Problem Description`
  String get TaskDetails_Description_ProblemDescription {
    return Intl.message(
      'Problem Description',
      name: 'TaskDetails_Description_ProblemDescription',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get TaskDetails_Description_Description {
    return Intl.message(
      'Description',
      name: 'TaskDetails_Description_Description',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get TaskDetails_Description_Attachments {
    return Intl.message(
      'Attachments',
      name: 'TaskDetails_Description_Attachments',
      desc: '',
      args: [],
    );
  }

  /// `Location `
  String get TaskDetails_Location {
    return Intl.message(
      'Location ',
      name: 'TaskDetails_Location',
      desc: '',
      args: [],
    );
  }

  /// `Location/Zone`
  String get TaskDetails_Location_LocationZone {
    return Intl.message(
      'Location/Zone',
      name: 'TaskDetails_Location_LocationZone',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get TaskDetails_Location_Building {
    return Intl.message(
      'Building',
      name: 'TaskDetails_Location_Building',
      desc: '',
      args: [],
    );
  }

  /// `Floors`
  String get TaskDetails_Location_Floors {
    return Intl.message(
      'Floors',
      name: 'TaskDetails_Location_Floors',
      desc: '',
      args: [],
    );
  }

  /// `Units`
  String get TaskDetails_Location_Units {
    return Intl.message(
      'Units',
      name: 'TaskDetails_Location_Units',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get TaskDetails_Location_Rooms {
    return Intl.message(
      'Rooms',
      name: 'TaskDetails_Location_Rooms',
      desc: '',
      args: [],
    );
  }

  /// `Spare Parts `
  String get TaskDetails_SpareParts {
    return Intl.message(
      'Spare Parts ',
      name: 'TaskDetails_SpareParts',
      desc: '',
      args: [],
    );
  }

  /// `Add Request`
  String get AddRequest {
    return Intl.message(
      'Add Request',
      name: 'AddRequest',
      desc: '',
      args: [],
    );
  }

  /// `Affected User`
  String get AddRequest_AffectedUser {
    return Intl.message(
      'Affected User',
      name: 'AddRequest_AffectedUser',
      desc: '',
      args: [],
    );
  }

  /// `Location/Zone`
  String get AddRequest_LocationZone {
    return Intl.message(
      'Location/Zone',
      name: 'AddRequest_LocationZone',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get AddRequest_Building {
    return Intl.message(
      'Building',
      name: 'AddRequest_Building',
      desc: '',
      args: [],
    );
  }

  /// `Units`
  String get AddRequest_Building_Units {
    return Intl.message(
      'Units',
      name: 'AddRequest_Building_Units',
      desc: '',
      args: [],
    );
  }

  /// `Floors`
  String get AddRequest_Building_Floors {
    return Intl.message(
      'Floors',
      name: 'AddRequest_Building_Floors',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get AddRequest_Building_Rooms {
    return Intl.message(
      'Rooms',
      name: 'AddRequest_Building_Rooms',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get AddRequest_Assets {
    return Intl.message(
      'Assets',
      name: 'AddRequest_Assets',
      desc: '',
      args: [],
    );
  }

  /// `Classify`
  String get AddRequest_Classify {
    return Intl.message(
      'Classify',
      name: 'AddRequest_Classify',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get AddRequest_Classify_Summary {
    return Intl.message(
      'Summary',
      name: 'AddRequest_Classify_Summary',
      desc: '',
      args: [],
    );
  }

  /// `Request Description`
  String get AddRequest_RequestDescription {
    return Intl.message(
      'Request Description',
      name: 'AddRequest_RequestDescription',
      desc: '',
      args: [],
    );
  }

  /// `Write your description here ...`
  String get AddRequest_DescriptionHint {
    return Intl.message(
      'Write your description here ...',
      name: 'AddRequest_DescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get AddRequest_attachment {
    return Intl.message(
      'Attachment',
      name: 'AddRequest_attachment',
      desc: '',
      args: [],
    );
  }

  /// `Add photos`
  String get AddRequest_attachment_AddPhotos {
    return Intl.message(
      'Add photos',
      name: 'AddRequest_attachment_AddPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Add video`
  String get AddRequest_attachment_AddVideo {
    return Intl.message(
      'Add video',
      name: 'AddRequest_attachment_AddVideo',
      desc: '',
      args: [],
    );
  }

  /// `Voice Record`
  String get AddRequest_attachment_VoiceRecord {
    return Intl.message(
      'Voice Record',
      name: 'AddRequest_attachment_VoiceRecord',
      desc: '',
      args: [],
    );
  }

  /// `Recording`
  String get AddRequest_attachment_VoiceRecord_recording {
    return Intl.message(
      'Recording',
      name: 'AddRequest_attachment_VoiceRecord_recording',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get AddRequest_attachment_Documents {
    return Intl.message(
      'Documents',
      name: 'AddRequest_attachment_Documents',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get AddRequest_SubmitButton {
    return Intl.message(
      'Submit',
      name: 'AddRequest_SubmitButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
