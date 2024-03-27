#!/bin/bash

# 1.Print the home directory
home_directory()
{
    echo "1. Home directory: $(getent passwd | cut -d: -f6)"
}

# 2.List all usernames from the passwd file
usernames()
{
    echo
    echo "2. Usernames are: "
    cut -d: -f1 /etc/passwd
}

# 3.Count the number of users
number_users()
{
    echo
    echo "3. Number of users is: "
    wc -l /etc/passwd
}

# 4.Find the home directory of a specific user (prompt to enter the username value)
home_user()
{
    echo
    read -p "4. Enter username: " username
    getent passwd $username | cut -d: -f6
}

# 5.List users with specific UID range (e.g. 1000-1010)
users_uid()
{
    echo
    read -p "5. Enter lower range: " lower_range
    read -p "5. Enter higher range: " higher_range
    echo "Users with UID between $lower_range and $higher_range are "
    awk -F: '$3 >= $lower_range && $3 <= $higher_range {print $1}' /etc/passwd
}

# 6.Find users with standard shells like /bin/bash or /bin/sh
users_standard_shells()
{
    echo
    echo "6. The users with standard shells are "
    getent passwd | awk -F: '$7 ~ "/bin/bash|/bin/sh" {print $1}'
}

# 7.Replace the “/” character with “\” 
# character in the entire /etc/passwd file and redirect the content to a new file
replace_redirect()
{
    sed 's/\//\\/g' /etc/passwd > /root/passwd_modified
}

# 8.Print the private IP
private_ip()
{
    echo
    echo "8. Private IP: $(hostname -I | awk '{print $1}')"
}


# 9. Print the public IP
public_ip()
{
    echo
    echo "9. Public IP: $curl -s ifconfig.me)"
}


# 10. Switch to john user
switch_john()
{
    su - john
}

# 11.Print the home directory
new_home_directory()
{
    echo
    echo "11. Home directory of john user: $HOME"
}


home_directory            # 1
usernames                 # 2
number_users              # 3
home_user                 # 4
users_uid                 # 5
users_standard_shells     # 6
replace_redirect          # 7
private_ip                # 8
public_ip                 # 9
switch_john               # 10
new_home_directory        # 11
