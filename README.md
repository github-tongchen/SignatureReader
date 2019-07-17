# SignatureReader
windows平台读取签名信息，支持“.apk”、“.jks” 和 “.keystore” 文件。

    
## 本工具仅支持APK文件和 jks\keystore后缀名的签名文件

### 使用方式：

双击【读取签名文件.bat】，拖入apk或拖入签名文件并输入密码，签名的相关信息就会输出到本批处理文件根目录下【output】文件夹中与签名文件相似的txt中并自动使用附带的notepad++打开。



## 说明：

### 本工具已添加keytool，不再需要配置JDK环境变量

### 如果报keytool的错误，请先正确配置JDK环境变量(Deprecated)

可以使用【配置JDK系统环境变量.bat】进行快速配置，使用本批处理前提是你的jdk和jre路径是默认的层级关系，最好是默认安装路径。使用方式：

1.以文本形式打开该文件，修改 JAVA_HOME 的“VariableValue”值为你的JDK路径，如 C:\Program Files\Java\jdk1.8.0_201\

2.备份你的环境变量中“Path”的值，这一步主要是避免出现意外导致丢失系统的环境变量。

3.保存第1步的修改，以管理员身份运行【配置JDK系统环境变量.bat】即可。
