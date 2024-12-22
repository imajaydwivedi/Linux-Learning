#!/bin/bash

command=hostname
$command
EXIT_STATUS=$?

if [[ $EXIT_STATUS -eq 0 ]] then
  EXIT_STATUS_MSG=`echo -e "\e[32mSuccessful\e[0m"`
else
  EXIT_STATUS_MSG=`echo -e "\e[31maFailure\e[0m"`
fi

echo "1) Exit Status of command:<<$command>> is $EXIT_STATUS_MSG"

echo

command=`hostname`
$command
EXIT_STATUS=$?

if [[ $EXIT_STATUS -eq 0 ]] then
  EXIT_STATUS_MSG=`echo -e "\e[32mSuccessful\e[0m"`
else
  EXIT_STATUS_MSG=`echo -e "\e[31mFailure\e[0m"`
fi

echo "2) Exit Status of command:<<$command>> is $EXIT_STATUS_MSG"

: <<'COMMENT'

Basic Syntax for Colored echo
  echo -e "\e[COLOR_CODEmYour Text Here\e[0m"

-e: Enables interpretation of escape sequences.
\e[: Starts the escape sequence.
COLOR_CODE: Defines the text or background color.
m: Marks the end of the color code.
\e[0m: Resets all text formatting.


2️⃣ Color Codes Reference
✅ Text Color Codes
Color	Code
Black	30
Red	31
Green	32
Yellow	33
Blue	34
Magenta	35
Cyan	36
White	37
✅ Background Color Codes
Color	Code
Black	40
Red	41
Green	42
Yellow	43
Blue	44
Magenta	45
Cyan	46
White	47
✅ Text Styles
Style	Code
Normal	0
Bold	1
Underline	4
Blink	5
Reverse	7
Hidden	8

3️⃣ Examples
✅ Basic Example with Text Color
bash
Copy code
echo -e "\e[32mThis is green text\e[0m"
✅ Example with Bold Yellow Text
bash
Copy code
echo -e "\e[1;33mThis is bold yellow text\e[0m"
✅ Example with Text and Background Color
bash
Copy code
echo -e "\e[37;44mWhite text on a blue background\e[0m"
✅ Example with Multiple Colors
bash
Copy code
echo -e "\e[31mRed Text\e[0m and \e[34mBlue Text\e[0m"
✅ Example with Dynamic Variables
bash
Copy code
text="Dynamic Green Text"
echo -e "\e[32m${text}\e[0m"
🛡️ 4️⃣ Resetting Colors
Always end your echo statements with \e[0m to ensure the terminal resets to its default style.

bash
Copy code
echo -e "\e[31mThis is red text\e[0m Normal text"
📚 5️⃣ Advanced Example in a Script
bash
Copy code
#!/bin/bash

echo -e "\e[1;32m=== Welcome to My Script ===\e[0m"
echo -e "\e[34mPlease enter your name:\e[0m"
read name
echo -e "\e[1;36mHello, $name! Have a great day.\e[0m"


COMMENT
