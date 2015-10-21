How does tracking and adding changes make developers' lives easier?

Having a record of what changes were made helps you be able to track down where bugs might have been introduced, revert to a stable version of the code, and work on projects in parallel.

What is a commit?

A commit when you save your changes made to a branch.

What are the best practices for commit messages?

It's meant to be in the imperative form, and describe what effect the change will have. Like "Improve performance when writing to disk". For more complex commits, it can take the form of a text file with a one line summary, and a paragraph for more explanation or background on why the change is being made. 

What does the HEAD^ argument mean?

HEAD is the current state, and HEAD^ is the commit before that. So to undo your last set of changes, you would revert to HEAD^.

What are the 3 stages of a git change and how do you move a file from one stage to the other?

After making changes, you would:
1. git add (file)
2. git commit -m (message)
3. git checkout master and git pull origin master
4. git checkout (branch) and git merge master
5. git push origin (branch)
I guess that's not 3 steps, but I didn't see a particular list of 3 steps.

Write a handy cheatsheet of the commands you need to commit your changes?

Mostly the same as above...
git clone (URL)
git checkout -b (branch)
(make changes)
git add (changed files)
git commit -m (message)
git checkout master
git pull origin master
git checkout (branch)
git merge master
git push origin (branch)

What is a pull request and how do you create and merge one?

Once the branch is pushed to the remote repository (i.e. GitHub), from the branch there is a button for Pull Request. If the repository started as a fork from someone else's, make sure that the base fork is correct. (If necessary, the base fork is part of the URL). Then click Create Pull Request.
Normally someone else would do the merge step by clicking on the pull request, and then clicking Merge pull request. Then confirm the merge. 
After the pull request is merged, the branch can be deleted.

Why are pull requests preferred when working with teams?

It gives you way to submit your changes to be part of the master version, and to have someone review them before that happens. It could also be a step where different people's contributions could be merged together, if there are a bunch of changes being worked on at once.