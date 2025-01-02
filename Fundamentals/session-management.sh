:<<'COMMENTS'

Understanding Session Management
--------------------------------

-> "who" and "w" show who is currently logged in
    -> "who" : Display who is logged in and related data (processes, boot time).

-> "loginctl" allows for current session management
    -> "loginctl list-sessions" : List all active sessions
    -> "loginctl show-session <session_id>" : Show details of a specific session
    -> "loginctl show-user <username>" : Show details of a specific user
    -> "loginctl terminate-session <session_id>" : Terminate a specific session

COMMENTS

# get example usage of who
tldr who

