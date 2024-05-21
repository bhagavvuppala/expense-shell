log_file=/tmp/expense.log

Head() {
  echo -e "\e[36m$1\e[0m"
}

Head "Install Nginx"
dnf install nginx -y &>>$log_file
echo $?

Head "copy expense confic file"
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
echo $?

Head "remove old content"
rm -rf /usr/share/nginx/html/* &>>$log_file
echo $?

Head "download application code"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>$log_file
echo $?

cd /usr/share/nginx/html
Head "extract application code"
unzip /tmp/frontend.zip &>>$log_file

Head "start nginx service"
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
echo $?