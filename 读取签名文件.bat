@echo off
title ��ȡǩ���ļ���Ϣ   Powered by TongChen
::�ı���ɫ
color 8F
echo,
echo ********************** �����߽�֧�ֺ�׺��Ϊ.jks��.keystore��ǩ���ļ� �� APK�ļ� **********************
echo,
echo ************************************ �Ϸ��ļ������ں󰴻س������� ************************************
echo,
echo ******************************************************************************************************
echo,
set/p file=���Ϸ��ļ������ڣ�

for %%i in (%file%) do (
	::��ȡ�ļ���
    set file_name=%%~ni
	::��ȡ�ļ���׺��
	set suffix_name=%%~xi
)
::ȥ���ļ���������λ�õĿո�
set file_name=%file_name: =%
::��ȡ��ǰĿ¼
set root_path=%~dp0
::����output�ļ���·��
set output_path=%root_path%output\
::���output�ļ��в������򴴽�
if not exist %output_path% (			
	md %output_path%
)

set keytool=%root_path%tools\keytool.exe
::����notepad++·��
set notepad=%root_path%tools\notepad++\notepad++.exe
::����7z�������г���·��
set Sz=%root_path%tools\7-Zip\7z.exe


::�����ļ���׺������ͬ�Ĵ���
if ".apk" equ "%suffix_name%" (
	::��apkǩ��
	goto apk_file	
) else (
	if ".jks" equ "%suffix_name%" (
		::��ǩ���ļ�
		goto signature_file		
	) else (
		if ".keystore" equ "%suffix_name%" (
			::��ǩ���ļ�
			goto signature_file	
		) else (
			::��֧�ֵ��ļ�����
			goto unsupport_file
		)
	)
)


:apk_file
::����7z��ѹ��ȡ�ļ�����·��
set Exclude_path=%output_path%
::CERT.RSA��apk�е�����·��
set CertRsa_File=META-INF\CERT.RSA
::�Ƴ��ϴν�ѹ��.RSA�ļ�
if exist %Exclude_path%%CertRsa_File% (
	del /a/f/q %Exclude_path%%CertRsa_File%
)
::��ȡ*.RSA�ļ���ָ��·��(jks�����apk��RSA�ļ�������CERT.RSA,��keystore�ļ������apk��RSA�ļ����Ǳ仯��)
%Sz% x %file% -o%Exclude_path% META-INF\*.RSA -aoa
::��������ȡ����.RSA�ļ�ΪCERT.RSA
rename %Exclude_path%META-INF\*.RSA CERT.RSA
::����apkǩ����Ϣ����ļ����ļ�����β����
set apk_sign_output_label=_apk
::ƴ������apkǩ����Ϣ����ļ��������ļ���
set output_file=%file_name%%apk_sign_output_label%
::��ȡAPKǩ����Ϣ�������ָ���ļ�
%keytool% -printcert -file %Exclude_path%%CertRsa_File% >%output_path%%output_file%.txt
echo,
echo ************** APK ǩ����Ϣ��ȡ��ɲ����浽 output Ŀ¼�£��ļ���Ϊ "%output_file%.txt" **************
goto open_file

:signature_file
::����ǩ���ļ���Ϣ����ļ����ļ�����β����
set sign_output_label=_sign
::ƴ������apkǩ����Ϣ����ļ�������·��
set output_file=%file_name%%sign_output_label%
::��ȡǩ���ļ���Ϣ�������ָ���ļ�
%keytool% -list -v -keystore %file% >%output_path%%output_file%.txt
echo,
echo **************** ǩ����Ϣ��ȡ��ɲ����浽 output Ŀ¼�£��ļ���Ϊ "%output_file%.txt" ****************
goto open_file

:unsupport_file
echo,
echo ************************************ �ļ���ʽ��֧�֣���ȷ�Ϻ����� ************************************
goto end


:open_file
::�򿪱���ǩ����Ϣ���ļ�
start %notepad% %output_path%%output_file%.txt
echo,
echo ********************************** ���Զ��򿪱��α���ǩ����Ϣ���ļ� **********************************
goto end


:end
echo,
echo ******************************************** ��������˳� ********************************************
echo,
pause