---
title: "JAVA "
linkTitle: "JAVA"
weight: 40
description: >-
     Docker Workshop for JAVA Developers
---


## What is this handbook for?

This is a community leader handbook to run "Dockerizing Your Application for JAVA" workshop. This will cover every aspect of conducting workshop starting from setting up an event page till the completion of the successful workshop. 

### Features of this workshop

- Audience : 5 to 100
- Technical Skills Required : Basic knowledge of Linux & JAVA
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
5 | [Conducting Attendee Survey](#conducting-attendee-survey) |  ☑️ |

### After the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
6 | [Post-Event FollowUp](#post-event-followup) |  ☑️ |
7 | [Community Leader Survey](#community-leader-survey)  |  ☑️ |
8 | [Attendee Survey](#attendee-survey)  |  ☑️ |

## Recommended Agenda


| Description | Timing |
| --- | --- |
| Welcome | 8:45 AM to 9:00 AM |
| [Setting up Infrastructure](#setting-up-infrastructure---30-min) | 9:00 AM to 9:30 AM |
| [Basics of Docker](#basics-of-docker---30-min) | 9:30 AM to 10:30 AM |
| [Building a Docker Image](#building-and-running-a-docker-container---1-hour) | 10:30 AM to 11:30 AM |
| Coffee/Tea Break | 11:30 AM to 11:45 AM |
| [Multi-container Application using Docker Compose](#multi-container-application-using-docker-compose---1-hour) | 11:45 PM to 1:00 PM|
| Lunch | 1:00 PM to 2:00 PM |
| [Deploy Application using Docker Swarm Mode](#deploy-application-using-docker-swarm-mode---1-hour) | 2:00 PM to 2:30 PM |
| [Docker & Netbeans](#docker--netbeans--1-hour) | 2:30 PM to 3:30 PM |
| Coffee/Tea Break | 3:30 PM to 3:45 PM |
| [Docker & IntelliJ](#docker-and-intellij-idea---1-hour) | 3:45 PM to 4:45 PM |




## Pre-requisite:

### [Setting up Infrastructure](#setting-up-infrastructure) - 30 min

- [Setup a Docker Environment](/chapters/chap01/setup.md)



### [Basics of Docker](#basics-of-docker) - 30 min
- [Main Components of Docker System](/docker/components/README.md)
- [Test Your Knowledge](/docker/quiz2/README.md)



### [Building and Running a Docker Container](#building-and-running-a-docker-container) - 1 hour
 - [Build a Docker Image](/docker/docker-image/README.md)
 - [Running a Docker Container](/docker/docker-run-container/README.md)
 - [Running a JAVA 11 Docker Container](/docker/docker-image-java/README.md)



### [Multi-Container Application using Docker Compose](#multi-container-application-using-docker-compose) - 1 hour
- [What is Docker Compose](/compose/what-is-docker-compose/README.md)
- [Configuration file](compose/what-is-docker-compose/README.md#configuration-file)
- [Start application](/compose/what-is-docker-compose/README.md#start-application)
- [Verify application](/compose/what-is-docker-compose/README.md#verify-application)
- [Shutdown application](/compose/what-is-docker-compose/README.md#shutdown-application)

### [Deploy Application using Docker Swarm Mode](#deploy-application-using-docker-swarm-mode) - 1 hour
- [Initialize Swarm](/swarm/initialize-swarm/README.md)
- [Multi-container application](/swarm/multicontainer/README.md)
- [Verify service and containers in application](/swarm/verify//README.md)
- [Access application](/swarm/access/README.md)
- [Stop application](/swarm/stop-/README.md)
- [Remove application completely](/swarm/remove/README.md)



### [Docker & Netbeans](#docker-and-netbeans)- 1 hour
- [Configure Docker Host](/netbeans/README.md#configure-docker-host)
- [Pull an Image](/netbeans/README.md#pull-an-image)
- [Run a Container](/netbeans/README.md#run-a-container)
- [Build an Image](/netbeans/README.md#build-an-image)
 


### [Docker and IntelliJ IDEA](docker-and-intelliJ) - 1 hour
- [Install Docker Plugin in IDEA](/intellij/README.md)
- [Pull an Image](/intellij/README.md#pull-an-image)
- [Run a Container](/intellij/README.md#run-a-container)
- [Build an Image](/intellij/README.md#build-an-image)


### [Docker & Eclipse](#docker-and-eclipse) - 1 hour
- [Install Docker Tooling in Eclipse](/eclipse/README.md)
- [Docker Perspective and View](/eclipse/README.md#docker-perspective-and-view)
- [Pull an Image](/eclipse/README.md#pull-an-image)
- [Run a Container](/eclipse/README.md#run-a-container)
- [Build an Image](/eclipse/README.md#build-an-image)


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
   
## Sending confirmation email for workshop

Once the user register for the event, Community Leaders need to ensure that the interested users should receive a confirmation email.

- A Thank you message for registering for this event 
- Ensure that the registered user should be able to add the events date to their calendar
- The email should carry workshop title and date of the workshop
- Gentle reminder as the date of workshop come closer

### Sample Confirmation email for the workshop

## Post-Event Followup

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




