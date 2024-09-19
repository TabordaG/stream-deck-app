pushd android
flutter build apk
./gradlew app:assembleDebugAndroidTest
./gradlew app:assembleDebug -Ptarget="integration_test/app_test.dart"
popd