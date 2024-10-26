enum ApiExceptionCode {
  unexpected('不明なエラーが発生しました。'),
  inMaintenance('メンテナンス中です。'),
  invalidRequest('不正なリクエストです。'),
  unauthorized('認証に失敗しました。'),
  forbidden('アクセスが拒否されました。'),
  tooManyRequests('リクエスト回数が多すぎるため、時間を空けて再度お試しください。'),
  notFound('このデータはすでに削除されている可能性があります。'),
  ;

  const ApiExceptionCode(this.message);

  final String message;
}

enum AuthExceptionCode {
  invalidEmail('メールアドレスの形式が不正です'),
  invalidUserToken('不正なユーザートークンです'),
  wrongPassword('パスワードが間違っています'),
  userNotFound('ユーザーが見つかりません'),
  weakPassword('パスワードは6文字以上で入力してください'),
  userDisabled('ユーザーが無効です'),
  emailAlreadyInUse('このメールアドレスは既に登録されています'),
  operationNotAllowed('この操作は許可されていません'),
  invalidCredential('不正な認証情報です'),
  invalidVerificationCode('不正な認証コードです'),
  invalidVerificationId('不正な認証IDです'),
  invalidPhoneNumber('不正な電話番号です'),
  requiresRecentLogin('この操作をするためには再度ログインが必要です'),
  tooManyRequests('リクエスト回数が多すぎるため、時間を空けて再度お試しください'),
  invalidActionCode('不正な認証コードです。もう一度メールを確認するか、メールを再発行してください'),
  secondFactorNotEnrolled('2段階認証が登録されていません'),
  secondFactorEnrollFailed('ワンタイムパスワードを確認してください'),
  secondFactorRequired('2段階認証が必要です'),
  secondFactorAlreadyEnrolled('この方法での2段階認証は既に登録されています'),
  secondFactorResolveSignInFailed('ワンタイムパスワードを確認してください'),
  invalidResponse('認証に失敗しました'),
  canceled('認証がキャンセルされました'),
  notHandled('認証情報が処理されませんでした'),
  notInteractive('認証に失敗しました'),
  failed('認証に失敗しました'),
  unknown('不明なエラーです'),
  ;

  const AuthExceptionCode(this.message);

  final String message;
}

enum RepositoryExceptionCode {
  noNetworkConnection('ネットワークに接続されていません。接続を確認してください。'),
  unsupportedFileExtension('サポートされていないファイル形式です'),
  noFilePicked('ファイルが選択されていません'),
  pickFileFailed('ファイルの選択に失敗しました'),
  uploadFileFailed('ファイルのアップロードに失敗しました'),
  unknown('不明なエラーが発生しました'),
  ;

  const RepositoryExceptionCode(this.message);

  final String message;
}

enum UseCaseExceptionCode {
  fileNotFound('ファイルが見つかりません'),
  permissionGalleryDenied('ギャラリーへのアクセスが許可されていません。設定アプリからアクセスを許可してください。'),
  permissionCameraDenied('カメラへのアクセスが許可されていません。設定アプリからアクセスを許可してください。'),
  unknown('不明なエラーが発生しました'),
  ;

  const UseCaseExceptionCode(this.message);

  final String message;
}
