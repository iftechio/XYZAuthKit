# XYZAuth SDK

XYZAuth 为您的 iOS 应用提供集成 "小宇宙" 应用三方登录授权的能力。

## 系统要求

- **iOS 15 或更高版本**
- **小宇宙 App 最低支持版本 2.80.1**

## 集成方式

### Swift Package Manager

要使用 [Swift Package Manager](https://swift.org/package-manager/) 进行集成，请在项目 `Package.swift` 或 Xcode Package list 中添加以下依赖：

```swift
dependencies: [
    .package(url: "https://github.com/iftechio/XYZAuthKit.git", .upToNextMajor(from: "1.0.0"))
]
```

### CocoaPods

要使用 [CocoaPods](http://cocoapods.org) 进行集成，请在项目的 `Podfile` 中添加依赖:

```ruby
pod 'XYZAuthKit'
```

## 使用指南

### 1. 注册应用

请联系小宇宙团队，注册你 App 的 redirectUri，并获取 clientId.

### 2. 配置 Info.plist

在项目的 `Info.plist` 文件中添加以下键值，获得跳转小宇宙 App 的能力：

```
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>xyzauthsdk</string>
</array>
```

### 3. 初始化 SDK

在发起授权前需要使用 `XYZAuth.registerApp` 初始化 SDK，传入第一步注册时使用的 `redirectUri` 和获取到的 `clientId `。示例：

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    XYZAuth.registerApp("client_id", redirectUri: "yourapp://callback")
    return true
}
```

**注意：错误的 clientId 和 redirectUri 将无法成功授权**

### 4. 处理 URL 回调

在 `AppDelegate` 或 `SceneDelegate` 中实现 URL 处理方法，以允许 XYZAuth 处理授权结果信息。

#### 如你的 redirectUri 是 scheme

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    return XYZAuth.handleOpen(url)
}
```

#### 如你的 redirectUri 是 universal link:

```swift
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    _ = XYZAuth.handleUniversalLink(userActivity)
}
```

### 5. 发起授权

调用 `XYZAuth.authorize` 发起授权流程：

```swift
XYZAuth.authorize { result in
    switch result {
    case let .success(code):
        print("授权成功。授权码：\(code)")
    case let .failure(error):
        print("授权失败。错误信息：\(error.localizedDescription)")
    }
}
```

请将获取到的授权码发送到你的业务服务器，业务服务器使用授权码交换令牌并进行后续的数据获取。

### 6. 检查小宇宙应用是否已安装

可以使用以下代码检查小宇宙应用是否已安装或满足最低支持版本：

```swift
XYZAuth.isAppInstalled()
```

## 许可协议

XYZAuth 在 MIT 许可协议下提供。有关详细信息，请参阅 [LICENSE](LICENSE) 文件。
