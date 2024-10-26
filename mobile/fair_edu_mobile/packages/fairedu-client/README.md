# openapi
統合されたAPI仕様書で、講義構造、進捗管理、チャット、教材管理、講義、コース、ユーザー認証に関する機能を提供します。


This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- Generator version: 7.9.0
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/api.dart';


final api_instance = ChatApi();
final userId = userId_example; // String | 
final lectureId = lectureId_example; // String | 

try {
    final result = api_instance.getChatsByUserIDAndLectureID(userId, lectureId);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->getChatsByUserIDAndLectureID: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ChatApi* | [**getChatsByUserIDAndLectureID**](doc//ChatApi.md#getchatsbyuseridandlectureid) | **GET** /chats/{user_id}/{lecture_id} | Get chat IDs by user ID and lecture ID
*ChatApi* | [**getMessagesByChatID**](doc//ChatApi.md#getmessagesbychatid) | **GET** /messages/chat/{chat_id} | Get chat messages
*ChatApi* | [**processMessage**](doc//ChatApi.md#processmessage) | **POST** /message/{lecture_id}/{user_id} | Send a chat message
*CourseApi* | [**getCoursesByStatus**](doc//CourseApi.md#getcoursesbystatus) | **GET** /course/{user_id}/{status} | Get courses based on status (all, taking, finished)
*LectureApi* | [**getLecturesForCourse**](doc//LectureApi.md#getlecturesforcourse) | **GET** /lectures/{course_id} | Get lectures for a course
*LectureApi* | [**getQuizForLecture**](doc//LectureApi.md#getquizforlecture) | **GET** /test/{lecture_id} | Get quiz for a lecture
*LectureStructureApi* | [**getLectureStructure**](doc//LectureStructureApi.md#getlecturestructure) | **GET** /structure/{lecture_id} | Get lecture structure
*MaterialApi* | [**getMaterialsForLecture**](doc//MaterialApi.md#getmaterialsforlecture) | **GET** /material/{lecture_id} | Get materials for lecture
*MaterialApi* | [**saveMaterial**](doc//MaterialApi.md#savematerial) | **POST** /material/{lecture_id}/{user_id} | Save material
*ProgressManagementApi* | [**displayOngoingProgress**](doc//ProgressManagementApi.md#displayongoingprogress) | **GET** /progress/{user_id} | Display progress for ongoing courses
*ProgressManagementApi* | [**getMonthlyLearningVolume**](doc//ProgressManagementApi.md#getmonthlylearningvolume) | **GET** /progress/{user_id}/{month} | Calculate and return the learning volume for the month
*ProgressManagementApi* | [**registerProgress**](doc//ProgressManagementApi.md#registerprogress) | **POST** /progress | Register progress for a lecture
*UserAuthenticationApi* | [**loginUser**](doc//UserAuthenticationApi.md#loginuser) | **POST** /login | User login with email and password
*UserAuthenticationApi* | [**signupUser**](doc//UserAuthenticationApi.md#signupuser) | **POST** /signup | User signup with email and password


## Documentation For Models

 - [DisplayOngoingProgress200ResponseInner](doc//DisplayOngoingProgress200ResponseInner.md)
 - [GetChatsByUserIDAndLectureID200ResponseInner](doc//GetChatsByUserIDAndLectureID200ResponseInner.md)
 - [GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner](doc//GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner.md)
 - [GetCoursesByStatus200ResponseInner](doc//GetCoursesByStatus200ResponseInner.md)
 - [GetLectureStructure200ResponseInner](doc//GetLectureStructure200ResponseInner.md)
 - [GetLecturesForCourse200ResponseInner](doc//GetLecturesForCourse200ResponseInner.md)
 - [GetMaterialsForLecture200ResponseInner](doc//GetMaterialsForLecture200ResponseInner.md)
 - [GetMessagesByChatID200ResponseInner](doc//GetMessagesByChatID200ResponseInner.md)
 - [GetMonthlyLearningVolume200Response](doc//GetMonthlyLearningVolume200Response.md)
 - [GetMonthlyLearningVolume200ResponseDetailsInner](doc//GetMonthlyLearningVolume200ResponseDetailsInner.md)
 - [GetQuizForLecture200ResponseInner](doc//GetQuizForLecture200ResponseInner.md)
 - [GetQuizForLecture200ResponseInnerChoicesInner](doc//GetQuizForLecture200ResponseInnerChoicesInner.md)
 - [LoginUser200Response](doc//LoginUser200Response.md)
 - [LoginUserRequest](doc//LoginUserRequest.md)
 - [ProcessMessage200Response](doc//ProcessMessage200Response.md)
 - [ProcessMessage200ResponseUserMessage](doc//ProcessMessage200ResponseUserMessage.md)
 - [ProcessMessageRequest](doc//ProcessMessageRequest.md)
 - [RegisterProgressRequest](doc//RegisterProgressRequest.md)
 - [SaveMaterialRequestInner](doc//SaveMaterialRequestInner.md)
 - [SignupUserRequest](doc//SignupUserRequest.md)


## Documentation For Authorization

Endpoints do not require authorization.


## Author


