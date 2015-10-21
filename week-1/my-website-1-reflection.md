# Webpage repository:
https://github.com/nbdavies/nbdavies.github.io

Website URL:
http://nbdavies.github.io/

# How to create a repository on GitHub and clone the repository to your local computer (for a non-technical person):

On GitHub, click the Plus Sign (Create new...), and select New repository. This takes you to the "Create a new repository" page. Give it a name and description, and select a license and plublic/private, and whether you want it to have a README file to start with. Then click Create repository.

Now you have a repository out there on GitHub, with not much in it. Next you clone it to your PC, so that you have a copy to work on, and so that GitHub will recognize your PC's copy and the copy on GitHub as versions of the same thing.
To clone your repository to your PC, from the GitHub page, there is a field in the right column for HTTPS clone URL. Copy that, and then in your terminal session, type in:
git clone URL
Where "URL" should be the what you just copied.

Note: this will only work if the machine you're cloning to has access to the internet, and you'll probably be prompted to log into GitHub. Also pay attention to what directory you're in when you do this. It will create a directory to story that repository you just created, but it shouldn't be within the directory for any other repository, or git will get confused about which project you're working on.

# Open Source:

Open source means that not only is the actual compiled code available to the public, but so is the source code. So someone with programming skills could take it and modify it.

An open source license has some advantages, in that invites/empowers the people who use your program to fix things, contribute things, etc. So people can become collaborators without you having to trust them to keep your source code safe.

On the other hand, choosing an open source license may limit your ability to make money off of your project, and limits the ability to control what it allows people to do with it. Like if you develop a text editor but you hate italics and never EVER want italics in your program, releasing it as open source could allow someone to go behind your back and add that feature for you.

Choosing the right license depends on the type of project you're working on. If you're getting hired to work on an existing product, a lot of times this decision will have already been made. But if you're starting something new, then you need to think about whether it's something that you want to control who has access to, and plan for how you'll control that access. Not just in terms of licensing--which determines which legal rights you reserve for yourself vs. which ones you give to others--but also in terms of how you'll collect money and deliver your product, in such a way to discourage piracy, and hopefully not have to uphold your rights in court.

# What concepts were solidified in the challenge? Did you have any "aha" moments? What did you struggle with?

In this particular challenge I found that I had to manually set the URL for the repository--naming it "nbdavies.github.io" didn't automatically make that work as a URL. So in the GitHub repository, I clicked Edit, and there was a field for Website, where I put in "http://nbdavies.github.io". After that, it worked.

# Did you find any resources on your own that helped you better understand a topic? If so, please list it.

I started this challenge before I figured out that you shouldn't clone a repository into another repository's directory. This had come up because I'm using a virtualbox on Windows, and there are certain "share" directories that the virtualbox and my PC both respect. The share directories that were available to start with were inside the phase-0-dev-box directory, which is itself a git repository. So for convenience, that was where I first tried cloning my repositories, and then when I would try to push changes back to GitHub, it would try to apply them to the Devbootcamp repository, and fail. 

Something in this challenge got me thinking about it, and I did a bit of research on the error message I was getting, and found a forum post by someone who had made a similar mistake. So I learned how to create and mount another share directory, which I created specifically for my repositories. Then I circled back to the previous challenge and was able to complete it better.