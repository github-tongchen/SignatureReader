@echo off
::获取当前日期和时间
set cur_date=%date%
set cur_time=%time%
::将日期中的'/'替换为'-'(形如 %str:from=to%,str为原字符串,from为替换前的字符,to为替换后的字符)
set format_date=%cur_date:/=-%
::先后将时间中的':'和'.'去掉
set format_time=%cur_time::=%
set format_time=%format_time:.=%
::设置截屏文件名
set pic_name=screenshot-%format_date%-%format_time%

::获取当前目录
set root_path=%~dp0
::设置screenshot文件夹路径
set screenshot_path=%root_path%screenshot\
::如果screenshot文件夹不存在则创建
if not exist %screenshot_path% (			
	md %screenshot_path%
)

set adb=%~dp0\tools\adb\adb

echo ********************************************** 设备信息 **********************************************
%adb% devices
echo ******************************* 按任意键截屏到根目录下screenshot文件夹 *******************************
pause>nul
echo,
echo 截屏处理中，请稍候...
::截屏保存到手机
%adb% shell screencap -p /storage/emulated/0/%pic_name%.png
::将截图输出到screenshot文件夹
%adb% pull /storage/emulated/0/%pic_name%.png %screenshot_path%
::删除手机上的截图文件
adb shell rm /storage/emulated/0/%pic_name%.png
echo,
pause