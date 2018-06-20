#!/bin/sh
directory="script_1.0";
fl1="blanc";
fl2="greetings.txt";
fl3="pets.txt";
fl4="commands.txt";
fl5="lovelyCommands.txt"

if [ ! -d "$directory" ]; then
mkdir -p -- "$directory" && cd -P -- "$directory"
echo directory "$directory" was created.

touch ${fl1}
echo file "$fl1" created.

cat > $fl2 << EOL
1.Hello
2.Hello
3.Hello
4.Hello
5.Hello
EOL
echo text was written into "$fl2" file.

for i in $(seq 1 5); do cat "$fl2" >> "$i.txt"; done
echo content of "$fl2" was copied to 5 different files.

cat > "$fl3" << EOL
cat
dog
hamster
EOL
echo "$fl3" was filled with custom data

cat > "$fl4" << EOL
cat
ls
pwd
EOL
echo "$fl4" was filled with custom data

sort -u "$fl3" "$fl4" -o "$fl5"
echo "$fl3" and "$fl4" were sorted. "$fl5" was created.

else

while true; do
printf "It seems that script was already executed\\nPress \e[31m \e[5mR \e[0mto remove existing folder.\\nPress \e[32m \e[5mQ \e[0mto quit."
read -r yn
case $yn in
[Qq]* ) echo " Bye-bye! "; sleep 1; exit;;
[Rr]* ) echo " Folder was removed. Please, rerun script again."; rm -r $directory; sleep 1; exit;;
* ) echo "Please answer R or Q.";;
esac

done

fi
