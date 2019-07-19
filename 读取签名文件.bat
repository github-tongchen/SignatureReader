@echo off
title 读取签名文件信息   Powered by TongChen
::改变颜色
color 8F
echo,
echo ********* 本工具仅支持后缀名为.jks和.keystore的签名文件 和 APK文件 *********
echo,
echo *********************** 拖放文件到窗口后按回车键继续 ***********************
echo,
echo ****************************************************************************
echo,
set/p file=请拖放文件到窗口：

for %%i in (%file%) do (
	::获取文件名
    set "file_name=%%~ni"
	::获取文件后缀名
	set suffix_name=%%~xi
)
::获取当前目录
set root_path=%~dp0
::设置output文件夹路径
set output_path=%root_path%output\
::如果output文件夹不存在则创建
if not exist %output_path% (			
	md %output_path%
)

set keytool=%root_path%\tools\keytool.exe
::设置notepad++路径
set notepad=%root_path%\tools\notepad++\notepad++.exe
::设置7z的命令行程序路径
set Sz=%root_path%\tools\7-Zip\7z.exe  


::根据文件后缀名做不同的处理
if ".apk" equ "%suffix_name%" (
	::读apk签名
	goto apk_file	
) else (
	if ".jks" equ "%suffix_name%" (
		::读签名文件
		goto signature_file		
	) else (
		if ".keystore" equ "%suffix_name%" (
			::读签名文件
			goto signature_file	
		) else (
			::不支持的文件类型
			goto unsupport_file
		)
	)
)


:apk_file
::设置7z解压提取文件保存路径
set Exclude_path=%output_path%
::CERT.RSA在apk中的完整路径
set CertRsa_File=META-INF\CERT.RSA
::提取CERT.RSA文件到指定路径
%Sz% x %file% -o%Exclude_path% %CertRsa_File% -aoa
::设置apk签名信息输出文件的文件名结尾部分
set apk_sign_output_label=_apk
::拼接整个apk签名信息输出文件的完整文件名
set output_file=%output_path%%file_name%%apk_sign_output_label%
::读取APK签名信息并输出到指定文件
%keytool% -printcert -file %Exclude_path%%CertRsa_File% >%output_file%.txt
echo,
echo --------- APK签名信息读取完成并保存到output目录下与APK文件同名且以“_apk.txt”结尾的文件中 ---------
goto open_file

:signature_file
::设置签名文件信息输出文件的文件名结尾部分
set sign_output_label=_sign
::拼接整个apk签名信息输出文件的完整路径
set output_file=%output_path%%file_name%%sign_output_label%
::读取签名文件信息并输出到指定文件
%keytool% -list -v -keystore %file% >%output_file%.txt
echo,
echo --------- 签名文件信息读取完成并保存到output目录下与签名文件同名且以“_sign.txt”结尾的文件中 ---------
goto open_file

:unsupport_file
echo,
echo *********************** 文件格式不支持，请确认文件后重试。 ***********************
goto end


:open_file
::打开保存签名信息的文件
start %notepad% %output_file%.txt
echo,
echo --------------- 已自动打开本次保存签名信息的文件 ---------------
goto end


:end
echo,
echo ********************************** 按任意键退出 **********************************
echo,
pause