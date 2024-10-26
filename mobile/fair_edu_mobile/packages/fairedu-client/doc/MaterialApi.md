# openapi.api.MaterialApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMaterialsForLecture**](MaterialApi.md#getmaterialsforlecture) | **GET** /material/{lecture_id} | Get materials for lecture
[**saveMaterial**](MaterialApi.md#savematerial) | **POST** /material/{lecture_id}/{user_id} | Save material


# **getMaterialsForLecture**
> List<GetMaterialsForLecture200ResponseInner> getMaterialsForLecture(lectureId)

Get materials for lecture

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaterialApi();
final lectureId = lectureId_example; // String | 

try {
    final result = api_instance.getMaterialsForLecture(lectureId);
    print(result);
} catch (e) {
    print('Exception when calling MaterialApi->getMaterialsForLecture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **String**|  | 

### Return type

[**List<GetMaterialsForLecture200ResponseInner>**](GetMaterialsForLecture200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveMaterial**
> saveMaterial(lectureId, userId, saveMaterialRequestInner)

Save material

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaterialApi();
final lectureId = lectureId_example; // String | 
final userId = userId_example; // String | 
final saveMaterialRequestInner = [List<SaveMaterialRequestInner>()]; // List<SaveMaterialRequestInner> | 

try {
    api_instance.saveMaterial(lectureId, userId, saveMaterialRequestInner);
} catch (e) {
    print('Exception when calling MaterialApi->saveMaterial: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **String**|  | 
 **userId** | **String**|  | 
 **saveMaterialRequestInner** | [**List<SaveMaterialRequestInner>**](SaveMaterialRequestInner.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

