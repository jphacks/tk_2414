# openapi.api.UserAuthenticationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginUser**](UserAuthenticationApi.md#loginuser) | **POST** /login | User login with email and password
[**signupUser**](UserAuthenticationApi.md#signupuser) | **POST** /signup | User signup with email and password


# **loginUser**
> LoginUser200Response loginUser(loginUserRequest)

User login with email and password

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserAuthenticationApi();
final loginUserRequest = LoginUserRequest(); // LoginUserRequest | User login information

try {
    final result = api_instance.loginUser(loginUserRequest);
    print(result);
} catch (e) {
    print('Exception when calling UserAuthenticationApi->loginUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginUserRequest** | [**LoginUserRequest**](LoginUserRequest.md)| User login information | 

### Return type

[**LoginUser200Response**](LoginUser200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **signupUser**
> signupUser(signupUserRequest)

User signup with email and password

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserAuthenticationApi();
final signupUserRequest = SignupUserRequest(); // SignupUserRequest | User signup information

try {
    api_instance.signupUser(signupUserRequest);
} catch (e) {
    print('Exception when calling UserAuthenticationApi->signupUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signupUserRequest** | [**SignupUserRequest**](SignupUserRequest.md)| User signup information | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

