User
1) New user
  - Create a page to create an account (users/new)
    * Requirement: address, name
    * (users/show)
  - Edit button (users/:id/edit)
    * add address, username, name
  - Set preferences after an account has been created (users/:id/preferences/new)
    * User types e.g)5 types of cuisine
    * After the cuisine, tournament page would show up.
  -




2) Existing user

- go to website
  - shows register/login page (users/new, change to as: register path)
    1. if new user
      - register path routes user to register page (is register and login page the same route?)
        - user is required to create a user account by entering:
          1. unique username => validates :uniqueness, :presence
          2. password??? => bcrypt?
          3. real username => validates :presence
          4. address => validates actual address? (CHECK IF THERE IS A GEM FOR THIS)
        - once user account is successfully created, it'll route to show page (user_path)
          - show page will contain a "preferences" button that will bring the user to preferences new page
            - preferences page will have a list of cuisines checkboxes for the user to select as part of the matchups
              - once submitted, it'll take those selected cuisine arguments and route user to index page with the matchup


    2. if existing users
      - log in page routes user to login page (is register and login page the same route?)


What is our MVP?
  1. able to create a user
  2. able to generate a tournament to filter cuisine selection
  3. able to show restaurant recommendation

TODO:
  1. create matchup Page
  2. look into geocoder
  3. secrets.yml
  4. login sessions
