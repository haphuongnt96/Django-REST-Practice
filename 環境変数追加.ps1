
[System.Environment]::SetEnvironmentVariable('DATABASE_HOST', "localhost", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_NAME', "approval_dev", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_PASSWORD', "approval", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_PORT', "5432", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_USER', "approval_user", "User")

[Environment]::GetEnvironmentVariables("User")

pause

