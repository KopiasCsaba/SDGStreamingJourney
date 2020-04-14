# frame.html - Set a fixed title & load an url

## What

This html file can be opened in a browser, and it will do two things:
 * Set the window title to a fixed value that you set
 * Load up an URL in an iframe

## Why

Because this way you can have a browser with a fixed title, that you can grab from OBS,
and it will work always, even if the page changes it's title on its own, or you navigate inside. 

OBS remembers the title of the application, so this way you can have a fixed environment.

## How (setup)
You need to disable an important security feature in a browser, so be careful, 
the best way for this is if you use a separate profile for it. 

In firefox:
 * about:config
 * security.csp.enable set it to false.
 
Don't do this in your own profile that you use always, be warned.

I've did not succeeded in disabling this feature in chromium jet, so this does not work with chromium atm.

After this, open a browser window with an url like this:
```
file:///path/to/frame.html?title=meeting&url=http://example.com/online_meeting
```

If the url you want contains &, ?, = or anything weird, you need to [urlencode](https://www.google.com/search?client=firefox-b-e&q=urlencode) the argument.

E.g.:
```
# For http://example.com/online_meeting?foo=bar
file:///path/to/frame.html?title=meeting&url=http%3A%2F%2Fexample.com%2Fonline_meeting%3Ffoo%3Dbar
```

(Yeah, I should have encoded the http:// in the previous example, but it works without that too.:))
