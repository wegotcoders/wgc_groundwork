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

## FAQs / Troubleshooting

* If you see this message, then you haven't set your application id and secret correctly.

```Client authentication failed due to unknown client, no client authentication included, or unsupported authentication method.```

* If the profile fails to update, you may have failed validation on We Got Coder's servers. Read the error message and see if you can alter the input to address the issue.

* If you are having trouble updating your Codecademy, ensure that you have entered the correct URL to your profile page, including the http:// part of the URL.

* If you're stuck, try deleting your cookies and starting again. There is a good plugin for chrome called Edit This Cookie that allows you to easily delete cookies.

* You can use any third-party frameworks that you wish: bootstrap, jQuery etc. but this is not necessary nor required.
