UIView-Notify
=============

UIView category for simple user notifications
The message is displayed on the bottom of the parent view with a slide in/out effect

Based off [Charles Scalesse's 'Toast'](https://github.com/scalessec/Toast)

Sample
--------------------

    #import "UIView+Notify.h"

    ...

    [someView notify:@"This is a message"];


Setup
--------------------
* Add ```UIView+Notify.h``` and ```UIView+Notify.m``` to your project
* Add ```QuartzCore.framework``` to your project

Screenshot
--------------------
![UIView+Notify](http://www.eflatgames.com/github/uiviewNotify.png)