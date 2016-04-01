# pkozlov-overlay
My Gentoo overlay

To add this repo to Gentoo just create the ```/etc/portage/repos.conf/pkozlov.conf``` file  with the following content

    [pkozlov]
    location = /var/db/repos/pkozlov # path to local directory
    sync-type = git
    sync-uri = https://github.com/p-kozlov/pkozlov-overlay.git
    auto-sync = yes

And then type

    emerge --sync
