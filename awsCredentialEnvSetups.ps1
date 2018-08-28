# https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html

$awsAccessKeyId = [System.Environment]::GetEnvironmentVariable("AWS_ACCESS_KEY_ID", "USER")

if ($awsAccessKeyId.length -eq 0) {
    $awsAccessKeyId = [System.Environment]::SetEnvironmentVariable("AWS_ACCESS_KEY_ID", "YourKey", "USER")
}

$awsAccessKeySecret = [System.Environment]::GetEnvironmentVariable("AWS_SECRET_ACCESS_KEY", "USER")

if ($awsAccessKeySecret.length -eq 0) {
    $awsAccessKeySecret = [System.Environment]::SetEnvironmentVariable("AWS_SECRET_ACCESS_KEY", "YourSecret", "USER")
}

$awsRegion = [System.Environment]::GetEnvironmentVariable("AWS_REGION", "USER")

if ($awsRegion.length -eq 0) {
    $awsRegion = [System.Environment]::SetEnvironmentVariable("AWS_REGION", "us-east-1", "USER")
}
