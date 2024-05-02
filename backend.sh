dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -
useradd expense
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install
cp backened.service /etc/systemd/system/backend.service
systemctl daemon-reload
systemctl enable backend
systemctl restart backend
dnf install mysql -y
mysql -h 172.31.27.20 -uroot -pExpenseApp@1 < /app/schema/backend.sql