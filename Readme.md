# Keith Pitt's Dotfiles

Dotfiles to setup the system the way I like it :)

To get started, just run:

    $ rake

## Rake Tasks

#### Copy Dotfiles

This task will copy all the dotfiles to the home directory

    $ rake setup

#### Github Integration

This task will add "github.user" and "github.token" to the git config.

    $ rake github

#### Remove Dotfiles

Remove files added in `rake setup`

    $ rake clean
