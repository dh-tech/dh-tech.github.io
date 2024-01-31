---
title: Just sending email notifications
date: 2020-08-14
thumbnail: /images/posts/DigInG-logo.png
featureImage: /images/posts/DigInG-logo.png
featureImageCap: "credit: Adhvik Madhav Yeleswarapu, Digital Innovation Group logo"
featureImageAlt: "logo for DigInG: Digital Innovation group"
author: Julia Damerow
url:
published: true
summary: "I love my job. It is very interesting and challenging, I get to learn new things all the time, and some semesters I teach, which I enjoy a lot. Some days, however, are like 2020, you just want them to end."
tags:
- ADayInTheLifeOf
aliases:
- /blog/2020-08-14-damerow-emails/
- /blog/2020/08/14/Just-sending-email-notifications/
---

I work as a scientific software engineer at Arizona State University (ASU). I head the [Digital Innovation Group](http://diging.asu.edu/) (or short DigInG) that develops software for historians and philosophers of science. I started this group when I was a graduate student together with another PhD student and besides a pause of about a year when I was working outside of academia after I graduated, DigInG has been a big part of my work life. Besides me, the group consists of one other software engineer and between ten to fifteen student workers. Our student workers help with software development and research related tasks such as data collection, annotation, etc.

The software applications we develop are mostly Java and Spring-based. We have some Python/Django apps, but we try to keep their number to a minimum. In my experience, they always give us more trouble than the Java apps (I’m happy to rant about them to anyone who wants to listen to my frustrations ;). Our code is hosted on GitHub and we more or less follow the Gitflow workflow in our projects. We organize the work that needs to be done via Jira tickets, and our student workers pick up tickets, create new branches for them, and make pull requests when they are done. The usual.

A while back, I’ve decided to put all user management related functionality from one of our projects into their own jar so we can easily reuse it, since pretty much all our apps need a user management. I called it simple-users, put it into GitHub and Maven Central, and that was it. We made some changes to it over time, since it started out pretty basic, but it kept working well in our projects. Recently, one of our student workers worked on including simple-users into one of our new apps. He made the necessary configurations, added the necessary templates and controllers, and opened a pull request. When reviewing pull requests, I first look at the code changes before I tell our Jenkins instance to deploy the changes to our development server. Once deployed, I test the code in the application. The code changes seemed fine, so I changed the Jenkins configuration for the deployment job to include email provider information, which is needed for email notifications, and let Jenkins deploy the application.

To briefly interrupt my exciting story, that’s a feature that I love about Jenkins! I can tell it to run certain jobs simply by making a comment on the pull request. For example, Jenkins won’t run any jobs until I tell it so by making a comment. The default comment is “test this please,” which has confused student workers at times as they thought I was telling them to test their code. Especially, when code changes lead to database changes, I often don’t want to deploy an application right away but only after I reviewed the changes. One of our projects has some integration tests that I usually only want to run right before it’s ready to be merged, since they take a little longer to finish. In that case I can use a different comment that will only trigger the integration test job.

Anyways, back to the story. The deployment went fine and I went to the application to test the changes. I created a new user and then started the reset password process of that user. I was waiting for an email. Nothing. I went back to the pull request, and looked at the code again. This time I saw that there were some annotations missing that were necessary to read the email provider properties into the Spring configuration bean. I made a comment on the pull request and closed it.

After a little while the pull request was reopened with the required changes. Jenkins deployed the application, I tested it, and this time I got an exception that the connection was reset. I double-checked that the email provider configuration was right and checked with my student worker that it worked locally for them. It did when using [fakeSMTP](http://nilhcem.com/FakeSMTP/). I logged on to our development server and checked the logs to see if there was anything else that would give a hint what went wrong. Nothing.

So, I pulled the pull request to my laptop and ran it locally to be able to debug it. Using the configuration for the email service we use to send emails, I could reproduce the exception. Progress, even if just half a centimeter. I debugged it but still couldn’t find out why it wasn’t working. Everything seemed correct. I tried the same configuration that we use for one of our other apps for which emails have been sent fine in the past, and I got the same exception. I tried sending emails through the email service using their API and that worked; the issue was not on their end.

Finally, I had the glorious idea to update the version of javax.mail. We were using 1.4.7 but the latest version is 1.6.2. And who would have thought, emails were sent just fine. Bottom line, I don’t know what the actual root cause for the issue was, but it seems like the email service provider changed something recently, which made the older version of javax.mail fail to create a connection. Since our apps are used by a limited number of people that typically don’t reset their passwords very often, we probably just haven’t run into that issue with any of our other applications yet.

I pushed the updated version of simple-users to GitHub and started the Jenkins job to release it in Maven Central. Of course, this failed, why wouldn’t it. Apparently Sonatype had some issues that day, which made the maven goal that would publish simple-users fail. I ended up with a staged release in Maven Central, and a half updated pom.xml. So, I released simple-users by hand, fixed the pom.xml, and finally made a comment for my student worker on the pull request to update the version of simple-users.

I looked at my watch. Hey, it was only noon! Time for our daily standup. I work remotely from the East Coast, which means I am two or three hours ahead of Arizona (depending on the time of year since Arizona does not have daylight savings time). It was only 9am in Arizona. My afternoon would probably bring more code reviews, some writing for papers I was working on, and maybe I would be able to get some coding done. Whatever it would be, I was just hoping it would be better than hunting down bugs just to find out that all that was needed was one tiny change in a pom file… It turned out it would be worse, but that is a story for another day.
