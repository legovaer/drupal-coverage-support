# Drupal Automiser

This tool will prepare your Drupal module's git repository for executing automated tests using Travis. As Travis CI
currently doesn't support Drupal.org, this tool will setup some GIT hooks which will keep your GitHub repository
completely in sync with your Drupal.org repository. This allows you to use all the tools which work along with GitHub
without concerning about abandoning drupal.org.


## Before you begin

* Make sure that you start with a complete blank GitHub repository. Don't add a license or a README.md file.
* Add Travis as a service to your GitHub repository:
  1. Go to the homepage of your repository
  2. Click on '**Settings**' at the top menu
  3. Go to '**Webhooks & services**' in the menu at your right hand side
  4. In the '**Services**' section, click on '**Add service**'
  5. Select '**Travis CI**' from the list.
* As soon as your service has been setup, head to [Travis CI](https://travis-ci.org) and enable your repository:
  1. Create an account (If you don't already have one)
  2. Go to your profile page by clicking on your name at the top right corner.
  3. Enable your repository in the list.


## Installation

**WARNING: Make sure you don't execute the setup.sh script more then once.** 

1. Clone this project into the root of your module repository.
2. Update the configuration file `config.data`
3. Excute the setup script:
   `$ sh setup.sh`


## Other branches

**WARNING: Make sure you don't execute the setup.sh script more then once.** 

If your module supports multiple Drupal versions and thus you have multiple release branches, you will have to
initialise your GIT hooks for every separate branch. You will only need to do this once as the hooks will be added to
future branches automatically.

Initialising the hooks is rather easy:

1. Clone this repository into the root of your module.
2. Update the configuration file `config.data`
3. Execute the init-hooks script:
   `$ sh init-hooks.sh`
   
## Next steps
Add a `.travis.yml` file and Travis CI will automatically start building as soon as you commit changes to the drupal.org
repository.