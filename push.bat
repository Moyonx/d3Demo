@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 提示用户输入提交信息
set /p commitMessage=请输入提交信息: 

:: 检查是否输入了提交信息
if "%commitMessage%"=="" (
    echo 提交信息不能为空！
    exit /b 1
)

:: 添加所有文件到 Git
git add .

:: 提交更改
git commit -m "%commitMessage%"

:: 获取当前分支名称
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set currentBranch=%%i

:: 推送到当前分支对应的远程分支
git push origin %currentBranch%

echo 提交并推送完成！
pause