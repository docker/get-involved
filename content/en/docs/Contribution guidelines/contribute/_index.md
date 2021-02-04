---
title: "How to contribute to "Get Involved" site"
linkTitle: "How to contribute to "Get Involved" site
weight: 100
description: >-
     How to contribute to "Get Involved" site
---


Community and participation are the backbone of Docker. Whether you're technical or not, we welcome contributions from anyone around the world. 
This page is intended for people who want to contribute content to this Docker Community repository docs and who don't use Git or GitHub often. The page is basically a quick guide to get going with a GitHub repository, using either Git on CLI or the GitHub web user interface (UI).

## Using the command line


1. Fork/Clone the docker-community-leaders/community repository:

    * Go to the [docker-community-leaders/dockercommunity](https://github.com/docker-community-leaders/dockercommunity) on GitHub.
    * Click **Fork** to make your own copy of the repository. GitHub creates a 
      copy at `https://github.com/<your-github-username>/community`.

2. Open a terminal on your local machine.

3. Clone your forked repository, to copy the files down to your local machine.
  This example creates a directory called `community` and uses SSH cloning to
  download the files:

    ```
    mkdir community
    cd community/
    git clone git@github.com:<your-github-username>/dockercommunity.git
    cd dockercommunity/
    ```

1. Add the upstream repository as a Git remote repository:

    ```
    git remote add upstream https://github.com/docker-community-leaders/dockercommunity.git
    ```

1. Check your remotes:

    ```
    git remote -vv
    ```

    You should have 2 remote repositories:

      -  `origin` - points to your own fork of the repository on gitHub -
         that is, the one you cloned your local repository from.
      -  `upstream` - points to the actual repository on gitHub.

1. Create a branch. In this example, replace `documentupdates` with any branch name
  you like. Choose a branch name that helps you recognize the updates you plan
  to make in that branch:

    ```
    git checkout -b documentupdates
    ```

1. Add and edit the files as you like. The doc pages are in the
  `/community/content/docs/` directory.

1. Run `git status` at any time, to check the status of your local files.
  Git tells you which files need adding or committing to your local repository.

1. Commit your updated files to your local Git repository. Example commit:

    ```
    git commit -a -m "Fixed some doc errors."
    ```

    Or:

    ```
    git add add-this-doc.md
    git commit -a -m "Added a shiny new doc."
    ```

1. Push from your branch (for example, `updates`) to **the relevant branch
  on your fork on GitHub:**

    ```
    git checkout documentupdates
    git push origin documentsupdates
    ```

1. When you're ready to start the review process, create a pull request (PR)
  **in the branch** on **your fork** on the GitHub UI, based on the above push.
  The PR is auto-sent to the upstream repository - that is, the one you forked 
  from.

1. If you need to change the files in your PR, continue changing them
  locally in the same branch, then push them again in the same way. GitHub
  automatically sends them through to the same PR on the upstream repository!

1. **Hint:** If you're authenticating to GitHub via SSH, use `ssh-add` to add
  your SSH key passphrase to the managing agent, so that you don't have to
  keep authenticating to GitHub. You need to do this again after every reboot.


## Using the GitHub web UI

**Note:** The GitHub web UI is suitable for quick updates to a single file. If
your update is more complex or you need to update more than one file within one
pull request (PR), then the command line provides a better experience.

Follow these steps to edit a page using the GitHub UI:

1. Sign in to GitHub if you haven't yet done so.

1. Go to the page that you want to edit on the
  [Docker Community Site](https://docker-community-leaders.github.io/dockercommunity).

1. Click **Edit this page**.

1. If this is the first time you're updating a file in the Community
  site repository, a screen opens asking you to *fork* the repository. A
  fork is a copy of the repository where you can make your updates before
  submitting them for review. You only have to fork the repository once:

    * Click **Fork this repository**.
    * If GitHub asks you **Where should we fork the site** and offers your
      username as an option, click the link on your username.	
    * Wait a few seconds while GitHub makes a copy of the repository at	
     `https://github.com/yourusername/community`. This copy is your *fork*	
     of the `docker-community-leaders/community` repository.

1. The GitHub editor interface opens for the selected page.
  Make your updates to the content.

1. Click **Preview changes** at the top of the editing area to see the effect of your changes.

1. If you need to make more changes, click **Edit file** at the top of the preview area.

1. When you are ready to submit your changes, scroll down to the 
  **Propose file change**
   section at the bottom of the editing area.

      * Enter a short description of your update. This short description becomes the 
        title of your pull request (PR).

      * In the second text box (for the extended description), enter a more detailed
        description.

1. Click **Propose file change**. A new screen appears, offering you the 
  opportunity to open a pull request.

1. Click **Create pull request**. 

1. Optionally, edit the pull request title and description.

1. Make sure **Allow edits from maintainers** remains checked.

1. Click **Create pull request** again. You have now sent a request to the repository
  maintainers to review your change.

1. Check the online preview of your changes:

      * Wait for the automated PR workflow to do some checks. When it's ready,
        you should see a comment like this: **deploy/netlify — Deploy preview ready!**
      * Click **Details** to the right of "Deploy preview ready" to see a preview
        of your updates.








