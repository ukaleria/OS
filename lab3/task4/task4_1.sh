./task4_2.sh & pid1=$!
./task4_2.sh & pid2=$!
./task4_2.sh & pid3=$!

renice +10 -p $pid1

at now + 1 minute <<< kill $pid1
at now + 2 minute <<< kill $pid2 $pid3
