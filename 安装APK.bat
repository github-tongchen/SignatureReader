@echo off
title ��װAPK   Powered by TongChen
::�ı���ɫ
color 8F
echo,
echo ************************************ �Ϸ��ļ������ں󰴻س������� ************************************
echo,
echo ******************************************************************************************************
echo,

:verify_file 
echo,
set/p file=���Ϸ�APK�����ڣ�
for %%i in (%file%) do (
	set suffix_name=%%~xi
)
if ".apk" equ "%suffix_name%" (
	::��ǩ���ļ�
	goto install_apk	
) else (
	::��֧�ֵ��ļ�����
	goto unsupport_file
)

:install_apk
set adb=%~dp0\tools\adb\adb
%adb% install %file% 
goto end

:unsupport_file
echo,
echo ************************************ �ļ���ʽ��֧�֣���ȷ�Ϻ����� ************************************
goto end

:end 
echo,
echo *************************************** ����APK ������װ��һ�� ***************************************
goto verify_file