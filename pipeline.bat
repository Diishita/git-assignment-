pipeline{
agent any
//Specify the schedule using cron syntax
triggers{
cron('08***')//Runs every day at 8:00 AM
}
stages{
stage('Checkout Code'){
steps{
//Pull code from GitHub repository
git branch: 'master',
url:'https://github.com/Diishita/git-assignment-.git'
}
}
stage('Compile Java Code'){
steps{
sh 'javac $(find.-name"*.java")'
}
}
}
post{
failure{
echo'Pipeline failed'
}
success{
echo 'Pipeline succeeded'
}
}
}