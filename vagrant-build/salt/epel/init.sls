# Install EPEL repository

# Completely ignore non-RHEL based systems
{% if grains['os_family'] == 'RedHat' %}

# A lookup table for EPEL GPG keys & RPM URLs for various RedHat releases
{% if grains['osmajorrelease'][0] == '5' %}
  {% set rpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm' %}
{% elif grains['osmajorrelease'][0] == '6' %}
  {% set rpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm' %}
{% elif grains['osmajorrelease'][0] == '7' %}
  {% set rpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm' %}
{% elif grains['os'] == 'Amazon' and grains['osmajorrelease'] == '2014' %}
  {% set rpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm' %}
{% elif grains['os'] == 'Amazon' and grains['osmajorrelease'] == '2015' %}
  {% set rpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm' %}
{% endif %}


epel_repo:
  pkg.installed:
    - sources:
      - epel-release: {{ rpm }}

{% endif %}
