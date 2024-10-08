# Personal Portfolio Website

## Overview

This project is a personal portfolio website created using Django. It showcases various aspects of James Powell’s academic and professional career, including a chatbot feature powered by OpenAI. The site includes multiple sections such as:

- Home
- About Me
- Education
- Work Experience
- Research
- Mentoring and Leadership
- Awards
- Powell GPT (AI-Powered Chatbot)
- Gallery
- Contact Me

**Website Link:** [Personal Portfolio](http://3.148.107.118/)

### Sample Chatbot Usage

The chatbot can answer a wide range of questions about James Powell’s background. Here are some examples:

1. **Give me a brief summary of James in about 100 words:**

   - James Powell is a highly accomplished individual with a strong academic background in artificial intelligence. He has interned at Google and Facebook, worked at Apple and Tesla, and published research papers on quantum computing and AI ethics. His projects cover technologies like blockchain, quantum cryptography, and climate change modeling. He holds multiple certifications and has received awards in major hackathons. He continues to contribute to cutting-edge AI and technology innovations.

2. **Tell me about James’ work at Google in a paragraph:**

   - During his Google internship in 2023, James worked on developing back-end services, enhancing system scalability, and implementing APIs and microservices using Java, deployed on Kubernetes. His work resulted in a 20% performance improvement and a 15% reduction in bugs.

3. **How much did James score in his Azure certification course?**
   - James scored 920/1000 in his Microsoft Certified: Azure AI Engineer Associate certification.

---

## Cloning the Project and Setting Up Virtual Environment

1. Clone the repository:

   ```bash
   git clone <repository_url>
   ```

2. Create a virtual environment and activate it:

   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. Install the required dependencies:
   ```bash
    sudo apt-get install libmysqlclient-dev
    pip install django mysqlclient openai
    sudo apt update
    sudo apt install mysql-server
   ```

---

## Setting Up MySQL Database

Create Database

```bash
    sudo mysql_secure_installation
    sudo mysql -u root -p
    CREATE DATABASE IF NOT EXISTS personal_portfolio;
    EXIT;
    mysql -u root -p personal_portfolio < ./setup_database.sql
    USE personal_portfolio;
    SHOW TABLES;
    EXIT;
```

Create user

```bash
CREATE DATABASE personal_portfolio;
CREATE USER 'django-portfolio-user'@'localhost' IDENTIFIED BY 'django-portfolio-user-db-psswrd';
GRANT ALL PRIVILEGES ON personal_portfolio.* TO 'django-portfolio-user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

In your `settings.py`, update the `DATABASES` configuration to use MySQL:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'personal_portfolio',  # Your database name
        'USER': 'django-portfolio-user',  # MySQL username
        'PASSWORD': 'django-portfolio-user-db-psswrd',  # MySQL user password
        'HOST': 'localhost',  # Localhost since MySQL is running on the same server
        'PORT': '3306',
    }
}
```

## Setting Up Email

To set up email notifications, update the following configuration in your `settings.py`:

```python
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'your_email@gmail.com'
EMAIL_HOST_PASSWORD = 'your_email_password'
```

---

## Setting Up the AI-Powered Chatbot

You need to configure your OpenAI API key in your environment. Set the API key as an environment variable:

```bash
export OPENAI_API_KEY='your_openai_api_key'
```

Add the following to `settings.py`:

```python
OPENAI_API_KEY = os.getenv('OPENAI_API_KEY')
```

---

## Running Locally

To run the project locally on the development server:

```bash
python manage.py runserver
```

---

## Deploying on AWS EC2 with Nginx

```bash
ssh -i ./your_aws_key_pair.pem ubuntu@your-ec2-public-ip
sudo apt-get update
sudo apt-get install pkg-config
sudo apt-get install mysql-client
echo 'export PATH="/usr/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
sudo apt-get install python3-pip nginx
git clone https://github.com/Atishaysjain/django-portfolio-webapp.git
cd ./django-portfolio-webapp
sudo apt-get install python3-venv
python3 -m venv django_portfolio_venv
source ./django_portfolio_venv/bin/activate
sudo apt-get install libmysqlclient-dev
pip3 install django mysqlclient openai
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
sudo mysql
CREATE DATABASE personal_portfolio;
CREATE USER 'django-portfolio-user'@'localhost' IDENTIFIED BY 'django-portfolio-user-db-psswrd';
GRANT ALL PRIVILEGES ON personal_portfolio.* TO 'django-portfolio-user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
sudo mysql
sudo mysql_secure_installation
sudo mysql -u root -p
CREATE DATABASE IF NOT EXISTS personal_portfolio;
EXIT;
mysql -u root -p personal_portfolio < ./setup_database.sql
USE personal_portfolio;
SHOW TABLES;
EXIT;
openai_api_key = your_api_key
```

Update Django settings:
Set DEBUG = False in your `settings.py`.
Configure ALLOWED_HOSTS in `settings.py`:

```python
ALLOWED_HOSTS = ['your-ec2-public-ip']
```

Set up static and media file serving:

```python
STATIC_URL = '/static/'
STATIC_ROOT = '/home/ubuntu/django-portfolio-webapp/staticfiles/'
```

Collect static files:

```bash
python manage.py collectstatic
```

```bash
pip install gunicorn
sudo nano /etc/systemd/system/gunicorn.service
```

Copy paste the following content to gunicorn.service:

```bash
[Unit]
Description=gunicorn daemon
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/django-portfolio-webapp
ExecStart=/home/ubuntu/django-portfolio-webapp/django_portfolio_venv/bin/gunicorn --workers 3 --bind unix:/home/ubuntu/django-portfolio-webapp/gunicorn.sock portfolio_website.wsgi:application

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
```

```bash
sudo nano /etc/nginx/sites-available/portfolio_website
```

Copy paste the following content to portfolio_website:

```bash
server {
    listen 80;
    server_name your-ec2-public-ip;
    location / {
        proxy_pass http://unix:/home/ubuntu/django-portfolio-webapp/gunicorn.sock;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /static/ {
        alias /home/ubuntu/django-portfolio-webapp/staticfiles/;
    }
}
```

```bash
sudo ln -s /etc/nginx/sites-available/portfolio_website /etc/nginx/sites-enabled
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
sudo ufw allow 'Nginx Full'
```

```bash
sudo chown -R ubuntu:www-data /home/ubuntu/django-portfolio-webapp
sudo chmod 750 /home/ubuntu/django-portfolio-webapp
sudo systemctl restart gunicorn
sudo systemctl restart nginx
```
