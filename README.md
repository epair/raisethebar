# Raisethebar
![Build Status](https://codeship.com/projects/a4f475f0-2500-0134-2db6-0e3391f87f23/status?branch=master)
![Code Climate](https://codeclimate.com/github/emilyp13/raisethebar.png)
![Coverage Status](https://coveralls.io/repos/emilyp13/raisethebar/badge.png)


RaiseTheBar
README
Heroku URL: https://intense-eyrie-92860.herokuapp.com/
Authors:
- Mia Buckland
- Frank Cardillo
- Perry Fitz
- Emily Pair
- James Thomas

INTRO:

RaiseTheBar is a fully featured bar-review app with a focus on practical information about bars and their pro’s and con’s. Content is entirely user generated, and intended to be an crowdsourced review site.

Features:

Members can create a bar, write reviews and also see other peoples reviews.

Members can upvote or downvote existing reviews reviews, as well as see an average rating of each bar.

A non member can view a list of bars, as well as reviews, but cannot post or upvote reviews without making an account.

Authenticated users (members) can create profiles for bars, as well as review them. They must choose a rating from 1-5 stars for Price and Overall Rating.

Admin permissions allow for an admin user to see a list of users, and delete/edit each user. They also can view a list of bars, and delete a bar and the reviews associated with it.


Technology:
Devise:
User Authentication
User Authorization

Testing:
Capybara
Rspec
Selenium

API integration for our voting model

Carrier Wave:
Photo upload for bars and users

Mailcatcher for email tests

SendGrid for our Email Server.

Heroku app is running on Puma

AWS S3
