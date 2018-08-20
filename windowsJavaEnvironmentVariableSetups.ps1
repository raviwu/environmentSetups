$javaHome = [System.Environment]::GetEnvironmentVariable("JAVA_HOME","USER")

if ($javaHome.length -eq 0) {
    $javaHome = [System.Environment]::SetEnvironmentVariable("JAVA_HOME","C:\Program Files\Java\jdk1.8.0_172","USER")
}

$jdkHome = [System.Environment]::GetEnvironmentVariable("JDK_HOME","USER")

if ($jdkHome.length -eq 0) {
    $jdkHome = [System.Environment]::SetEnvironmentVariable("JDK_HOME",$javaHome,"USER")
}

$javaPath = [System.Environment]::GetEnvironmentVariable("JAVA_PATH","USER")

if ($javaPath.length -eq 0) {
    $javaPath = [System.Environment]::SetEnvironmentVariable("JAVA_PATH",$javaHome + "\bin","USER")
    $path = [System.Environment]::GetEnvironmentVariable("PATH","USER")
    $newPath = $javaPath + ";" + $path
    [System.Environment]::SetEnvironmentVariable("PATH",$newPath,"USER")
}

$mavenHome = [System.Environment]::GetEnvironmentVariable("MAVEN_HOME","USER")

if ($mavenHome.length -eq 0) {
    $mavenHome = [System.Environment]::SetEnvironmentVariable("MAVEN_HOME","your_path_to_maven_bin","USER")
}

$mavenPath = [System.Environment]::GetEnvironmentVariable("MAVEN_PATH","USER")

if ($mavenPath.length -eq 0) {
    $mavenPath = [System.Environment]::SetEnvironmentVariable("MAVEN_PATH",$mavenHome,"USER")
    $path = [System.Environment]::GetEnvironmentVariable("PATH","USER")
    $newPath = $mavenPath + ";" + $path
    [System.Environment]::SetEnvironmentVariable("PATH",$newPath,"USER")
}
