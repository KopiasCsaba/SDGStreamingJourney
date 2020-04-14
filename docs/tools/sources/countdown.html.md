# Countdown / Timer

This html shows a countdown, or a timer. 
You can put it into a browser source. The obsstudio eventhandler is not implemented as of yet,
so check the refres and reload checkboxes in OBS.


# Arguments

 * clockOnly: If true, it shows a clock instead of a countdown.
    * default: false

 * from: Where to start the countdown.
    * Format: HHmmss
    * default: 000200

 * to: Where to end the countdown. 
    * Format: HHmmss 
    * default: 000000

 * format: The format of the timer.
    * Learn more: [https://momentjs.com/docs/#/displaying/](https://momentjs.com/docs/#/displaying/)
    * default: HH:mm:ss

 * color:
    * default: "white"
    
 * strokeColor:
    * default: "black"
    
 * strokeWidth:
    * unit: px
    * default: 1
    
 * fontSize:
    * unit: px
    * default: 200
    
 * fontFamily:
    * default: "Arial"
    
# Examples

 * file:///path/to/sources/countdown.html
 * file:///path/to/sources/countdown.html?clockOnly=true
 * file:///path/to/sources/countdown.html?from=000005
 * file:///path/to/sources/countdown.html?from=001000&color=red