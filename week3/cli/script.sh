#!/bin/sh
directory="script_1.0";
fl1="blanc";
fl2="greetings.txt";
fl3="pets.txt";
fl4="commands.txt";
fl5="lovelyCommands.txt"

if [ ! -d "$directory" ]; then
mkdir -p -- "$directory" && cd -P -- "$directory"
echo directory "$directory" created

touch ${fl1}
echo file "$fl1" created

cat > $fl2 << EOL
1.Hello
2.Hello
3.Hello
4.Hello
5.Hello
EOL
echo text written into "$fl2" file

for i in $(seq 1 5); do cat "$fl2" >> "$i.txt"; done
echo content of "$fl2" copied to 5 files

cat > "$fl3" << EOL
cat
dog
hamster
EOL
echo "$fl3" filled with data

cat > "$fl4" << EOL
cat
ls
pwd
EOL
echo "$fl4" filled with data

sort -u "$fl3" "$fl4" -o "$fl5"
echo "$fl3" and "$fl4" has been sorted

else

while true; do
printf "It seems that you already executed this script\\nPress \e[31m \e[5mR \e[0mto remove existing folder.\\nPress \e[32m \e[5mQ \e[0mto exit."
read -r yn
case $yn in
[Qq]* ) echo " Bye-bye! "; sleep 1; exit;;
[Rr]* ) echo " Folder removed "; rm -r $directory; sleep 1; exit;;
* ) echo "Please answer R or Q.";;
esac

done

fi
