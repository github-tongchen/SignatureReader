@echo off
title ת��SHA256   Powered by TongChen
::�ı���ɫ
color 8F
echo,
echo ************************************ �Ϸ��ļ������ں󰴻س������� ************************************
echo,
echo ******************************************************************************************************
echo,

:verify_file 
echo,
set/p input_file=�Ϸ�Ҫת�����ļ������ڣ�
for %%i in (%input_file%) do (
	::��ȡ�ļ���
    set input_file_name=%%~ni
	::��ȡ�ļ���׺��
	set suffix_name=%%~xi
)
if ".txt" equ "%suffix_name%" (
	::ת���ļ�
	goto transformData	
) else (
	::��֧�ֵ��ļ�����
	goto unsupport_file
)

:transformData
::��ȡ��ǰĿ¼
set root_path=%~dp0
::����output�ļ���·��
set output_path=%root_path%output\sha256\
::���output�ļ��в������򴴽�
if not exist %output_path% (			
	md %output_path%
)

java -jar %root_path%tools\GenerateSha256.jar %input_file% %output_path%%input_file_name%_Convert.txt
goto end

:unsupport_file
echo,
echo ************************************ �ļ���ʽ��֧�֣���ȷ�Ϻ����� ************************************
goto end

:end 
echo,
echo *********************** ת����ɣ�����ļ���Ϊ "%input_file_name%_convert.txt" ***********************
goto verify_file