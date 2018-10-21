@javascript
Feature: Member can login and access own profile

    As a Member,
    In order to keep my information up to date
    I would like to be able to login to the system and access an interface that allows me to update my information


    Background:
        Given the following users exists
            | email              | first_name | last_name | role   |
            | alumni_1@craft.com | Student    | One       | member |
            | alumni_2@craft.com | Student    | Two       | member |

        And member "alumni_1@craft.com" is logged in

    Scenario: Member profiles are displayed on index page
        When a member visits the site
        And clicks "View profile" on his listing
        Then he should see "Student One"
        And he should see "This is your profile as seen by other members and recruiters."
        But when he returns to the index page
        And clicks "View profile" on "alumni_2@craft.com"
        Then he should not see "This is your profile as seen by other members and recruiters."