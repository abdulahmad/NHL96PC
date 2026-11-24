; Initialised data of front/player_ratings (src/front/player_ratings).
bits 32
%include "hockey.inc"
section s_11E890 progbits alloc noexec write align=1
extern str_34P, str_34S, str_45P, str_45S, str_CRP, str_CRS, str_PLA, str_RatingsRAT
extern str_RatingsSEA
global SkaterCardFlash, GoalieCardFlash, SkaterFlashTime, GoalieFlashTime, SkaterCardPhoto, GoalieCardPhoto, SkaterPhotoLoaded, GoaliePhotoLoaded
global RatingsTabNames
SkaterCardFlash:                                ; skater card highlight is on; used by PlayerRatingsScreen,
                                                ; SwitchRatingsCard
        db 00h,00h,00h,00h
GoalieCardFlash:                                ; goalie card highlight is on; used by PlayerRatingsScreen,
                                                ; SwitchRatingsCard
        db 00h,00h,00h,00h
SkaterFlashTime:                                ; tick count of the skater card highlight; used by
                                                ; PlayerRatingsScreen, SwitchRatingsCard
        db 00h,00h,00h,00h
GoalieFlashTime:                                ; tick count of the goalie card highlight; used by
                                                ; PlayerRatingsScreen, SwitchRatingsCard
        db 00h,00h,00h,00h
SkaterCardPhoto:                                ; skater card photo; used by LoadRatingsPicture,
                                                ; PlayerRatingsScreen, SwitchRatingsCard
        db 00h,00h,00h,00h
GoalieCardPhoto:                                ; goalie card photo; used by LoadRatingsPicture,
                                                ; PlayerRatingsScreen, SwitchRatingsCard
        db 00h,00h,00h,00h
SkaterPhotoLoaded:                              ; skater card photo is loaded; used by LoadRatingsPicture,
                                                ; PlayerRatingsScreen
        db 00h,00h,00h,00h
GoaliePhotoLoaded:                              ; goalie card photo is loaded; used by LoadRatingsPicture,
                                                ; PlayerRatingsScreen
        db 00h,00h,00h,00h
RatingsTabNames:                                ; ratings screen tab tags; used by PlayerRatingsScreen
        dd str_RatingsRAT
        dd str_45S
        dd str_45P
        dd str_34S
        dd str_34P
        dd str_CRS
        dd str_CRP
        dd str_RatingsSEA
        dd str_PLA
