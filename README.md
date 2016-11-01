![MacDown logo](https://media.glassdoor.com/sql/459214/general-assembly-squarelogo-1389133751210.png)

# Read Me    


Hello there! I’m **Emilio Gomez**, and this is a Read Me file of my Final project of my Web Development Inmersive Program: Boozt.

Let me introduce the project!

</br>


![MacDown logo](http://i67.tinypic.com/8yajxf.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</br>
**Bright up the world one boozt at a time**

## How it works

**Boozt** is a web platform tht looks to create going chain of good with people using the platform to boozt themselves and others when they least expect it. The best gift is the one you receive when you’re not expecting it and Boozt will remind people that this gift/boozt can help you to change your mood and your state of mind which has a direct correlation with the outcomes of everything you do..


**Insight behind the idea**<br>
People go through their days in auto mode and carry around their problems and issues and they bring this state of mind into their day to day activities. A simple change in your mood and though system can change completely how you approach what you’re doing after. However, people get caught up on this auto mode and don’t usually take time to stop, relax, have a good laugh and change their thoughts and state of mind. That’s were BooztMe comes in.


</br>


## Technologies used

**Ruby on Rails** was the main framework as most of the app works from the server side.  

**MVC** system for a leaner and more efficient code

**Javascript** was used to provide all the functionality

**Twilio API** was used for the SMS and MMS text sent to users

**Giphy API**

**Meme Central**

**Heroku** for website deployment and hosting plus the Heroku Scheduler for the cron job workers that run the code on the server

**JQuery** library was used to run certain EventListeners from the Materialize Library

**CSS** was usde for the look & feel of the site

**MaterializeCSS** library was the main source for styling

**Animate.css** was used to add animation on some elements

**Moqups** was used to create the game wireframe

</br>


## User Stories and the planning process

**User Stories / User path**

**Home Page**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User starts at the home page that shows blocks explaining what boost is all about, the functionality of what they can do and use once they become members and sees two different buttons for joining the web page: sign up through Facebook or through Email. User will always find a navbar with links to a log_in in case it’s a returning user, an about page with more detail with the mission, vision and reason behind Boozst and a How it works link.

**Returning User**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User clicks on the link in the navbar and gets redirected to a sign in form. If the user is already logged in and he/she chose to join BooztMe via Facebook then he/she will be redirected without needing to sign in. After successful sign in process, user will be redirected to his/her user profile page.

**New User**<br>
1) User sign up using Facebook Messenger:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;After clicking in the Facebook sign up button on the Home page, user will get redirected to a new web page were we inputs its Facebook name and password if no cookies provide that the user is already logged in into his Facebook account. Then a Facebook modal will pop up asking the user if he allows permission for BooztMe to have access to his/her profile information. If user declines then he/she gets redirected to the sign in page to try signing up via email. If he accepts then user will get redirected to a form to add his/her Boozt set up.

2)  User sign up using Email:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;After clicking in the Email sign up button or being redirected after declining to provide Facebook access, the user will see a form to input his/her first_name, last_name, email and password. Validations will occur to ensure email uniqueness. Upon successfully submitting the sign up form, user gets redirected to a form to add his/her Boozt set up.

**BooztMe set up form**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;After successfully a successful sign up either by Facebook login or email login, user will find a form to capture  his/her time slot in which he/she wants to receive a boozt or choose to do it randomly between 8 am and 8 pm. Additionally, include the frequency and amount of boost he/she want to receive or choose to try a random set up. Finally, user decides how he/she wants to receive his/her boots (default is Facebook Messenger). User submits his/her selection and gets redirected to his/her profile page

**Profile Page**<br>
1)  First time user:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upon completing his/her BooztMe set up form, user gets redirected to his/her profile which includes a tab container with Boozt examples (featured boozts) in the default tab, user profile in the second tab and friends in a third tab (ice-box feature). The featured boosts only appear when the user hasn’t received any boozts. This will get replaced once the user has been sent at least one boozt.

2)  Returning user:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upon login in, user gets redirected to his/her profile which includes a tab container with the Boozts he/she has been sent in the default tab, user profile in the second tab and friends tab in a third tab (ice-box feature)
</br>More details on the user stories can be found [here](https://trello.com/b/k4N2javU/boozt-me-app) in the Trello board.


Now you're ready to discover what Boozt is all about 
[here](www.booztme.com).

</br>


## Additional Information
### ICE BOX Features
-  Facebook Messenger for additional option to send content
-  Facebook OAuth
-  Send friends a Boozt

### Shout out
 
This has been 3 of the best months of my life and I am super greatful with everyone involved in this experience, from the consultants, to the students, the producers, TAs, outcomes team, everyone. This trully has been an amazing experience and I am super excited for what is coming for each one of us graduating today.

Special thanks to the consultans and Annabelle for all their help during this project.