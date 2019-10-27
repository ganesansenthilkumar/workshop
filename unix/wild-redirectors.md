
<hr>
<center>This is part 3 of 5 of an <a href="/unix/index.md" target="_blank">introduction to Unix</a>. </center>
<hr>

<br>

> **Things covered here:**
> * Redirectors
> * Wildcards
> * History

---
<br>

# Redirectors and wildcards

>To be sure we are still working in the same place, let's run:
>```bash
>cd ~/Desktop/workshop/unix_intro
>```

## Redirectors
When we are talking about "redirectors" here, we are referring to things that change where the output of something is going. The first we're going to look at is called a "pipe" (**`|`**).

> A pipe (**`|`**) is used to connect multiple commands. It takes the *output* from the previous command and "pipes" it into the *input* of the following command.

Let's look at an example. Remember we used **`wc -l`** to count how many lines were in a file:

```bash
wc -l example.txt
```

And that **`ls`** lists the files and directories in our current working directory:

```bash
ls
```

If we "pipe" (**`|`**) the **`ls`** command into the **`wc -l`** command, instead of printing the output from **`ls`** to the screen as usual, it will go into **`wc -l`** which will print out how many items there are:

```bash
ls | wc -l
```

For another example, let's look at what's in the subdirectory, "data/all_samples/":

```bash
ls data/all_samples/
```

That prints out a lot of stuff, let's see how many things are in that directory:

```bash
ls data/all_samples/ | wc -l
```

We'll get back to making sense of that when we get to *wildcards* in the next section.  

> Another important character is the greater than sign, **`>`**. This tells the command line to *redirect* the output to a file, rather than just printing it to the screen as we've seen so far.

For an example of this we will write the output of **`ls`** to a new file called "directory_contents.txt":

```bash
ls
ls > directory_contents.txt
```

Notice that when we redirect the output with the **`>`**, nothing printed to the screen. And we've just created a file called "directory_contents.txt":

```bash
ls
head directory_contents.txt
```

**It's important to remember that the `>` redirector will overwrite the file you are pointing to if it already exists.**

```bash
ls experiment/ > directory_contents.txt
head directory_contents.txt
```

If we want to append an output to a file, rather than overwrite it, we can use two of them instead, **`>>`**:

```bash
ls >> directory_contents.txt
head directory_contents.txt
```

## Wildcards
> Wildcards as used at the command line are special characters that enable us to specify multiple items very easily. The **`*`** and **`?`** are probably the most commonly used, so let's try them out!

<h3>The asterisk (<b>*</b>)</h3>

As we've seen, **`ls`** lists the contents of the current working directory, and by default it assumes you want everything:

```bash
ls
```

But we can be more specific about what we're interested in by giving it a positional argument that narrows things down. Let's say we only want to look for files that end with the extension ".txt". The **`*`** wildcard can help us with that.

Here's an example:

```bash
ls *.txt
```

What this is saying is that no matter what comes before, if it ends with ".txt" we want it.

> At the command line, the **`*`** means any character, any number of times (including 0 times).

For a more practical example, let's change directories into that messy subdirectory we saw earlier:

```bash
cd data/all_samples/
ls
ls | wc -l
```

So there are 900 files here, and it looks like there are 3 different extensions: ".txt"; ".tsv", and ".fq" (a common extension for the "fastq" format, which holds sequences and their quality information).

> <center><b>QUICK PRACTICE!</b></center>

<br>

> With 900 files and 3 file types (".txt", ".tsv", and ".fq"), we might expect there to be 300 of each type, but let's make  sure. Using what we've seen above, how can we count how many files of each type there are in this directory?

<br>

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  ls *.txt | wc -l
  
  ls *.tsv | wc -l
  
  ls *.fq | wc -l
  ```

  </p>
</details>

<br>

Ah good, it's nice when things make sense 🙂


So far we've just been using the **`*`** wildcard with the **`ls`** command. But wildcards can be used with many of the common Unix commands we've seen so far.

For example, we can use it with the **`mv`** command to move all 300 of the ".fq" files into their own directory at once:

```bash
ls | wc -l

mkdir fastq_files
ls fastq_files/

ls *.fq
mv *.fq fastq_files/

ls fastq_files/

ls | wc -l
```

<center><b>QUICK QUESTION!</b></center>

Why does this say 601 instead of 600?

<br>

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  It's also counting the new directory we created 🙂
  ```

  </p>
</details>

 
> **Note:** When using wildcards, running **`ls`** first like done in the above example (**`ls *.fq`**) is good practice before actually running a command. It is a way of checking that we are specifying exactly what we think we are specifying.

<br> 

### BONUS ROUND: History!

The shell also keeps track of our previous commands for us. There are a few different ways we can take advantage of this, one is by using the **`history`** command. But that alone will print all of it to the screen. It can be more practical to "pipe" (**`|`**) that into something else like **`tail`** to see the last few commands:

```bash
history | tail
```

Or **`less`** so we can scroll through our previous commands:

```bash
history | less
```

To get out of **`less`**, press the **`q`** key.

We can also use the up and down arrows at the command line to scroll through previous commands. This is useful for finding commands, but it's also useful for making sure we are acting on the files we want to act on when using wildcards. As mentioned above, we can check first with **`ls *.fq`**, press **`return`** to see we are acting on the files we want, and then press the up arrow to bring up the previous command, and change it to what we want without altering the "*.fq" part of the command – as we already know it's correct. Any time we can remove the chance of human error, we should 🙂

<center><b>QUICK PRACTICE!</b></center>

<br>

We've already moved all the ".fq" files into their own directory. Create separate directories for the ".txt" files and the ".tsv" files too, and then try to move those files into their appropriate directories.

<br>

<details>
  <summary>Solution</summary>
  <p>

  ```bash
  mkdir text_files
  ls *.txt
  mv *.txt text_files

  mkdir tsv_files
  ls *.tsv
  mv *.tsv tsv_files

  ls
  ```

  </p>
</details>


It doesn't matter what the directories are named, but at the end they should be the only 3 things in the working directory 🙂

<br>

<h3>The question mark (<b>?</b>)</h3>

> At the command line, the **`?`** wildcard represents *any* character that appears *only one time*.

To see how this can be needed at times when the **`*`** won't do, let's change into the "fastq_file" subdirectory:

```bash
cd fastq_files/
```

And let's say we wanted only the ".fq" files for samples 10-19. If we tried to grab those with the **`*`**, we'd get more than we wanted:

```bash
ls sample_1*.fq
```

Because the **`*`** allows for any character *any number* of times, it is also grabbing those in the 100s. But if we use the **`?`** wildcard, which only allows any character *one time*, we get only the samples we want:

```bash
ls sample_1?.fq
```



---
<br>

# Summary
They may seem a little abstract at first, but redirectors and wildcards are two fundamental concepts of working at the command line that help make it a very powerful environment to work in. Just knowing they exist and generally what they do means that we can learn more about them when needed 🙂

<h4><i>Special characters introduced:</i></h4>

|Character     |Function          |
|:----------:|------------------|
|**`Pipe`**     |a "pipe" allows stringing together multiple commands|
|**`>`**      |sends output to a file (**overwrites** target file)|
|**`>>`**      |sends output to a file (appends to target file)|
|**`*`**      |represents any character appearing any number of times|
|**`?`**      |represents any character appearing only once|

<br>

---
---

<h5><a href="/unix/working-with-files-and-dirs.md" style="float: left"><b>Previous:</b> 2. Working with files and directories</a>

<a href="/unix/six-glorious-commands.md" style="float: right"><b>Next:</b> 4. Six glorious commands</a></h5>
