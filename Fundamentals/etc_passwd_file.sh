:<<'COMMENTS'

Sample /etc/passwd Entry
------------------------
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