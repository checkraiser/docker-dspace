
#!/bin/sh

exec chpst -u postgres svlogd -tt /var/log/postgresqld/
