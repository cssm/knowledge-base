we can add binary dependency by using `.binaryTarget` it can be local (using path) or remote using url and checksum (to verify that it's the same file))

`XCFramework` or Binary frameword

Framework generally contains different architectures in a single binary file. Which is called Fat / Universal binary. However in XCFramework we have **different binary files for different architectures**.

[Convert a Universal (FAT) Framework to an XCFramework](https://medium.com/strava-engineering/convert-a-universal-fat-framework-to-an-xcframework-39e33b7bd861)

[7 Кругов SPM или как сделать модульное приложение на Swift Package Manager](https://habr.com/ru/company/e-Legion/blog/549390/)

Write from here about linking `xcframework` to package

[darrarski/xcframework-maker: macOS utility for converting fat-frameworks to SPM-compatible XCFramework with arm64-simulator support](https://github.com/darrarski/xcframework-maker)

Как и в предыдущем случае, нужно собрать XCFramework. Для начала из fat фреймворка, который поставляется Pod-ом необходимо собрать 2 фреймворка — для симулятора и для девайса. После этого объединим их в универсальный фреймворк. Вот скрипт, который делает XCFramework из фремворка с архитектурами arm64 и x86_64. Узнать архитектуры, которые поддерживает фреймворк можно с помощью команды lipo -info pathtoframework.

[GitHub - darrarski/xcframework-maker: macOS utility for converting fat-frameworks to SPM-compatible XCFramework with arm64-simulator support](https://github.com/darrarski/xcframework-maker)

```swift
# Делаем 2 копии фреймворка для симулятора и устройства
cp -a YandexMapsMobile YandexMapsMobile_sim
cp -a YandexMapsMobile YandexMapsMobile_device
 
cd YandexMapsMobile_sim/YandexMapsMobile.framework/Versions/A
# Здесь мы выбираем какая архитектура нам нужна из fat фреймворка и выносим ее в отдельный фреймворк
lipo -thin x86_64 YandexMapsMobile -output YandexMapsMobile_x86_64
# Создание universal framework-a для симулятора
# Если вы хотите собрать не под одну архитектуру симулятора
# а под несколько (i386), для этого нужно будет сделать два раза thin
# и соединить их в create
lipo -create YandexMapsMobile_x86_64 -output YandexMapsMobile_sim
rm -rf YandexMapsMobile YandexMapsMobile_x86_64
mv YandexMapsMobile_sim YandexMapsMobile
cd ../../../..
 
# Просто дублирование кода, но сборка под девайс
cd YandexMapsMobile_device/YandexMapsMobile.framework/Versions/A
lipo -thin arm64 YandexMapsMobile -output YandexMapsMobile_arm64
lipo -create YandexMapsMobile_arm64 -output YandexMapsMobile_device
rm -rf YandexMapsMobile YandexMapsMobile_arm64
mv YandexMapsMobile_device YandexMapsMobile
cd ../../../..
 
# Объединяем в xcframework
xcodebuild -create-xcframework -framework YandexMapsMobile_sim/YandexMap
```



> binary frameworks cannot depend on [Swift Package Manager](Swift%20Package%20Manager.md)

```swift
xcrun lipo -i Carthage/Build/iOS/Foo.framework/Foo
```