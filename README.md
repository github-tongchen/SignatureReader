# SignatureReader
windows平台读取签名信息，支持“.apk”、“.jks” 和 “.keystore” 文件。

#### 2019-08-28 添加转换字符串文本到SHA256文本。

#### 2019-07-23 添加安装APK的脚本。

#### 2019-07-24 添加截屏并保存到PC脚本。

    
## 本工具仅支持APK文件和 jks\keystore后缀名的签名文件

### 使用方式：

双击【读取签名文件.bat】，拖入apk或拖入签名文件并输入密码，签名的相关信息就会输出到本工具目录下 **output** 文件夹下 **文件名_文件类型.txt** 的文件中，
并自动使用附带的notepad++打开。

**如：**
需要读取签名信息的文件是“AMD_YES.apk”，那么就会在 **output** 文件夹下生成一个名为“AMD_YES_apk.txt”的文件用来记录读取到的签名信息。
需要读取签名信息的文件是“INTEL_NO.jks”或“INTEL_NO.keystore”，那么就会在 **output** 文件夹下生成一个名为“INTEL_NO_sign.txt”的文件用来记录读取到的签名信息。




## 说明：

### 本工具已添加keytool，不再需要配置JDK环境变量

### 如果报keytool的错误，请先正确配置JDK环境变量(Deprecated)

可以使用【配置JDK系统环境变量.bat】进行快速配置，使用本批处理前提是你的jdk和jre路径是默认的层级关系，最好是默认安装路径。使用方式：

1.以文本形式打开该文件，修改 JAVA_HOME 的“VariableValue”值为你的JDK路径，如 C:\Program Files\Java\jdk1.8.0_201\

2.备份你的环境变量中“Path”的值，这一步主要是避免出现意外导致丢失系统的环境变量。

3.保存第1步的修改，以管理员身份运行【配置JDK系统环境变量.bat】即可。
