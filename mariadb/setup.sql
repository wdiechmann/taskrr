# # Project Name
#
# TODO: Write a project description
#
# ## Installation
#
# TODO: Describe the installation process
#
# ## Usage
#
# TODO: Write usage instructions
#
# ## MySQL Server Setup
#
# Allow the taskrr user all access
# from local networks
#
# CREATE SCHEMA taskrr_dev;
# DROP USER 'taskrr';
# CREATE USER 'taskrr'@'%' IDENTIFIED BY 'pASSword';
# GRANT ALL PRIVILEGES ON *.* TO 'taskrr'@'%';
# FLUSH PRIVILEGES;

# GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON `[your_database]`.* TO '[your_user]'@'192.168.0.0/255.255.0.0';
# FLUSH PRIVILEGES;

# Create the development network database
#
# CREATE DATABASE IF NOT EXISTS mandarin_development;
