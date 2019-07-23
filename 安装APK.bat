@echo off
title 安装APK   Powered by TongChen
::改变颜色
color 8F
echo,
echo ************************************ 拖放文件到窗口后按回车键继续 ************************************
echo,
echo ******************************************************************************************************
echo,

:verify_file 
echo,
set/p file=请拖放APK到窗口：
for %%i in (%file%) do (
	set suffix_name=%%~xi
)
if ".apk" equ "%suffix_name%" (
	::读签名文件
	goto install_apk	
) else (
	::不支持的文件类型
	goto unsupport_file
)

:install_apk
set adb=%~dp0\tools\adb\adb
%adb% install %file% 
goto end

:unsupport_file
echo,
echo ************************************ 文件格式不支持，请确认后重试 ************************************
goto end

:end 
echo,
echo *************************************** 拖入APK 继续安装下一个 ***************************************
goto verify_file