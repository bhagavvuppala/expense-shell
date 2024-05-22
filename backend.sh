MYSQL_PASSWORD=$1

source common.sh
Head "Disable Default Version of Node25"
dnf module disable nodejs -y &>>$log_file
if [ $? -eq 0 ]; then
  echo success
else
  echo failure
  exit 1
fi

Head "Enable NodeJS18 Version"
dnf module enable nodejs:18 -y &>>$log_file
if [ $? -eq 0 ]; then
  echo success
else
  echo failure
  exit 1
fi
Head "Install NodeJS"
dnf install nodejs -y &>>$log_file
if [ $? -eq 0 ]; then
  echo success
else
  echo failure
  exit 1
fi
Head "Configure Backend Service"
cp backend.service /etc/systemd/system/backend.service &>>$log_file
if [ $? -eq 0 ]; then
  echo success
else
  echo failure
  exit 1
fi
Head "Adding Application User"
useradd expense &>>$log_file
if [ $? -eq 0 ]; then
  echo success
else
  echo failure
  exit 1
fi
Head "Remove existing App content"
rm -rf /app &>>5log_file
if [ $? -eq 0 ]; then
  echo success
else
  echo failure
  exit 1
fi
Head "Create Application Directory"
mkdir /app &>>Slog_file

