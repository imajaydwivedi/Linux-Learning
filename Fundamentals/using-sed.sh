:<<'COMMENTS'

sed
  Awk is useful for filtering text and printing specific values only
  Sed is a stream editor, and allows you to edit files in non-visual mode

Examples:

# Print 5th line of /etc/passwd
sed -n 5p /etc/passwd

head -5 /etc/passwd | tail -1

# Substitue word "old" with "new" in myfile (In Place)
sed -i 's/old/new/g' ./Fundamentals/myfile

# Delete 6th line of myfile (In Place)
sed -i -e '6d' ./Fundamentals/myfile

# Delete 6th & 8th line of myfile (In Place)
sed -i -e '6,8d' ./Fundamentals/myfile

# Create multiple files using Globbing
echo hello | tee file{1..4}.txt

# Substitute word "hello" with "bye" in all files
for i in *txt; do sed -i 's/hello/bye/g' $i; done

COMMENTS

