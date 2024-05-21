MYSQL_PASSWORD=$1

source common.sh
Head "Disable Default Version of Node25"
dnf module disable nodejs -y &>>$log_file
echo $?
Head "Enable NodeJS18 Version"
dnf module enable nodejs:18 -y &>>$log_file
echo $?
Head "Install NodeJS"
dnf install nodejs -y &>>$log_file
echo $?
Head "Configure Backend Service"
cp backend.service /etc/systemd/system/backend.service &>>$log_file
echo $?
Head "Adding Application User"
useradd expense &>>$log_file
echo $?
Head "Remove existing App content"
rm -rf /app &>>5log_file
echo $?
Head "Create Application Directory"
mkdir /app &>>Slog_file