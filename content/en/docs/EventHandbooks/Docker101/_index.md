---
title: "Docker101"
linkTitle: "Docker101"
weight: 30
description: >-
     Docker Workshops for Beginners
---

## Docker101 Workshop Handbook

This handbook will help you run a Docker 101 workshop from A to Z. This will cover every aspect of conducting workshop starting from setting up an event page till the completion of the successful workshop. 

### Characteristics of this workshop

- Audience : 5 to 100
- Technical Skills Required : Basic knowledge of Linux, Basic concepts of Docker
- Length : 8 hours (including coffe and lunch breaks)


## Checklists 

### Before the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | [Getting Familiar with Bevy Virtual](#getting-familiar-with-bevy-virtual) |  ☑️ |
2 | [Planning an Event Agenda](#planning-an-event-agenda) |  ☑️ |
3 | [Setting up Event Registration Page](#setting-up-event-registration-page) | ☑️ |
4 | [Sending confirmation email for workshop](#sending-confirmation-email-for-workshop) |  ☑️ |

### During the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
5 | [Conducting Attendee Survey](/housekeeping/attendeesurvey/README.md) |  ☑️ |

### After the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
6 | [Post-Event FollowUp](/housekeeping/postevent/README.md) |  ☑️ |
7 | [Community Leader Survey](/housekeeping/clsurvey/README.md)  |  ☑️ |
8 | [Attendee Survey](/housekeeping/attendeesurvey/README.md)  |  ☑️ |

## Recommended Agenda

| Description | Timing |
| --- | --- |
| Welcome | 8:45 AM to 9:00 AM |
| [Creating a DockerHub Account](dockerhub/dockerhub.md) | 9:00 AM to 9:15 AM |
| [Getting Started with Docker Image](#getting-started-with-docker-image---1-hour) | 9:15 AM to 10:15 AM |
| [Accessing & Managing Docker Container](#accessing--managing-docker-container---1-hour) | 10:15 AM to 11:15 AM |
| Coffee/Tea Break | 11:15 AM to 11:30 AM |
| [Getting Started with Dockerfile - Part 1](#getting-started-with-dockerfile---3-hours) | 11:30 AM to 1:00 PM|
| Lunch | 1:00 PM to 2:00 PM |
| [Getting Started with Dockerfile - Part 2](#getting-started-with-dockerfile---3-hours)| 2:00 PM to 3:30 PM |
| [Creating Private Docker Registry](#creating-private-docker-registry---30-min) | 3:30 PM to 4:00 PM|
| [Docker Volumes](#docker-volumes---30-min) | 4:00 PM to 4:30 PM |
| Coffee/Tea Break | 4:00 PM to 4:30 PM |
| [Docker Networking](#docker-networking---1-hour) | 4:45 PM to 5:45 PM |
| Quiz/Prize/Certificate Distribution | 5:45 PM to 6:00 PM |



## Pre-requisite:

- [Creating Your DockerHub Account](dockerhub/dockerhub.md) - 15 min

### Getting Started with Docker Image - 1 hour

- [Running Hello World Example](/helloworld/README.md)  
- [Working with Docker Image](/beginners/workingwithdockerimage/workingwithdockerimage.md) 
- [Saving Images and Containers as Tar Files for Sharing](/beginners/saving-images-as-tar/README.md)
- [Building Your First Alpine Docker Image and Push it to DockerHub](/building/building-your-first-alpine-container.md)
- [Test Your Knowledge](/beginners/quiz1/README.md)

###  Accessing & Managing Docker Container - 1 hour

- [Accessing the Container Shell](/beginners/accessing-the-container/README.md)
- [Running a Command inside running Container](/beginners/running-command-inside-running-container/README.md)
- [Managing Docker Containers](/beginners/managing-containers/README.md)
- [Test Your Knowledge](/beginners/quiz2/README.md)

### Getting Started with Dockerfile - 3 hours

- [What is a Dockerfile?](/beginners/dockerfile/what-is-dockerfile/README.md)
- [Understanding Layering Concept with Dockerfile](/beginners/dockerfile/layering-dockerfile/README.md)
- Creating Docker Image with
   - [Installing GIT](/beginners/dockerfile/lab-create-image/01-with-git.md)
   - [ADD instruction](/beginners/dockerfile/lab-create-image/02-with-ADD.md)
   - [COPY instruction](/beginners/dockerfile/lab-create-image/03-with-COPY.md)
   - [CMD instruction](/beginners/dockerfile/lab-create-image/04-with-CMD.md)
   - [ENTRYPOINT instruction](/beginners/dockerfile/lab-create-image/05-with-ENTRYPOINT.md)
   - [WORKDIR instruction](/beginners/dockerfile/lab-create-image/06-with-WORKDIR.md)
   - [RUN instruction](/beginners/dockerfile/lab-create-image/07-with-EXPOSE.md)
   - [ARG instruction](/beginners/dockerfile/lab-create-image/08-with-ARG.md)
   - [ENV instruction](/beginners/dockerfile/lab-create-image/09-with-ENV.md)
   - [VOLUME instruction](/beginners/dockerfile/lab-create-image/10-with-VOLUME.md)
   - [EXPOSE instruction](/beginners/dockerfile/lab-create-image/11-with-EXPOSE.md)
   - [LABEL instruction](/beginners/dockerfile/lab-create-image/12-with-LABEL.md)
   - [ONBUILD instruction](/beginners/dockerfile/lab-create-image/13-with-ONBUILD.md)
   - [HEALTHCHECK instruction](/beginners/dockerfile/lab-create-image/14-with-HEALTHCHECK.md)
   - [SHELL instruction](/beginners/dockerfile/lab-create-image/15-with-SHELL.md)
   - [USER instruction](/beginners/dockerfile/lab-create-image/16-with-USER.md)
- [ENTRYPOINT vs RUN](/beginners/dockerfile/entrypoint-vs-run/)
- [Writing Dockerfile with Hello Python Script Added](/beginners/dockerfile/lab_dockerfile_python/)
- [Test Your Knowledge](/beginners/dockerfile/quiz3/README.md)

### Creating Private Docker Registry - 30 min

- [Building a Private Docker Registry](/beginners/docker-registry/README.md)
- [Test Your Knowledge](/beginners/docker-registry/quiz4/README.md)

### Docker Volumes - 30 min

- [Managing volumes through Docker CLI](/beginners/volume/manage-via-cli/README.md)
- [Creating Volume Mount from **docker run** command & sharing same Volume Mounts among multiple containers](/beginners/volume/with-docker-run/README.md)
- [Test Your Knowledge](/beginners/volume/quiz5/README.md)

### Docker Networking - 1 hour

 - [The docker network Command](/beginners/networking/using-docker-network/README.md)
 - [Lab #1: Listing the Networks](/beginners/networking/using-docker-network/A1-network-basics.md#step-2-list-networks)
 - [Lab #2: Inspecting a Network](/beginners/networking/using-docker-network/A1-network-basics.md#step-3-inspect-a-network)
 - [Lab #3: List network driver plugins](/beginners/networking/using-docker-network/A1-network-basics.md#step-4-list-network-driver-plugins)
 - [Lab #4: Docker Bridge Networking](/beginners/networking/using-docker-network/A2-bridge-networking.md)
   - [Lab #5: Basics of Docker Bridge Networking](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-1-the-default-bridge-network)
   - [Lab #6: Connect a Docker container to bridge network](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-2-connect-a-container)
   - [Lab #7: Test Network Connectivity](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-3-test-network-connectivity)
   - [Lab #8: Configure NAT for external connectivity](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-4-configure-nat-for-external-connectivity)
 - [Test Your Knowledge](/beginners/networking/quiz6/README.md)


## Getting Familiar with Bevy Virtual

Docker community leaders uses Bevy (https://events.docker.com) tool to conduct virtual Meetup events. Bevy is the tool that provides the MOST features to your Community, including:

- 2 way integration with Meetup.com (create your event in Bevy and it posts to your meetup page and RSVPs from your event on meetup sync with your Bevy events.docker.com page).
Note: The RSVP limits you set in Bevy do not translate to meetup. The best way to handle this is to keep a watchful eye on both platforms or communicate that seats are first come first serve. 

- Ability to check in guests.
- Mobile App
- RSVP as Guest
- Forms / Surveys
- Automatic Emails (customizable) 

It's important for all community leaders to be familiar with this tool to conduct virtual events successfully.


### Chapters | Events |  Analytics


- [Create a Chapter](https://help.bevylabs.com/article/454-create-a-chapter)
- [Create a new event](https://help.bevylabs.com/article/344-create-a-new-event)
- [Virtual Event Type](https://help.bevylabs.com/article/428-virtual-event-type)
- [Manage chapter members](https://help.bevylabs.com/article/389-manage-chapter-members)



### Bevy Virtual 

- [Using Bevy Virtual](https://help.bevylabs.com/article/457-using-bevy-virtual)
- [How to create a test event in Bevy Virtual](https://help.bevylabs.com/article/496-test-event-in-bevy-virtual)
- [Record in Bevy Virtual](https://help.bevylabs.com/article/470-record-in-bevy-virtual)
- [Screensharing in Bevy Virtual](https://help.bevylabs.com/article/492-screensharing-in-bevy-virtual)
- [Breakout Rooms](https://help.bevylabs.com/article/495-breakout-rooms)
- [Chat, DM's & Features](https://help.bevylabs.com/article/519-chat-features)


## Planning an Event Agenda

- Your event must be posted on your [city’s Chapter page](https://events.docker.com/chapters/)
- Try to create event 1 month before the event
- If you are unsure of how to use your chapter page [please watch this video](https://drive.google.com/file/d/1ld54sqzTTBMiygUzsjRD7B10XzWozbMl/view?usp=sharing)
- If you are having issues with your page, do not have a page or need admin permissions please contact William over Docker community Slack or send email to william.quiviger(AT)docker.com


## Setting up Event Registration Page

Every Community leader is expected to set up event registration page. While building an event registration page, ensure that the below list of information are captured:

- Title of the workshop
- Date of the workshop
- Short Description of the workshop
- Format of the workshop(whether it will be LIVE or recorded)
- Level of the audience(Beginners/Intermediate/Advanced)
- Name of the speakers
- A Form which ask users to supply:
   - First Name
   - Last Name
   - Email Address
   - Company Name
   - Job Function
   - Country
   
## Sending confirmation email for the workshop

Once the user register for the event, Community Leaders need to ensure that the interested users should receive a confirmation email.

- A Thank you message for registering for this event 
- Ensure that the registered user should be able to add the events date to their calendar
- The email should carry workshop title and date of the workshop
- Gentle reminder as the date of workshop come closer

### Sample Confirmation email for the workshop

## Post-Event Follow-up

### #1  Send a Thank You email 

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | “Thank you for attending” post on the social media channels |  ☑️ |
2 | "Thank you" email to all those who registered and attended the event |  ☑️ |
3 | Share the pics you took during the event and share it on social media(LinkedIn, Twitter, Facebook Public Docker Group etc |  ☑️ |
4 | Send thanks email to sponsor/vendors if this workshop is part of the Meetup event. |  ☑️ |
5 | Thank core team and volunteers who helped you with the workshop |  ☑️ |


### #2 Post-event Review

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | Sit down with your team for a debrief session where you discuss how the event went |  ☑️ |
2 | Consider inviting at least some of the volunteers.  |  ☑️ |
3 | Evaluate whether the event was a success according to whatever goals you’ve set |  ☑️ |
4 | Have an open discussion about what worked well and what could be done better the next time around. |  ☑️ |
5 | Sit down with your team for a debrief session where you discuss how the event went |  ☑️ |



### #3 Ask for feedback

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | While the event is still fresh in everyone’s mind, get their feedback about it. |  ☑️ |
2 | Be straightforward. Collect input is to send out an email link to a survey that people can fill out online.  |  ☑️ |
3 | Pick the one you like. If you can, add an incentive (free tickets to your next events, chance to win a gift card, and the like.).  |  ☑️ |
4 | Having everyone fill out the same survey makes it easy to compare their input and spot trends and areas that need improvement.   |  ☑️ |


### #4  Follow up on social media

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 |Online chatter about your event won’t immediately quiet down after the event is over. |  ☑️ |
2 |Follow the conversation and jump in where it make sense to chip in with your input, thank the guests, or answer questions.  |  ☑️ |
3 |Engaging in post-event social media chatter and keeping the buzz going will also help you build audience for your next event.  |  ☑️ |
4 |Online chatter about your event won’t immediately quiet down after the event is over. |  ☑️ |



### #5 Start planning your next event

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 |Start putting all of that to good use and begin jotting down ideas for your next fantastic event |  ☑️ |



