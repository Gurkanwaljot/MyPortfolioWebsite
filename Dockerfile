FROM php:7.3-apache

# sendmail config
############################################
RUN apt-get update
RUN apt-get install -q -y \zlib1g-dev libzip-dev sendmail
RUN apt-get update && apt-get install -q -y ssmtp mailutils && rm -rf /var/lib/apt/lists/*


RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini 
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint
RUN rm -rf /var/lib/apt/lists


# root is the person who gets all mail for userids < 1000
RUN echo "root=gurkanwaljot02@gmail.com" >> /etc/ssmtp/ssmtp.conf

# Here is the gmail configuration (or change it to your private smtp server)
RUN echo "mailhub=smtp.gmail.com:587" >> /etc/ssmtp/ssmtp.conf
RUN echo "AuthUser=gurkanwaljot02@gmail.com" >> /etc/ssmtp/ssmtp.conf
RUN echo "AuthPass=eckssdsenuqcqwdu" >> /etc/ssmtp/ssmtp.conf

RUN echo "UseTLS=YES" >> /etc/ssmtp/ssmtp.conf
RUN echo "UseSTARTTLS=YES" >> /etc/ssmtp/ssmtp.conf


# Set up php sendmail config
RUN echo "sendmail_path=sendmail -i -t" >> /usr/local/etc/php/conf.d/php-sendmail.ini

COPY . /var/www/html
WORKDIR /var/www/html
EXPOSE 80