@echo off
title 转换SHA256   Powered by TongChen
::改变颜色
color 8F
echo,
echo ************************************ 拖放文件到窗口后按回车键继续 ************************************
echo,
echo ******************************************************************************************************
echo,

:verify_file 
echo,
set/p input_file=拖放要转换的文件到窗口：
for %%i in (%input_file%) do (
	::获取文件名
    set input_file_name=%%~ni
	::获取文件后缀名
	set suffix_name=%%~xi
)
if ".txt" equ "%suffix_name%" (
	::转换文件
	goto transformData	
) else (
	::不支持的文件类型
	goto unsupport_file
)

:transformData
::获取当前目录
set root_path=%~dp0
::设置output文件夹路径
set output_path=%root_path%output\sha256\
::如果output文件夹不存在则创建
if not exist %output_path% (			
	md %output_path%
)

java -jar %root_path%tools\GenerateSha256.jar %input_file% %output_path%%input_file_name%_Convert.txt
goto end

:unsupport_file
echo,
echo ************************************ 文件格式不支持，请确认后重试 ************************************
goto end

:end 
echo,
echo *********************** 转换完成，输出文件名为 "%input_file_name%_convert.txt" ***********************
goto verify_file