@echo off
::��ȡ��ǰ���ں�ʱ��
set cur_date=%date%
set cur_time=%time%
::�������е�'/'�滻Ϊ'-'(���� %str:from=to%,strΪԭ�ַ���,fromΪ�滻ǰ���ַ�,toΪ�滻����ַ�)
set format_date=%cur_date:/=-%
::�Ⱥ�ʱ���е�':'��'.'ȥ��
set format_time=%cur_time::=%
set format_time=%format_time:.=%
::���ý����ļ���
set pic_name=screenshot-%format_date%-%format_time%

::��ȡ��ǰĿ¼
set root_path=%~dp0
::����screenshot�ļ���·��
set screenshot_path=%root_path%screenshot\
::���screenshot�ļ��в������򴴽�
if not exist %screenshot_path% (			
	md %screenshot_path%
)

set adb=%~dp0\tools\adb\adb

echo ********************************************** �豸��Ϣ **********************************************
%adb% devices
echo ******************************* ���������������Ŀ¼��screenshot�ļ��� *******************************
pause>nul
echo,
echo ���������У����Ժ�...
::�������浽�ֻ�
%adb% shell screencap -p /storage/emulated/0/%pic_name%.png
::����ͼ�����screenshot�ļ���
%adb% pull /storage/emulated/0/%pic_name%.png %screenshot_path%
::ɾ���ֻ��ϵĽ�ͼ�ļ�
adb shell rm /storage/emulated/0/%pic_name%.png
echo,
pause