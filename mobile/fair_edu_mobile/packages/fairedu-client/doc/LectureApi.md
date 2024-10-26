# openapi.api.LectureApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getLecturesForCourse**](LectureApi.md#getlecturesforcourse) | **GET** /lectures/{course_id} | Get lectures for a course
[**getQuizForLecture**](LectureApi.md#getquizforlecture) | **GET** /test/{lecture_id} | Get quiz for a lecture


# **getLecturesForCourse**
> List<GetLecturesForCourse200ResponseInner> getLecturesForCourse(courseId)

Get lectures for a course

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = LectureApi();
final courseId = courseId_example; // String | 

try {
    final result = api_instance.getLecturesForCourse(courseId);
    print(result);
} catch (e) {
    print('Exception when calling LectureApi->getLecturesForCourse: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 

### Return type

[**List<GetLecturesForCourse200ResponseInner>**](GetLecturesForCourse200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQuizForLecture**
> List<GetQuizForLecture200ResponseInner> getQuizForLecture(lectureId)

Get quiz for a lecture

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = LectureApi();
final lectureId = lectureId_example; // String | 

try {
    final result = api_instance.getQuizForLecture(lectureId);
    print(result);
} catch (e) {
    print('Exception when calling LectureApi->getQuizForLecture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **String**|  | 

### Return type

[**List<GetQuizForLecture200ResponseInner>**](GetQuizForLecture200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

