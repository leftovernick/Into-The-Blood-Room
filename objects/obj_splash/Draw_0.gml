//Draw the first splash
edgess_draw_splash_ext(spr_GMTK20, 3, 5.7, 2, image_index, 0, 0, 1, 1, 0, true);

//Draw the second splash

edgess_draw_splash_ext(spr_intro, 3, .8, 2, image_index, 0, 0, 1, 1, 0, true);
//Perform effect on second splash
//edgess_splash_effect(ef_flimsy);

//Execute the User Defined 0 event when complete
edgess_end_splash(ev_other, ev_user0);

