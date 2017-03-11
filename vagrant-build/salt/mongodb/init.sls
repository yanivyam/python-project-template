# Installs and configures mongodb

# MongoDB packages are available in EPEL repository
include:
    - epel
    - selinux.disable      # ensure SElinux is disabled


mongodb-server:
    pkg.installed:
        - refresh: False
        - skip_suggestions: True

mongodb:
    pkg.installed:
        - refresh: False
        - skip_suggestions: True

    
/etc/mongod.conf:
    file.managed:
        - source: salt://mongodb/files/mongod.conf
        - user: root
        - group: root
        - mode: 0644
        - require:
            - pkg: mongodb-server

mongod:
    service.running:
        - enable: True
        - watch:
            - file: /etc/mongod.conf



