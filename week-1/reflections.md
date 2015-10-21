# 1.1 Thinking About Time

I checked out a little bit of the techniques above, and it seemed like they fit a couple common themes. Meditation, and to some extent Pomodoro or timeboxing (setting a time limit to dedicate to working on a particular task), eliminates background noise that prevents focus, even if that background noise is mostly in your head. In terms of timeboxing/Pomodoro, this also means allowing for time outside the box to come back to those other impulses. Then the Fogg method is about forming habits at a small scale that build toward what behaviors you want to practice. Putting those things together might mean starting with a smaller window of time to focus on a smaller task.

Meditation and screening out external noise is definitely something I want to work on during Phase 0. And setting times for a particular task, giving myself time for breaks (my cat helps manage those for me). Until I have a better feel for what the demands of the course are, I don't want to logistically limit the time I can spend on it (don't limit myself to 15 hours if it might take me 20 or 25), but I do want to spend my time effectively. On week 1, day 1, it's a bit early to know how my strategies are working, but I can adapt as needed and put in place more structure as the demands increase.

# 1.2 The Command Line

I think a "shell" is typically a non-GUI way of controlling a computer--giving it commands. Bash is one of the non-graphical shells for Unix. There are slightly different ones out there. 

I had some previous exposure to working at the command line and some of the Unix commands. Some of the redirection (when to use a pipe vs. greater than), wildcards, xargs, those things are going to take some practice to get to the point where I can write out a command off the top of my head, and have it do what I'm expecting it to do.

Important commands are knowing what directory you're in (pwd), listing the contents of a directory (ls), changing directory (cd), and viewing files (less/more). Manipulating files, like creating them (touch), copying them (cp), moving them (mv), removing them (rm), and creating (mkdir) and removing (rmdir) directories is also important. help or man is also super useful for figuring out what arguments a command can take.

# 1.4 Forking and Cloning

To create a new repository (repo), in GitHub, you can go to the plus icon (Create New...) and select New Repository. It will basically start out empty, and is yours to start from scratch.

To create a fork of an existing repository, you can go to the repo in GitHub, and click Fork (there will also be a number showing how many times others have done the same thing). This will take you to your copy of that repository, with all the files already included. 

After doing either of those things, to copy a repo to your local PC and do some work on it, you can clone it. Get the clone URL from the repository's page in GitHub, and then in your shell, type:

git clone (paste URL)

This will only work from somewhere that has internet access (in my case it didn't work from within the vagrant virtual machine), and might require you to log into your GitHub account. 