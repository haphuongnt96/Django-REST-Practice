
[System.Environment]::SetEnvironmentVariable('DATABASE_NAME', "approval", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_USER', "dev_user", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_PASSWORD', "devdev", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_HOST', "localhost", "User")
[System.Environment]::SetEnvironmentVariable('DATABASE_PORT', "5432", "User")

[Environment]::GetEnvironmentVariables("User")

pause

