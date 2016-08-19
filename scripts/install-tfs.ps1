cd c:\windows\temp\packer-artifacts

$targetDir = "C:\TFS"
.\en_team_foundation_server_15_rc1_x64_web_installer_9133459.exe /S /Full /NoRestart /CustomInstallPath $targetDir
Start-Sleep -s 600
# TODO find a better way to block for this to finish

. "$targetDir\Tools\TfsConfig.exe" unattend /configure /unattendfile:basic.ini /continue
