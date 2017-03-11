
# Disable SELinux


selinux-disable:
  file.replace:
    - name: /etc/selinux/config
    - pattern: '^SELINUX=(enforcing|permissive)'
    - repl: 'disabled'
    - count: 1
    - backup: .bak