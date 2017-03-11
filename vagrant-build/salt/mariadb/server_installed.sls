#
# myproject
# Copyright 2015 Yaniv Yemini
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
############
#
# Install MariaDB Server
#

mariadb-server-install:
  pkg.installed:
    - name: mariadb
    - name: mariadb-server

mariadb-service:
  service.running:
    - name: mariadb
    - enable: True
 
# TODO: Do we need to run mysql_install_db after initial install?
#mariadb-install-db:
#  cmd: mysql_install_db

# Secure MariaDB:
# Based on mysql_secure_installation script.
mariadb-secure:
  cmd.wait:
   - name: |
             mysql -u root <<EOF
             DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
             DELETE FROM mysql.user WHERE User='';
             DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
             FLUSH PRIVILEGES;
             EOF
   - watch:
      - pkg: mariadb-server-install


#mariadb-root-pass:
#  cmd.run:
#    - name: UPDATE mysql.user SET Password=PASSWORD('$rootpass') WHERE User='root';
