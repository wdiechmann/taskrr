FROM mariadb:10.3
LABEL   "Author"="ALCO Company, Walther H Diechmann - walther@alco.dk" \
        "maintainer"="ALCO Company, Walther H Diechmann - walther@alco.dk" \
        "version"="1.0"

RUN apt-get update \
 && apt-get install -y git apt-utils \
 && apt-get install --no-install-recommends -y tzdata locales debconf curl \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN echo 'da_DK.UTF-8 UTF-8' >> /etc/locale.gen \
  && locale-gen
ENV LANG da_DK.UTF-8
ENV LANGUAGE da_DK.UTF-8
# Collation order
ENV LC_COLLATE  da_DK.UTF-8
# Character classification and case conversion
ENV LC_CTYPE  da_DK.UTF-8
# Monetary formatting
ENV LC_MONETARY  da_DK.UTF-8
# Default measurement system used within the region
ENV LC_MEASUREMENT  da_DK.UTF-8
# Format of interactive words and responses
ENV LC_MESSAGES  da_DK.UTF-8
# Numeric formatting
ENV LC_NUMERIC  da_DK.UTF-8
# Default paper size for region
ENV LC_PAPER  da_DK.UTF-8
# Determines how responses (such as Yes and No) appear in the local language
ENV LC_RESPONSE  da_DK.UTF-8
# Conventions used for representation of telephone numbers
ENV LC_TELEPHONE  da_DK.UTF-8
# Date and time formats
ENV LC_TIME  da_DK.UTF-8

RUN echo Europe/Copenhagen > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV MYSQL_DATABASE      mandarin_development
ENV MYSQL_ROOT_PASSWORD th!5!5!t
ENV MYSQL_USER          mandarin
ENV MYSQL_PASSWORD      mandar!n

ADD setup.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
