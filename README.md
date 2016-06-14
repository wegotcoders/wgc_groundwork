<p align="center">
  <img src="http://wegotcoders.com/assets/logos/WEGOTCODERS_color_linked_in.png" alt="We Got Coders" />
</p>

# Programming Challenge

This is the application that you will be using to demonstrate your preparedness for the course. If you've already applied and are ready to get started, follow the instructions below. If you haven't yet applied, please read about We Got Coders and apply on our website, http://wegotcoders.com/trainees.

## INSTALL

Follow these steps to get going.

* Prepare a folder to put your work inside. We recommend using ```projects``` in your home folder.
```mkdir ~/projects```
* Fork this repository into your own GitHub account.
* Clone a copy to your local machine.
```
  cd ~/projects
  git clone <your-git-clone-url>
```
* Change directory to your cloned workspace in the terminal. ```cd wgc_groundwork```
* We now need to install some dependencies that will make the application work. If you've not done so already, install bundler using the ```gem install bundler``` command. Then run the ```bundle``` command, and you should see a number of gems being installed (see http://bundler.io for more information on how this works).
* Update app.rb to include your OAuth application id and application secret,
which you can find on your profile page (http://wegotcoders.com/trainees/sign_in).
* Run the application using the following command: ```ruby app.rb```. Don't forget
that every time you change app.rb, you must restart the server by entering ```CTRL+C```
in the terminal, and re-run ```ruby app.rb```.
* Cut + paste this URL into your browser: ```http://localhost:4567```. You should see the We Got Coders logo and some welcome text.
* Click the authorize link. The application will retrieve your profile data from We Got Coders. You may need to sign-in with your username and password.

## TODO

Attempt the following tasks. The list is meant to be progressively more
difficult and open-ended; the aim is to demonstrate your approach when dealing with programming issues and to test your initiative. Complete as much as you can within the time limit; you will not be penalised for not finishing the list. We are looking for self-motivated effort and to see how much of the groundwork you have grasped.

Don't forget to ```git add .``` and ```git commit``` after each step, if you have made any changes to your code!

* You should see a list of the profile data that you submitted to us when you
applied to We Got Coders. Use your knowledge of HTML / CSS to redesign and
layout the page in a presentable way. Show us what you can do with:

    * Headings
    * Lists
    * Backgrounds / Gradients
    * Multiple columns

* Add an image of yourself to your profile. Add CSS where necessary to ensure that it looks presentable.

* Observe how the about field works. What makes it bound to the data from your profile? Add more fields so that you can edit your profile.

* Add a field to the form so that you can add your Codecademy account to
your profile. You will need an input text box, with the appropriate ```name``` attribute.

* Add some Javascript to the provided ```<script>``` tag in the views/index.erb file, that counts the number of words in each section. You ought to have at least twenty words for each of the questions.

* Add code to the primes.rb file, that finds the sum of all prime numbers less than one hundred. Can you refactor the implementation so that you can pass in higher numbers to act as the limit? Test your implementation by running the rspec command ```rspec```. Find the sum of all prime numbers up to two million. Add a field to your profile named ```trainees[primes_sum]``` and enter in your answer.

* Over to you! Make any adjustments that you see fit, and add a feature that you are interested in attempting. Perhaps you might:

    * Attempt a programming puzzle in Ruby, see http://projecteuler.net
    * Experiment with using JavaScript to respond to user events
    * Add some more pages and link them together

* Once you are done, submit a pull request. We will use this to review your work once you are done.

* Get buzzing! Mention @wegotcoders and tell the world why you decided to join the course and become a web developer.

## FAQs / Troubleshooting

* If you see this message, then you haven't set your application id and secret correctly.

```Client authentication failed due to unknown client, no client authentication included, or unsupported authentication method.```

* If the profile fails to update, you may have failed validation on We Got Coder's servers. Read the error message and see if you can alter the input to address the issue.

* If you are having trouble updating your Codecademy, ensure that you have entered the correct URL to your profile page, including the http:// part of the URL.

* If you're stuck, try deleting your cookies and starting again. There is a good plugin for chrome called Edit This Cookie that allows you to easily delete cookies.

* You can use any third-party frameworks that you wish: bootstrap, jQuery etc. but this is not necessary nor required.
