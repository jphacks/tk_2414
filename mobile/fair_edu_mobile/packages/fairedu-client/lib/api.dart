//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/chat_api.dart';
part 'api/course_api.dart';
part 'api/lecture_api.dart';
part 'api/lecture_structure_api.dart';
part 'api/material_api.dart';
part 'api/progress_management_api.dart';
part 'api/user_authentication_api.dart';

part 'model/display_ongoing_progress200_response_inner.dart';
part 'model/get_chats_by_user_id_and_lecture_id200_response_inner.dart';
part 'model/get_chats_by_user_id_and_lecture_id200_response_inner_messages_inner.dart';
part 'model/get_courses_by_status200_response_inner.dart';
part 'model/get_lecture_structure200_response_inner.dart';
part 'model/get_lectures_for_course200_response_inner.dart';
part 'model/get_materials_for_lecture200_response_inner.dart';
part 'model/get_messages_by_chat_id200_response_inner.dart';
part 'model/get_monthly_learning_volume200_response.dart';
part 'model/get_monthly_learning_volume200_response_details_inner.dart';
part 'model/get_quiz_for_lecture200_response_inner.dart';
part 'model/get_quiz_for_lecture200_response_inner_choices_inner.dart';
part 'model/login_user200_response.dart';
part 'model/login_user_request.dart';
part 'model/process_message200_response.dart';
part 'model/process_message200_response_user_message.dart';
part 'model/process_message_request.dart';
part 'model/register_progress_request.dart';
part 'model/save_material_request_inner.dart';
part 'model/signup_user_request.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
