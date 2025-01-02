:<<'COMMENTS'

-> Users and their properties are stored in /etc/passwd
-> Common properties are:
    - Username
    - Password Placeholder
    - User ID (UID)
    - Group ID (GID) : the ID of the primary group of the user
    - User Info (GECOS) AKA Comment Field
    - Home Directory: the default directory where the  user will land after logging in
    - Default Shell: the program that is started after user login

-> System users have a UID < 1000
-> System users mostly have /bin/false or /usr/sbin/nologin as their default shell
-> Only Regular users have /bin/bash as their default shell
-> Use "getent passwd username" to list current /etc/passwd properties for the user
-> Notice that passwords are stored in /etc/shadow
-> Use "vipw" to edit /etc/passwd and /etc/shadow settings directly


Sample /etc/passwd Entry
------------------------
> getent passwd saanvi

saanvi:x:1001:1001:Saanvi User,,,:/home/saanvi:/bin/bash


+-----------+---------------------+--------------------------------------------------+--------------------+
| Field No. | Field Name          | Description                                      | Example            |
+-----------+---------------------+--------------------------------------------------+--------------------+
| 1         | Username            | User's login name (used to log in)               | saanvi            |
| 2         | Password Placeholder| Placeholder for password (x indicates /etc/shadow)| x                 |
| 3         | User ID (UID)       | Unique numeric identifier for the user           | 1001              |
| 4         | Group ID (GID)      | Default group identifier for the user            | 1001              |
| 5         | User Info (GECOS)   | A comment field, usually full name/contact info  | Saanvi User,,,    |
| 6         | Home Directory      | Path to the user's home directory                | /home/saanvi      |
| 7         | Default Shell       | User's default shell (e.g., /bin/bash)           | /bin/bash         |
+-----------+---------------------+--------------------------------------------------+--------------------+



COMMENTS