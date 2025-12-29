#!/bin/bash

BUNDLE_ID="com.microsoft.VSCode"
PLIST_PATH="/Applications/Visual Studio Code.app/Contents/Info.plist"

# 1. 将 plist 转为 XML 字符串
# 2. 提取 <string> 标签内的内容
# 3. 过滤掉不符合后缀特征的字符串 (比如 Bundle ID 等)
echo "正在提取后缀..."

exts=$(plutil -convert xml1 -o - "$PLIST_PATH" | \
    xpath -e "//key[text()='CFBundleTypeExtensions']/following-sibling::array/string/text()" 2>/dev/null)

# 如果你的系统没有 xpath，可以用下面这个更通用的 grep 版本：
if [ -z "$exts" ]; then
    exts=$(plutil -convert xml1 -o - "$PLIST_PATH" | \
        grep -A 1 "<key>CFBundleTypeExtensions</key>" | \
        grep "<string>" | sed 's/.*<string>\(.*\)<\/string>.*/\1/')
fi

count=0
for ext in $exts; do
    echo "正在关联: .$ext"
    duti -s $BUNDLE_ID ".$ext" all
    ((count++))
done

echo "🎉 完成！共绑定了 $count 种格式。"