About
===
I came pretty close solving this one. It works on most use cases.

The Menu#get_combo method uses brute force to determine if there is a solution to the menu / budget constraint. It will solve the problem if:

1. The solution can be reached through repetition of items
2. The solution can be reached through combination of items

This works most of the time but will not work if the solution to the menu requires uses _both_ repetition and combination.

*How could I optimize this, you ask?* I could use a brute force combination checker that multiplies every item on the menu by an arbitrary value. This would take more processor power, but would allow for more solutions via combination.

How to run the script
===
1. run 'bundle install'
2. place the menu file in the root directory of main.rb.
3. run 'ruby main.rb' and enter the relative path of the menu file.

Other stuff
===
I had fun writing this challenge. It was more theoretical than anything I've come across in any of my day-to-day work and I learned a lot while I was writing it (particularly in reference to the knapsack problem, integer partitioning and np complete problems).

Thanks for taking the time to look it over, and I hope to talk to you soon.