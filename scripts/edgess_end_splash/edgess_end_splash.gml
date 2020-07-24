/// @description edgess_end_splash(event_type, event_number);
/// @param event_type
/// @param  event_number

/*
Ends a sequence of splash screens and optionally performs any
desired event when the last splash screen has completed.

MUST be used in the Draw event after other edgess_* scripts.

argument0 = event class to perform (event) (optional) (see 'event_perform' in GMS documentation)
argument1 = sub-event of class to perform (if any; use 0 for none) (optional) (integer) (see 'event_perform' in GMS documentation)

Example usage: edgess_end_splash(ev_other, ev_user0);
               edgess_end_splash();
*/

//Get splash ID
splash_id += 1;

//Otherwise end splash sequence
if (splash_current == splash_id) {   
   //Perform the specified event, if enabled
   if argument_count > 1 {
      event_perform(argument[0], argument[1]);
   }
   
   //End the splash sequence
   splash_current += 1;
}

//Reset automatic splash ID for next step
splash_id = -1;
