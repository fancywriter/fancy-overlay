# fancy-overlay
My Gentoo overlay

To add this repo to Gentoo just create the ```/etc/portage/repos.conf/fancy.conf``` file  with the following content

    [fancy-overlay]
    location = /var/db/repos/fancy-overlay
    sync-type = git
    sync-uri = https://github.com/fancywriter/fancy-overlay.git
    auto-sync = yes

And then type

    emerge --sync
