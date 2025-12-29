# VSCode Binder

将 Visual Studio Code 设置为所有支持文件类型的默认编辑器。

## 功能

自动读取 VSCode 的 `Info.plist` 文件，提取所有支持的文件扩展名，并将它们关联到 VSCode，使你打开任何代码文件时都默认使用 VSCode。

## 要求

- macOS
- Visual Studio Code
- `plutil` (macOS 自带)
- `duti` - 用于修改文件关联

### 安装 duti

```bash
brew install duti
```

## 使用

1. 克隆或下载 `i.sh` 脚本
2. 给脚本添加执行权限：

```bash
chmod +x i.sh
```

3. 运行脚本：

```bash
./i.sh
```

## 工作原理

1. 从 VSCode 的 `Info.plist` 中提取 `CFBundleTypeExtensions`
2. 使用 `duti` 将每个扩展名关联到 Visual Studio Code
3. 完成后显示统计信息

## 注意事项

- 脚本默认使用 Visual Studio Code 的标准 Bundle ID: `com.microsoft.VSCode`
- 如果你使用的是 VSCode 的其他版本（如 Insiders），请修改 `BUNDLE_ID` 变量

## 授权

MIT License
