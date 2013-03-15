About
===
I came pretty close solving this one, but did not quite make it to the end. In the name of submitting it in a timely manner, I am sending it in its [nearly complete] state.

The Menu#get_combo method uses brute force to determine if there is a solution to the menu / budget constraint. It will solve the problem if:

1. The solution can be reached through repetition of items
2. The solution can be reached through combination of items

This works most of the time but will not work if the solution to the menu requires uses _both_ repetition and combination.

How to run the script
===
1. run 'bundle install'
2. place the menu file in the root directory of main.rb.
3. run 'ruby main.rb' and enter the relative path of the menu file.

Other stuff
===
I had fun writing this challenge. It was more theoretical than anything I've come across in any of my day-to-day work and I learned a lot while I was writing it (particularly in reference to the knapsack problem, integer partitioning and np complete problems).

Thanks for taking the time to look it over, and I hope to talk to you soon.