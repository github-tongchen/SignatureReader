@echo off
echo ���س�����ʼ����JAVA��������
pause
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="C:\Program Files\Java\jdk1.8.0_201\"
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\tools.jar" 
wmic ENVIRONMENT where "name='PATH' and username='<system>'" set VariableValue="%path%;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;" 
echo ���������������
pause