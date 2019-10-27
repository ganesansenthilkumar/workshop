# 1. What is Git?

## Lesson Objectives
In this lesson we will cover:
- what is Git?
- why does this Git lesson barely scratch the surface of what Git can do?
- what is GitHub?
- what is a repository?
- local vs. remote repositories

-------------------------------------------------------------------------------------------------------------
## What is Git?
Git is a tool for "version control" (alt. "revision control", "versioning").

>Git is not the only tool for version control. Microsoft Word and Google Docs, for example, have features for tracking changes. But Git, as we will see, is much more powerful.

## What is "version control"?
We've all had this happen before. Researchers do this file naming thing. All. The. Time.

<p align="center">
<img src="/images/phd101212s.gif" width="450">

[Comic by Jorge Cham](http://phdcomics.com/comics/archive.php?comicid=1531)
</p>

We do it so we can track the changes we make, collaborate with other researchers, and revisit old versions of our files. But there's a better way!

>Hint: we suggest using Git!

## What we want (as researchers) from version control software

1. Make it possible to *track changes* to documents, code, data, etc. *over time*
2. Make it possible to *organize those changes* in meaningful ways
3. Make it possible to *publish*, *collaborate*, and *share* your work
4. *Not* create 1,000 copies of the same file on our computer!

### "Make it possible" means the tool must be *simple*

Below is a hammer that you can use to drive a nail (the task of interest) at nearly any skill level:

<p align="center"><img src="/images/claw_hammer.jpg" width="450"></p>

***That simple tool is what we are shooting for in this lesson.***

Below is what git gives you out of the box:

<p align="center"><img src="/images/swiss_army_hammer.jpg" width="450"></p>

Obviously, *this tool is too complicated*. Each individual component is probably very useful, but it's so confusing as to be useless until you know how to use each and every one of those attachments. We are *not* going to use this hammer here. Because it's confusing. And confusing is worthless for beginners needing to get something done.

Instead, this lesson will focus on a narrow subset of what Git can do to make it more approachable (the "Goat Path Git"). Our view is that, as researchers, you are probably pretty good at, well, *researching* how to fix a problem. If we can get you started using some basic aspects of Git, you will be prepared to learn what you need to make the most of it later!

-------------------------------------------------------------------------------------------------------------
## So...what is Git?
Git is powerful software to help you with version control and collaboration. That is, Git helps you to:
- track and organize changes to your files over time
- revisit prior versions of files
- collaborate with others
- and much more!

Git is built for the command line, and this is how we will learn to use it first (although it can be managed through various [GUIs](https://git-scm.com/downloads/guis)).

## Ok, so what is GitHub then?
GitHub (and other such platforms) is an online place to help you use Git for version control, collaboration, and publication of your work. Think of GitHub as a cloud service that allows you to share your work and collaborate with others using Git.

***Let me be clear:*** Git is *not the same thing* as GitHub!
- Git: a tool you can use from the command line. Something you can use on your local computer without ever interacting with GitHub or any other service like it.
- GitHub: a service/resource that makes using certain aspects of Git easier, especially collaboration.

### Why GitHub, and not some other service?
We like GitHub for a number of reasons, but perhaps the best reason is that GitHub is very popular! And when collaboration is one of the goals, popular is a good thing :sunglasses:

Plus, as a student, you can have unlimited private repositories with GitHub for the duration of your studentship :nerd_face:

-------------------------------------------------------------------------------------------------------------
## Repositories
Before we can begin using Git, we need to understand the concept of a **repository**.

Git functions not by tracking changes just to individual files, but rather by *tracking changes to an entire directory*. "Repository" is the term used to refer to a directory that Git is keeping track of.

*Conceptually*, a repository is like a database or a digital warehouse. Are you working on a project that you want to keep track of using Git? Store the project's contents in a Git repository!

*Technically*, a Git repository is any directory that contains a special `.git/` subdirectory inside of it. That `.git/` directory is what handles the operations of Git. It is those Git operations that make the directory function as a repository (by tracking changes to the directory) instead of a normal directory (which tracks nothing).

Repositories are often referred to by a shorthand term, **repo**. There is no difference between these terms (other than 6 letters).

### Local vs. Remote Repositories
There are two "kinds" of repository, **local** repositories and **remote** repositories. The technical difference is nuanced, so I'm instead going to tell you how we will use the terms:

- **Local repository** -- any repository on somebody's *local computer* (e.g., personal laptop, laboratory workstation).
- **Remote repository** -- any repository on *GitHub* or a similar online platform.

You can use Git on either a local or a remote repository - it is not necessary to have both. Usually, however, you use both *(i)* one or more local repositories and *(ii)* a remote repository, with the local and remote repositories *linked together*.

We will start by learning the basics of git using *local repositories only*. Later in the lesson we will introduce remote repositories, and cover how to keep your local and remote repositories synced.

-------------------------------------------------------------------------------------------------------------
## Terminology Covered
- **version control** -- Alternative terms include "revision control", "versioning". Version control refers to tracking and organizing changes to code, files, etc. over time. For researchers, good version control software can also help us to collaborate, publish, and share our work with others.
- **Git** -- A powerful tool for version control.
- **GitHub** -- An online, open-source-friendly platform for hosting work done with Git (and much more). GitHub is dependent on Git, but Git is not dependent on GitHub!
- **repository** -- what we call the thing that tracks changes to our files. You might think of it like a database, an invoice, or a receipt of every change you have ever saved.
- **repo** -- short for repository.
- **local repository** -- a repository that you have on your *local computer*.
- **remote repository** -- a repository that lives *remotely*, typically online.

## Guides and resources

[JessiTron: Git Happens (an in-depth look at how Git works)](https://www.youtube.com/watch?v=Dv8I_kfrFWw)

[So WTF is Git?](https://codeburst.io/so-wtf-is-git-fa7daa0e0271)

[GUIs for Git](https://git-scm.com/downloads/guis)


-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
# 2. "Gitting" things done with Git

## Lesson Objectives
In this lesson, we will:
- create a local Git repository
- introduce ourselves to Git
- learn how to organize and track our changes with Git

-------------------------------------------------------------------------------------------------------------
## Initializing a local Git Repository
Congratulations, you are about to start actually using Git!

To begin the lesson, navigate into the `workshop` directory we had you download earlier.

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  cd ~/Desktop/workshop/
  ```

  </p>
</details>

Now...a local Git repository is just a directory on your computer that you tell Git to keep track of.
So let's make a fresh directory called `git_lesson` to get started.

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  mkdir git_lesson
  ```

  </p>
</details>

Now we can convert this directory into a Git repository using the `git init` command. First, we navigate into the directory:

```bash
cd git_lesson
```

And then we initialize the repository with `git init`:

```bash
git init
```

And voilà! We have a Git repository!

### How do I know it worked?
Remember, Git repositories are just directories that contain a special `.git` directory inside them.
To see that this is the case, let's list **ALL** the contents of the `git_lesson` directory.

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  ls -a
  ```

  </p>
</details>

You should see this:

```text
. ..  .git
```

Good. You have just created a local Git repository!

### What if I initialize a Git repository by mistake?
Imagine we just initialized a Git repository, and then realized that we weren't in the right directory. Yikes! What can we do?

Remember: a local Git repository is just a directory with a `.git` subdirectory. So all we need to do is remove that `.git` directory!

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  rm -r .git
  ```

  </p>

  Since the `.git` directory is a special hidden directory, bash may ask you some questions to confirm that you really want to get rid of it. Answer `yes` to the questions if you are sure you want to remove the `.git` directory.

  If you want bash to perform the removal without asking you these questions, you can do:
  <p>

  ```bash
  rm -rf .git
  ```

  </p>

  The `f` there is an instance of the `--force` argument (`-f` for short). This forces through dangerous operations like `rm`. ***Use at your own risk!***

</details>

Boom. Problem solved :wink:

### Do I have to start from a new directory?
Suppose you have a project you've been working on and you want to start tracking it with Git.

Of course you *could* make a new directory, initialize it as a Git repository with `git init`, and then move all your files from their current location into the newly minted Git repository.

But who wants to do all that?

In actuality, you can convert any directory into a Git repository. All you need to do is:
1. Move into the directory
2. `git init`

This works on directories that already have content. Let's practice that!

First, make sure you're at the top of the `workshop` directory:

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  cd ~/Desktop/workshop
  ```

  </p>

  OR:

  <p>

  ```bash
  cd ..
  ```

  </p>

  (Goes up one level from `git_lesson` to `workshop`.)

</details>


Convert this to a Git repository so we can track our work!

```bash
git init
```

Nice! :thumbsup:

We will continue to use this directory as a Git repository so that you can track the work we do in the workshop (from here on, at least) with Git!

-------------------------------------------------------------------------------------------------------------
## Introduce yourself to Git!
Git works by creating special identifiers for changes that you make to files. These identifiers are generated in part based on the author of the changes (among many other things).

Consequently, Git needs to know who you are! Let's introduce ourselves to Git:

```bash
git config --global user.name "YOUR NAME HERE"
git config --global user.email "YOUR GITHUB EMAIL HERE"
```

By telling Git your name, you allow Git to tag your activity as being authored by you. By telling Git the email associated with your GitHub account, you allow for communication between the Git installed on your computer, and the Git used on GitHub. More about this later!

This introduction was a one-time thing. Now you are ready to use Git!

-------------------------------------------------------------------------------------------------------------
## First things first...
I want you **trust me**, and blindly do the following:

```bash
git add --all
git commit --message "initialize the workshop directory as a repository"
```

I just had you use Git to record the act of initializing the `workshop` directory as a repo. You created a **commit** (i.e., a snapshot/checkpoint in time) that contained `--all` the content of the directory, and which you labeled with the message `initialize the workshop directory as a repository`.

This two-step process is the essence of how Git works. Rather than a single `save` operation, Git works by having you:
1. tell it which parts of the work that you have done you want to commit to the repository
2. save a snapshot of the entire repository that includes that work, with a message describing what you did

This two-step process is represented here:

<p align="center">
<img src="/images/local_git.png", width="80%">

[Image adapted from post by Zvonimir Spajic at HackerNoon (Medium)](https://medium.com/hackernoon/understanding-git-index-4821a0765cf)
</p>

The **working directory**, or **working copy**, is the copy of the repository that you have on your computer right now. It's called that because it's the copy of the repository that you are working on.

The **staging directory**, or **staging area**, is a copy of the repository that Git uses to prepare for a commit. It's called that because it's the copy that Git uses to "stage", or prepare, a commit.

The **repository** here is the official state of the Git repository. Git tracks your changes in part by comparing your *working copy* of the repository to the official copy.

>Notice that this two-step process is more powerful than a traditional "save". When you save, you are necessarily saving every change that you have made. By adding changes to the staging area first, then committing them (i.e., saving them), you can change a lot of stuff but choose to save only some of those changes.

-------------------------------------------------------------------------------------------------------------
## A Very Basic Git-based Work Cycle
Here is a basic cycle that you can follow to work with Git:
1. Do some work to a file
2. `git add <file>`: add the changes you made to that file to the staging area
3. `git commit --message "COMMIT MESSAGE"`: commit those changes to the repository

Let's give it a try! First, let's navigate into the `git` directory inside our repo.

```bash
cd ~/Desktop/workshop/git_lesson
```

Right now, this folder should be empty:

```bash
ls
```

Let's create a new file called `practice.txt`:

```bash
touch practice.txt
ls
```

Ok, that worked as expected. We have a new file in the directory.

Suppose we want to **commit** this new file to the repository. What do we need to do first?

<details>
  <summary>Solution</summary>

  Add the file that we created to the staging area:

  <p>

  ```bash
  git add practice.txt
  ```

  </p>
</details>

And what do we need to do next?

<details>
  <summary>Solution</summary>

  Commit the changes (adding a new file) to the repository with a message:

  <p>

  ```bash
  git commit --message "YOUR COMMIT MESSAGE HERE"
  ```

  </p>
</details>

Great! you have now made **2 commits** to the workshop repository:
1. You committed the files that were in the `workshop` directory to the repository
2. You committed a new file to the `workshop/git_lesson` subdirectory

-------------------------------------------------------------------------------------------------------------
## Improving Our Git-based Work Cycle with `git status` and `git diff`
We've learned how to **commit changes to a Git repository**. But committing is a very decisive action (that's why they call it a commit).

There are two commands that Git provides to help you monitor the work you've been doing, what changes are staged for a commit, and what changes are not staged for a commit. This can help you be more confident about the changes that you want to commit.

The first command is `git status`. Try it now:

```bash
git status
```

Git should give you a message like this:

```text
On branch master
nothing to commit, working tree clean
```

>You don't need to worry about this message other than to know that Git is telling you that your working copy matches the official repo. In other words, you haven't made any changes inside the repo.

Let's try changing something now. Add a line to `practice.txt`. To do so, let's practice using `>>` to append to an existing file!

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  echo "This line was added to 'practice.txt' using '>>' in bash" >> practice.txt
  ```

  </p>
</details>

Let's check back in with Git and see what it thinks happened:

```bash
git status
```

You should get an output like this:

```text
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
    modified:   practice.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

As you can see, Git has noticed that you have `modified` the file `practice.txt`. Neat!

Git has also noted that there are `no changes added to commit`, and helpfully suggests using `git add`.

`git status` can tell us that `practice.txt` was modified, but it does not tell us what those modification are. This is where `git diff` comes in:

```bash
git diff
```

>`git diff` is short for "show me the difference between my working copy and the staging area." Git uses `+` and `-` to indicate lines that are added or subtracted, respectively.

You should get an output like the following:

```text
diff --git a/git_lesson/practice.txt b/git_lesson/practice.txt
index e69de29..b5cfe91 100644
--- a/git_lesson/practice.txt
+++ b/git_lesson/practice.txt
@@ -0,0 +1 @@
+This line was added to 'practice.txt' using '>>' in bash
```

The last line there is the line that we added to `practice.txt`, with a `+` in front of it indicating that the line was added to the file.

Those changes look good, and we want to commit them to our repository. Let's take Git's advice from the status report and *add practice.txt to the staging area*:

```bash
git add practice.txt
```

Let's see how this changed our `git status` report for the repository.

```bash
git status
```

You should get output like this:

```text
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
    modified:   practice.txt
```

Now that we have *added practice.txt to the staging area*, Git tells us we have `Changes to be committed:` instead of `Changes not staged for commit:`. Yay!

>Git is full of "helpful" advice (the advice gets more helpful as you get more used to Git's terminology). Here, Git tells us how to remove this change from the staging area if we don't want to commit it.

Hurray! Let's **commit** our changes to the repo:

```bash
git commit --message "YOUR COMMIT MESSAGE HERE"
```

>Pro tip: git commit --message can be abbreviated to git commit -m.

Let's see if the status of our repo is different now:

```bash
git status
```

We should see the following:

```text
On branch master
nothing to commit, working tree clean
```

Nice, we are back to that message telling us that our working copy, the staging area, and the official repo are all the same.

Now that we've learned bout `git status` and `git diff`, let's update our Git-based work cycle:
1. Do some work to a file
2. `git status`: see what files have changed since the last commit
3. `git diff`: see all the changes between your working copy and the staging area
4. `git add <file>`: add changes you made to <file> to the staging area
5. `git status` (again): confirm that you are about to commit what you think you are about to commit
6. `git commit --message "COMMIT MESSAGE"`: commit your staged changes to the repository with a message
7. Rinse and repeat as needed

Bravo! :clap: You've made another commit, and learned about `git status` and `git diff`!

-------------------------------------------------------------------------------------------------------------
## Reviewing your commit history
Let's imagine that it's two weeks from now, and you are trying to remember what you learned in this workshop. You remember that you did some things with Git, which you recorded as "commits". But what were those commits? You can't seem to remember!

Git can help you here. As long as you are inside your Git repository, you can see a log of your recent commits to help you remember what you were doing:

```bash
git log
```

Notice that your output contains something like the following:

```text
commit d6580d98545a223319c1a0ca1a58e5b468839ccc (HEAD -> master)
Author: Noah Richard Nelson <noah.nelson.11@gmail.com>
Date:   Mon Oct 21 12:41:20 2019 -0700

    added line to practice.txt and practiced the git status and git diff commands

commit e63c250d2f84332b1759a3618395cf8e375ed9ff
Author: Noah Richard Nelson <noah.nelson.11@gmail.com>
Date:   Mon Oct 21 12:00:03 2019 -0700

    practicing git commit

commit be438683506f5d26d31e20e46d8c9caa6f4ecd2d
Author: Noah Richard Nelson <noah.nelson.11@gmail.com>
Date:   Mon Oct 21 11:50:51 2019 -0700

    initialize the workshop directory as a repository
```

`git log` reports up to the last 10 commits in the repo, starting with the most recent commit and working backward. We only have 3 commits in the repo, so that's what it shows us.

Now you can see why we introduced ourselves to Git! It has our *user.name* and *user.email* in the `Author:` field! In fact, *Git will not allow you to make a commit without providing a user name and email.*

The commit itself has an arbitrary character sequence (called a hash) as a label. This lets Git find the commit easily, but you don't need to worry about that right now. Instead, notice that your commit message is there, floating in space, easy to find and to read. ***This is why it is so valuable to write good commit messages - they are messages to your future self!***

-------------------------------------------------------------------------------------------------------------
## Exercise: DIY Git!
Using the same repo we were just working on, I want you to:
1. Change the line you wrote to `practice.txt` to be something else
2. Have Git tell you what you changed in `practice.txt`. How is a change to a single line represented?
3. Add a new file to the `git_lesson` directory. Call it whatever you want.
4. Make a *single commit* with *both* of these two changes included in the commit
5. Review the commit history to confirm your last commit

<details>
  <summary>Solution</summary>

  #### Change the line you wrote to `practice.txt` to be something else
  <p>

  ```bash
  nano practice.txt
  ```

  </p>

  (Edit something in the line)

  #### Have Git tell you what you changed in `practice.txt`
  <p>

  ```bash
  git diff
  ```

  </p>

  If you changed the line in `practice.txt`, the `diff` report should have the *old line preceded by a -*, and the *new line preceded by a +*.

  #### Add a new file to the `git_lesson` directory
  <p>

  ```bash
  cd ~/Desktop/workshop/git_lesson/
  touch file.txt
  ```

  </p>

  #### Make a single commit for both of these two changes
  <p>

  ```bash
  git add file.txt
  git add practice.txt
  git status
  git commit --message "add line to file and add new file in same commit"
  ```

  </p>

  #### Review the commit history to confirm your last commit
  <p>

  ```bash
  git log
  ```

  </p>
</details>

## Congratulations, you now know how to use Git in a local repository!

-------------------------------------------------------------------------------------------------------------
## Terminology Covered
- **working copy** -- the copy of a Git repository that you are working on. When you make changes to the repository, they happen her first, and have to be: (1) added to the staging area, and (2) committed, before they are saved to the repository.
- **staging area** -- the digital "space" where changes to the repository are added in preparation for a commit.
- **to commit (v.)** -- to save the state of all of your files in the repository.
  - _I committed the changes to the repository._
- **commit (n.)** -- an individual instance of a committing event. A snapshot of the repository in time.
  - _The last commit introduced a bug in the program._

## Commands Covered
- `git init` -- Initialize a Git repository.
- `git config --global <configuration option> "configuration value"` -- Change your global Git configuration file to add or set a configuration option value. Git uses this file to determine who you are, communicate with GitHub (or other Git resources), and remember your settings for using Git.
- `git status` -- Check the status of this repository. Git will report any files that have been changed or added to the staging area.
- `git diff` -- See the difference between your working copy and the staging area. When `git status` reports a file with changes, you may wonder what those changes are. `git diff` will display them.
- `git add <file>` -- Add the changes to <file> to the staging area. If you are sure that you want to add *all* the changes to the staging area, you can use `git add --all`.
- `git commit --message "YOUR COMMIT MESSAGE"` (`git commit -m "YOUR COMMIT MESSAGE"` for short) -- Commit the changes to the Git repository with a descriptive message.
- `git log` -- See a log of committed changes to the repository.


-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
# 3. "Gitting" Things Done with GitHub

## Lesson Objectives
In this lesson we will cover:
- why use remote repositories?
- creating a remote repository
- linking a remote repo to an existing local repo
- expanding the Git work cycle to incorporate a remote repo

-------------------------------------------------------------------------------------------------------------
## Why use remote repositories?
As we discussed previously, you can "Git things done" using only a local repository. So why use a remote repository at all?

There are 2 main reasons to use a remote repository:
1. Collaboration
  - work on the same files as your collaborators, using Git to keep track of everyone's contributions
  - let others know exactly what you've been contributing
2. Confidence
  - the remote repo can serve as a backup on the cloud
  - GitHub (for example) is popular enough that they have to take very good care of their servers

In addition, online platforms like GitHub provide some nice GUIs for interacting with your repo and viewing your commit history. These platforms also have a lot of helpful resources and tutorials for using Git both through their platform and from the command line.

## Creating a remote repository
We are going to create a remote repository on GitHub now.

>This is kind of like doing a git init for the remote repository.

1. Go to GitHub and sign in to your account (if you aren't already signed in)
2. Click on the `+` drop-down menu at the top right of the screen
3. Click on `New repository`

<p align="center"><img src="/images/GitHub_new_repo.png", width="80%"></p>

4. Name the repository `workshop` (the name should match your local repository)
5. Add a description. This repo will serve as a record of some of what you did in this workshop after you leave, so you may want the description to reflect that
6. **DO NOT CHECK OR CHANGE ANYTHING ELSE**
7. Click `Create repository`

<p align="center"><img src="/images/GitHub_new_repo_form.png", width="80%"></p>

>If we did not already have a local repo, we could have checked `Initialize this repository with a README`. Since we do have a local repo, however, we don't want any files in this remote repo until we have synced it with our local repo.

And voilà! We have just created a remote repository on GitHub!

-------------------------------------------------------------------------------------------------------------
## Linking the remote repo to our local repo
You should now be looking at a GitHub page with `Quick setup — if you’ve done this kind of thing before` at the top of the page.

>You haven't done this kind of thing before, but that's okay. I'm here to help you!

Scroll down to where it says `...or push an existing repository from the command line`.

On the far right of the screen, click the icon that looks like a clipboard with an arrow. This will copy the Git commands you see below the heading:

<p align="center"><img src="/images/GitHub_copy_commands.png", width="80%"></p>

Return to your command line, and ***make sure you are in your local repo***.

Pasting the Git commands that you copied. It should look something the following, but with your repo's URL instead of mine:

```bash
git remote add origin https://github.com/NoahRichardNelson/workshop.git
git push -u origin master
```

>If you are having trouble copy-and-pasting into the command line, you can type it manually. Just be *very careful* that you type it *exactly!*

Verify that you added the web address correctly (especially important if you had to type it by hand!):

```bash
git remote --verbose
```

You should get an output like this, with the URL matching the one from above:

```text
origin	https://github.com/NoahRichardNelson/workshop.git (fetch)
origin	https://github.com/NoahRichardNelson/workshop.git (push)
```

You have just:
1. associated your *local repository* with the remote repository on GitHub (called the remote "origin", and found at the URL you pasted)
2. told Git to "push" the contents of your local repository up to your remote repository.

Return to GitHub, and refresh the page for your remote repository. It should now contain the contents of your local repository!

Congratulations! You've created a remote repository and linked it to an existing local repository!

-------------------------------------------------------------------------------------------------------------
## Using Git on GitHub
So far, we have learned how to use Git to track changes to a repository from the command line. GitHub also allows you to work directly on the remote repository.

Let's try making a few changes to our remote repository. You may have noticed that GitHub was strongly suggesting that you should have a `README`, a `LICENSE`, and a `.gitignore` file.

Due to limited time, we won't add a `LICENSE` or a `.gitignore` file. But you can learn more about [repository licenses](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/licensing-a-repository#disclaimer) and [.gitignore](https://help.github.com/en/github/using-git/ignoring-files) on GitHub's help pages.

We will, however, add a `README`. To add a `README`, click on the green `Add a README` button located under the list of files and commits:

<p align="center"><img src="/images/GitHub_add_readme.png", width="80%"></p>

Notice that the file already contains:
1. the name of your repo
2. the description you gave your repo (if you gave it one)

>The `README` file is in a special format for presenting text files on the web using HTML. The format is called "markdown", and has the `.md` file extension.

Feel free to edit the file if you like. When you are ready, scroll down to the bottom of the screen.

Notice that GitHub doesn't give you a way to perform a traditional `save` operation. Instead, GitHub has an interface for **committing** your changes to the remote Git repository.

The first box in the interface is were your **commit message** goes. This is the `...` part when you work from the command line and do `git commit --message "..."`.

Add a *precise, concise, and informative* commit message about the changes you just made.

Making sure that `commit directly to the master branch` is still selected, click on `Commit changes`.

<p align="center"><img src="/images/GitHub_commit.png", width="80%"></p>

GitHub just performed the following for you on the remote repository:

```bash
git add README.md
git commit --message "YOUR COMMIT MESSAGE"
```

When the page refreshes, you should see `README.md` as a file in your repository, with your commit message next to it! :thumbsup:

-------------------------------------------------------------------------------------------------------------
## Keeping your local and remote repositories synced
Great, we just made a nice change to our repository on GitHub! We're all good, right?

Well, actually not really. Our *remote repository* was updated, but our *local repository* is not aware of the changes we made!

Keeping your local and remote repositories synced up is important. It makes sure that you have a single, linear history of commits that both repositories are tracking. If you do work without syncing your repositories, you will ultimately create parallel histories that can be very confusing to straighten out!

To keep the repositories synced, we need two key commands: `git pull` and `git push`.

### Pulling commits from the remote repo into your local repo
Right now, there is a commit in our remote repo that does not exist in our local repo. Let's fix that by **pulling** the current state of the remote repo into our local repo.

Go back to the command line, and make sure you are in your local repository:

```bash
cd ~/Desktop/workshop
```

**Pull** from your remote repo:

```bash
git pull
```

>You will likely be asked to input your GitHub password. Do so.

Notice that Git now provides some information about what it pulled.

```text
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/NoahRichardNelson/workshop
  bbcdd8f..1be38cd  master     -> origin/master
Updating bbcdd8f..1be38cd
Fast-forward
  README.md | 2 ++
  1 file changed, 2 insertions(+)
  create mode 100644 README.md
```

Most of this is Git jargon that you don't need to worry about. But can you see how this is a reflection of the changes you made on GitHub?

```text
Fast-forward
  README.md | 2 ++
  1 file changed, 2 insertions(+)
  create mode 100644 README.md
```

It notes that `README.md` was affected. The `| 2 ++` is telling you two lines were added. Then Git reports `1 file changed, 2 insertions(+)`. That's pretty cool :sunglasses:

Now you know that your local repo is up-to-date with your remote repo!

### Pushing commits from the local repo into your remote repo
The final piece of keeping your local and remote repositories synced is `git push`. We already did a "push" earlier, when we pushed the state of our local repo up to the remote repo for the first time.

Let's practice using `git push` by changing something in the local repository and pushing it up to the remote repo.

`file.txt` (or whatever you chose to call it) is still empty from before. Let's add some notes about what we have learned:

```bash
nano /git_lesson/file.txt
```

Now let's verify that we are on the same page as Git:

```bash
git status
```

Git's reporting that we modified a file. Good! Now let's add those changes to the staging area:

```bash
git add file.txt
```

Let's double-check that it worked as expected:

```bash
git status
```

Good, Git is reporting the modified file under `Changes to be committed`. Let's commit those changes:

```bash
git commit --message "COMMIT MESSAGE"
```

Very nice, we did some very important work and committed the changes to our local repository. :wink:

Now let's push those changes up to our remote repo on GitHub using `git push`:

```bash
git push
```

>You may be asked to input your GitHub password. Do so.

That's it! Let's make sure GitHub is reflecting that last commit in our remote repository. Go back to GitHub, refresh the repo page, and take a look!

This gives us an updated picture of what we are doing with Git:

<p align="center">
<img src="/images/git_flow.png", width="80%">

[Image from blog post by Vassilis Kehayas](https://neurathsboat.blog/post/git-intro/)
</p>

-------------------------------------------------------------------------------------------------------------
## An Updated Git-based Work Cycle
Now that we have set up a remote repository, let's revisit our Git-based work cycle.

Here's what I do every time I sit down to work on a project that I'm tracking with Git:
1. `git pull` -- Pull changes from the remote repository. I do this even if I haven't changed anything just to be safe and make it a habit.
2. `git log` -- Remind myself of my recent activity in the repository. What are my recent commits?
3. Do some work.
4. `git status` -- Remind myself of the work I just did, in broad strokes (files added, deleted, or modified).
6. `git diff` -- Remind myself of the work I just did, in terms of the specific changes made.
7. `git add <file>` -- Once I'm sure I want to commit changes to a given file, I add the file to the staging area.
8. `git commit --message "..."` -- Commit all the changes that I have added to the staging area with a clear message.
 - Repeat steps 3-8 as necessary
9. `git push` -- When I'm done, I push the changes to my remote repository.

-------------------------------------------------------------------------------------------------------------
## Terminology Covered
- **origin** -- The reference point to use when linking a local and a remote repository. Almost always the remote repository. When syncing the two repositories, one will always be considered as ahead or behind the origin.

## Commands Covered
- `git remote add origin [URL]` -- Associate your local repository with the remote repository found at the [URL]
- `git push --set-upstream origin master` (`git push -u origin master` for short) -- If your local repository exists before your remote repository, use this to "push" the local repository into the remote repository **for the first time** (see `git push` below)
- `git pull` -- "Pull" the state of the remote repository into your local repository
- `git push` -- "Push" the state of your local repository into the remote repository

## Guides and Resources
[Tell Git to ignore certain files with .gitignore](https://help.github.com/en/github/using-git/ignoring-files)

[More about repository licenses](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/licensing-a-repository#disclaimer)
