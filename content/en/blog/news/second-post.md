
---
title: "Introducing Hub-tool - A New Hub CLI under Docker Desktop 3.0.0"
linkTitle: "Introducing Hub-tool - A New Hub CLI under Docker Desktop 3.0.0"
date: 2021-02-01
description: >
  Introducing Hub-Tool 
---

Docker Desktop is the preferred choice for millions of developers building containerized applications. With the latest Docker Desktop Community 3.0.0 Release, a new Hub CLI tool was introduced, right called Hub-tool. The new Hub CLI tool lets you explore, inspect, and manage your content on Docker Hub as well as work with your teams and manage your account. In nutshell, Hub-tool is Docker's official command-line tool that makes docker easier to use with Docker Hub.

Capabilities of Hub-tool
Manages Your Docker Hub Account
Manages Your Docker Hub Org
Manages Your Personal Access Tokens
Manages Your Docker Hub Repositories
Manages Your Docker Hub Tags
Here's a quick glimpse of Docker's Hub-tool:

Verifying Hub-tool version
% hub-tool version
Version:    v0.2.0
Git commit: 0edf43ac9091e7cac892cbc4cbc6efbafb665aa4
Logging in to DockerHub
% hub-tool login
Username: ajeetraina
Password: 
Login Succeeded
Hub-tool Manpages
% hub-tool --help
A tool to manage your Docker Hub images
Usage:
  hub-tool
  hub-tool [command]
Available Commands:
  account     Manage your account
  help        Help about any command
  login       Login to the Hub
  logout      Logout of the Hub
  org         Manage organizations
  repo        Manage repositories
  tag         Manage tags
  token       Manage Personal Access Tokens
  version     Version information about this tool
Flags:
  -h, --help      help for hub-tool
      --verbose   Print logs
      --version   Display the version of this tool
Use "hub-tool [command] --help" for more information about a command.
Managing Your Account
ajeetraina@Ajeets-MacBook-Pro ~ % hub-tool account info
Username:   ajeetraina
Full name:  Ajeet Singh Raina
Company:    Dell
Location:   India
Joined:     6 years ago
Plan:       free
Limits:
  Seats:        1
  Private repositories: 5
  Parallel builds:  5
  Collaborators:    unlimited
  Teams:        unlimited
hub-tool account rate-limiting
Unlimited
Manage repositories
hub-tool repo ls | wc -l
     102
Manage organization
hub-tool org ls               
NAMESPACE    NAME    MY ROLE    TEAMS    MEMBERS
collabnix            Owner      1        1
Managing Personal Access Token
ajeetraina@Ajeets-MacBook-Pro ~ % hub-tool token
Manage Personal Access Tokens
Usage:
  hub-tool token [flags]
  hub-tool token [command]
Available Commands:
  activate    Activate a Personal Access Token
  create      Create a Personal Access Token
  deactivate  Deactivate a Personal Access Token
  inspect     Inspect a Personal Access Token
  ls          List all the Personal Access Tokens
  rm          Delete a Personal Access Token
Flags:
  -h, --help   help for token
Global Flags:
      --verbose   Print logs
ajeetraina@Ajeets-MacBook-Pro ~ % hub-tool token ls      
DESCRIPTION      UUID                                    LAST USED       CREATED     ACTIVE
token for ECS    f7XXXXXXXX4f5d    5 months ago    5 months    true
