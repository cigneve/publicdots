/* user and group to drop privileges to */
static const char *user = "bab";
static const char *group = "bab"; // use "nobody" for arch

static const char *colorname[NUMCOLS] = {
#if DWM_LOGO_PATCH && !BLUR_PIXELATED_SCREEN_PATCH
    [BACKGROUND] = "#2d2d2d", /* after initialization */
#endif                        // DWM_LOGO_PATCH
    [INIT] = "#89b482",       /* after initialization */
    [INPUT] = "#d4be98",      /* during input */
    [FAILED] = "#ea6962",     /* wrong password */
#if CAPSCOLOR_PATCH
    [CAPS] = "#ea6962", /* CapsLock on */
#endif                  // CAPSCOLOR_PATCH
#if PAMAUTH_PATCH
    [PAM] = "#7daea3", /* waiting for PAM */
#endif                 // PAMAUTH_PATCH
#if KEYPRESS_FEEDBACK_PATCH
    [BLOCKS] = "#ffffff", /* key feedback block */
#endif                    // KEYPRESS_FEEDBACK_PATCH
};

#if MESSAGE_PATCH || COLOR_MESSAGE_PATCH
/* default message */
static const char *message = "\n\n\n\n\n\n\n\n\n\n\n\npassword";

/* text color */
static const char *text_color = "#d4be98";

/* text size (must be a valid size) */
static const char *font_name =
    "-misc-dejavu sans "
    "condensed-bold-o-semicondensed--0-0-0-0-p-0-adobe-standard";
#endif // MESSAGE_PATCH | COLOR_MESSAGE_PATCH

#if BACKGROUND_IMAGE_PATCH
/* Background image path, should be available to the user above */
static const char *background_image = "";
#endif // BACKGROUND_IMAGE_PATCH

#if DWM_LOGO_PATCH
/* insert grid pattern with scale 1:1, the size can be changed with logosize */
static const int logosize = 40;
static const int logow =
    16; /* grid width and height for right center alignment*/
static const int logoh = 16;

// static XRectangle rectangles[] = {
//    /* x    y   w   h */
//    { 0,    3,  1,  3 },
//    { 1,    3,  2,  1 },
//    { 0,    5,  8,  1 },
//    { 3,    0,  1,  5 },
//    { 5,    3,  1,  2 },
//    { 7,    3,  1,  2 },
//    { 8,    3,  4,  1 },
//    { 9,    4,  1,  2 },
//    { 11,   4,  1,  2 },
// };
static XRectangle rectangles[] = {
    /* x    y   w   h */
    {0, 1, 1, 3},   {0, 5, 1, 3},   {0, 10, 1, 2},  {0, 13, 1, 2},
    {1, 0, 1, 1},   {1, 4, 1, 1},   {1, 8, 1, 2},   {1, 12, 1, 1},
    {1, 14, 1, 1},  {2, 0, 1, 1},   {2, 2, 1, 1},   {2, 4, 1, 1},
    {2, 6, 1, 1},   {2, 8, 1, 3},   {2, 14, 1, 1},  {3, 0, 1, 1},
    {3, 2, 1, 1},   {3, 4, 1, 1},   {3, 6, 1, 1},   {3, 8, 1, 1},
    {3, 14, 1, 2},  {4, 0, 1, 1},   {4, 4, 1, 1},   {4, 6, 1, 1},
    {4, 8, 1, 1},   {4, 11, 1, 3},  {4, 15, 1, 1},  {5, 1, 1, 3},
    {5, 6, 1, 1},   {5, 8, 1, 1},   {5, 15, 1, 1},  {6, 1, 1, 1},
    {6, 6, 1, 1},   {6, 8, 1, 1},   {6, 11, 1, 4},  {7, 1, 1, 1},
    {7, 6, 1, 1},   {7, 8, 1, 1},   {7, 13, 1, 1},  {8, 1, 1, 1},
    {8, 6, 1, 1},   {8, 8, 1, 1},   {8, 13, 1, 1},  {9, 1, 1, 1},
    {9, 6, 1, 1},   {9, 8, 1, 1},   {9, 11, 1, 4},  {10, 1, 1, 3},
    {10, 6, 1, 1},  {10, 8, 1, 1},  {10, 15, 1, 1}, {11, 0, 1, 1},
    {11, 4, 1, 1},  {11, 6, 1, 1},  {11, 8, 1, 1},  {11, 11, 1, 3},
    {11, 15, 1, 1}, {12, 0, 1, 1},  {12, 2, 1, 1},  {12, 4, 1, 1},
    {12, 6, 1, 1},  {12, 8, 1, 1},  {12, 14, 1, 2}, {13, 0, 1, 1},
    {13, 2, 1, 1},  {13, 4, 1, 1},  {13, 6, 1, 1},  {13, 8, 1, 3},
    {13, 14, 1, 1}, {14, 0, 1, 1},  {14, 4, 1, 1},  {14, 8, 1, 2},
    {14, 12, 1, 1}, {14, 14, 1, 1}, {15, 1, 1, 3},  {15, 5, 1, 3},
    {15, 10, 1, 2}, {15, 13, 1, 2}};
#endif // DWM_LOGO_PATCH

#if XRESOURCES_PATCH
/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
#if DWM_LOGO_PATCH && !BLUR_PIXELATED_SCREEN_PATCH
    {"background", STRING, &colorname[BACKGROUND]},
#endif // DWM_LOGO_PATCH
#if BACKGROUND_IMAGE_PATCH
    {"bg_image", STRING, &background_image},
#endif // BACKGROUND_IMAGE_PATCH
    {"color6", STRING, &colorname[INIT]},
    {"foreground", STRING, &colorname[INPUT]},
    {"color1", STRING, &colorname[FAILED]},
#if CAPSCOLOR_PATCH
    {"color1", STRING, &colorname[CAPS]},
#endif // CAPSCOLOR_PATCH
#if PAMAUTH_PATCH
    {"color4", STRING, &colorname[PAM]},
#endif // PAMAUTH_PATCH
#if MESSAGE_PATCH || COLOR_MESSAGE_PATCH
    {"message", STRING, &message},
    {"text_color", STRING, &text_color},
    {"font_name", STRING, &font_name},
#endif // MESSAGE_PATCH | COLOR_MESSAGE_PATCH
};
#endif // XRESOURCES_PATCH

#if ALPHA_PATCH
/* lock screen opacity */
static const float alpha = 0.9;
#endif // ALPHA_PATCH

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

#if AUTO_TIMEOUT_PATCH
/* length of time (seconds) until */
static const int timeoffset = 60;

/* should [command] be run only once? */
static const int runonce = 0;

/* command to be run after [time] has passed */
static const char *command = "doas poweroff";
#endif // AUTO_TIMEOUT_PATCH

#if FAILURE_COMMAND_PATCH
/* number of failed password attempts until failcommand is executed.
   Set to 0 to disable */
static const int failcount = 0;

/* command to be executed after [failcount] failed password attempts */
static const char *failcommand = "shutdown";
#endif // FAILURE_COMMAND_PATCH

#if SECRET_PASSWORD_PATCH
static const secretpass scom[] = {
    /* Password             command */
    {"shutdown", "doas poweroff"},
};
#endif // SECRET_PASSWORD_PATCH

#if BLUR_PIXELATED_SCREEN_PATCH
/* Enable blur */
#define BLUR
/* Set blur radius */
static const int blurRadius = 8;
/* Enable Pixelation */
// #define PIXELATION
/* Set pixelation radius */
static const int pixelSize = 1;
#endif // BLUR_PIXELATED_SCREEN_PATCH

#if CONTROLCLEAR_PATCH
/* allow control key to trigger fail on clear */
static const int controlkeyclear = 0;
#endif // CONTROLCLEAR_PATCH

#if DPMS_PATCH
/* time in seconds before the monitor shuts down */
static const int monitortime = 5;
#endif // DPMS_PATCH

#if KEYPRESS_FEEDBACK_PATCH
static short int blocks_enabled = 1; // 0 = don't show blocks
static const int blocks_width = 0;   // 0 = full width
static const int blocks_height = 16;

// position
static const int blocks_x = 0;
static const int blocks_y = 0;

// Number of blocks
static const int blocks_count = 10;
#endif // KEYPRESS_FEEDBACK_PATCH

#if PAMAUTH_PATCH
/* PAM service that's used for authentication */
static const char *pam_service = "login";
#endif // PAMAUTH_PATCH

#if QUICKCANCEL_PATCH
/* time in seconds to cancel lock with mouse movement */
static const int timetocancel = 4;
#endif // QUICKCANCEL_PATCH
