<?php

// Eve class adapted and simplified igbclass from Nonsequitur (Patrick D Hall) Nonsequitur SoftWerx.

// See Original credits below
/**
 * IGBClass 2 -- PHP4
 *  (c) 2003-2005 Nonsequitur (Patrick D Hall) Nonsequitur SoftWerx.
 *
 *  PHP Class, for EVE-Online: Exodus (CCP)
 *
 *  Reworked from EVEUserClass, changed some areas to operate differently.
 *  functionality is similar to the old version, but most likely will break
 *  existing code with regards to Corp Roles.
 *  Reworked from the ground up to add much needed testing and emulation code for
 *  the ever-burdened IGB website builder, this IGBClass is designed to support
 *  the Exodus IGB.
 *
 *  For more information on how to emulate user data for debugging and testing your
 *  IGB site, see the code docs for the IGB::IGB constructor function.
 *
 *  ***************************************************************************
 *  This code is provided free of charge for any, and all use, you the end user
 *  see fit. There are a couple of things I would ask you to do if you do use
 *  these scripts.
 *
 *  One, if you make changes to this script to fix a bug, or add a feature
 *  please forward the changes to me at my email address pdhall[AT]gmail[D0T]com.
 *  there is no need to send me anything that involves proprietary code or any
 *  sensative data related to your project... keep that to yourself.
 *
 *  Two, if you find this script useful then please drop me a line and tell me
 *  about it, I'd like to hear if you found a use for this code, and even
 *  if you have bugs or suggestions to relay I'm open to those as well. (;
 *
 *  Three, if you create an open source project that includes or redistributes
 *  these files please leave the sourcecode to these files in their official
 *  version if at all possible.  Also, please send me an email so I am aware
 *  of your released project, and can be prepared for any support issues that
 *  might arise.
 *
 *  Good luck with your IGB projects.
 *  ***************************************************************************/

define('BROKE_IGB', 'Python-urllib');  // Shiva Beta User_Agent (*when broke*)
define('GOOD_IGB', 'EVE-IGB'); // Correct IGB User_Agent (*when fixed*)

class Eve {

    // IGB Member Vars
    var $UserID;
    var $UserName;
    var $UserCorp;
    var $UserCorpID;
    var $UserAlliance;
    var $UserAllianceID;
    var $UserRole;
    var $UserStation;
    var $UserSystem;
    var $UserConstellation;
    var $UserRegion;
    var $BrowserAgent;
    var $UserIPAddress;
    var $UserServerIP;
    var $EVETrusted;
    var $config;
    var $uservars;

    var $catstring; // ?

    var $ServerVars;


    function ServerGetVar($name = '')
    {

        if (!empty($name) && isset($_SERVER[$name])) {
            return $_SERVER[$name];
        }

        return null;

    }

    function Eve()
    {

        $this->EVETrusted           = $this->ServerGetVar('HTTP_EVE_TRUSTED');
        $this->UserID               = $this->ServerGetVar('HTTP_EVE_CHARID');
        $this->UserName             = $this->ServerGetVar('HTTP_EVE_CHARNAME');
        $this->UserCorp             = $this->ServerGetVar('HTTP_EVE_CORPNAME');
        $this->UserCorpID           = $this->ServerGetVar('HTTP_EVE_CORPID');
        $this->UserAlliance         = $this->ServerGetVar('HTTP_EVE_ALLIANCENAME');
        $this->UserAllianceID       = $this->ServerGetVar('HTTP_EVE_ALLIANCEID');
        $this->UserRole             = $this->ServerGetVar('HTTP_EVE_CORPROLE');
        $this->UserStation          = $this->ServerGetVar('HTTP_EVE_STATIONNAME');
        $this->UserSystem           = $this->ServerGetVar('HTTP_EVE_SOLARSYSTEMNAME');
        $this->UserConstellation    = $this->ServerGetVar('HTTP_EVE_CONSTELLATIONNAME');
        $this->UserRegion           = $this->ServerGetVar('HTTP_EVE_REGIONNAME');
        $this->BrowserAgent         = $this->ServerGetVar('HTTP_USER_AGENT');
        $this->UserIPAddress        = $this->ServerGetVar('REMOTE_ADDR');
        $this->UserServerIP         = $this->ServerGetVar('HTTP_EVE_SERVERIP');

        $this->SessionStart();

    }

    /**
     * IGB::RequestTrust($_ReasonText)
     * Trigger IGB to request trust for the server on which this script resides.
     *
     * Since this function sends HTTP headers you must ensure that no text, html
     * or data is sent to the IGB.  HTTP headers must be the first text in any
     * page sent to a browser. Either buffer the output from the server using
     * ob_start() and ob_end_flush() or ensure that you call these functions in
     * the correct order.
     *
     *  $_ReasonText - String that contains the message you wish to display
     *                 to the user in the popup IGB trust request dialog.
     *                 This text is displayed just below the CCP included
     *                 warning and notice about privacy and trust variables.
     *                 Due to the size of the dialog box used in game, the
     *                 player will most likely have to scroll down to even
     *                 see this text. Oh well, better than nothing I suppose.
    */
    function RequestTrust($_ReasonText) {
        // if IsMiniBrowser, ask for trust.
        if ($this->IsMiniBrowser()) {
            header("eve.trustme:http://".$this->ServerGetVar('HTTP_HOST')."/::".$_ReasonText,false);
        } else {
            return False;
        }
    }

    /**
    * get base URI for current script
    *
    * @return string base URI for current script
    */
    function GetBaseURI()
    {
        // Get the name of this URI
        // Start of with REQUEST_URI
        $path = $this->ServerGetVar('REQUEST_URI');

        if ((empty($path)) || (substr($path, -1, 1) == '/')) {
            // REQUEST_URI was empty or pointed to a path
            // Try looking at PATH_INFO
            $path = $this->ServerGetVar('PATH_INFO');
            if (empty($path)) {
                $path = $this->ServerGetVar('SCRIPT_NAME');
            }
        }

        $path = preg_replace('/[#\?].*/', '', $path);
        $path = dirname($path);

        if (preg_match('!^[/\\\]*$!', $path)) {
            $path = '';
        }

        return $path;
    }

    /**
    * get base URL for PostNuke
    *
    * @return string base URL for PostNuke
    */
    function GetBaseURL()
    {
        $server = $this->ServerGetVar('HTTP_HOST');

        // IIS sets HTTPS=off
        $https = $this->ServerGetVar('HTTPS');
        if (isset($https) && $https != 'off') {
            $proto = 'https://';
        } else {
            $proto = 'http://';
        }

        $path = $this->GetBaseURI();

        return "$proto$server$path/";
    }

    /**
     * IGB::RedirectURL($_RedirURL)
     * Redirect any Browser IGB, FireFox, IE, etc. to a given url.
     * Useful for incorporation into index.php and testing browser and
     * redirecting to different content such as IGB content or NGB (non game browser)
     * content.
     *
     * Since this function sends HTTP headers you must ensure that no text, html
     * or data is sent to the IGB.  HTTP headers must be the first text in any
     * page sent to a browser. Either buffer the output from the server using
     * ob_start() and ob_end_flush() or ensure that you call these functions in
     * the correct order.
     *
     *  $_RedirURL -- Set to a string value containing a fully qualified
     *                URL. This will forward the browser to the location
     *                specified. Must be a fully qualified URL and exist
     *                to prevent 404 Not found Errors.
     *
     *  Will terminate the calling script when a URL is passed.
     *
    */
    function RedirectURL($_RedirURL)
    {

        // very basic input validation against HTTP response splitting
        $redirecturl = str_replace(array('\r', '\n', '%0d', '%0a'), '', $_RedirURL);

        // check if the headers have already been sent
        if (headers_sent()) {
            return false;
        }

        // Always close session before redirect
        if (function_exists('session_write_close')) {
            session_write_close();
        }

        if (preg_match('!^http!', $redirecturl)) {
            // Absolute URL - simple redirect
            //if (IS_IGB) {
            //    header("refresh:sessionchange;URL=$redirecturl");
            //} else {
                header("Location: $redirecturl");
            //}
            return true;
        }
        // Removing leading slashes from redirect url
        $redirecturl = preg_replace('!^/*!', '', $redirecturl);
        // Get base URL
        $baseurl = $this->GetBaseURL();
        //if (IS_IGB) {
        //    header("refresh:sessionchange;URL=$baseurl$redirecturl");
        //} else {
            header("Location: $baseurl$redirecturl");
        //}
        return true;

    }

    function SessionStart()
    {
//echo '<pre>';print_r($_SESSION);echo '</pre>';exit;

        session_start();
        output_reset_rewrite_vars();
        if (!session_id()) {
            ini_set("session.use_trans_sid","Off");
        }

    }

    function SessionDestroy()
    {
        //if (session_id() != "") {
        //    session_destroy();
        //}
        session_destroy();

    }

    /**
     * Get a session variable
     *
     * @param name $ name of the session variable to get
     */
    function SessionGetVar($name)
    {
        //if(isset($name) && isset($_SESSION['PNSV' . $name])) {
        if(isset($name)) {
            return $_SESSION[$name];
        }
        return false;
    }

    /**
     * Set a session variable
     *
     * @param name $ name of the session variable to set
     * @param value $ value to set the named session variable
     */
    function SessionSetVar($name, $value='')
    {
        if (!isset($name)) {
            return false;
        }

        $_SESSION[$name] = $value;

        return true;
    }

    /**
     * Delete a session variable
     *
     * @param name $ name of the session variable to delete
     * @return success or error
     */
    function SessionDelVar($name)
    {
        // if empty or not set in both globals, return
        if (empty($name) || !(isset($_SESSION[$name]) || !isset($GLOBALS[$name]))){
            return false;
        }

        // Unset the session var
        unset($_SESSION[$name]);

        // This unsets the variable if register globals are on
        unset($GLOBALS[$name]);

        return true;
    }

    function GetStatusMsg()
    {
        $msg    = $this->SessionGetVar('statusmsg');
                  $this->SessionDelVar('statusmsg');
        $errmsg = $this->SessionGetVar('errormsg');
                  $this->SessionDelVar('errormsg');

        // Error message overrides status message
        if (!empty($errmsg)) {
            return $errmsg;
        }
        return $msg;
    }

    /**
     * IGB::RefreshIGB($_RefreshRate, $_RefreshURL)
     * Trigger IGB to refresh in either seconds or on sessionchange (jumping,
     * docking, undocking, etc.)
     *
     * Since this function sends HTTP headers you must ensure that no text, html
     * or data is sent to the IGB.  HTTP headers must be the first text in any
     * page sent to a browser. Either buffer the output from the server using
     * ob_start() and ob_end_flush() or ensure that you call these functions in
     * the correct order.
     *
     *  $_RefreshRate -- Values passed can be either "sessionchange" or
     *                   any non negative integer value. Values that do not
     *                   match the criteria will fail.
     *
     *  $_RefreshURL  -- Reletive, or qualified url that you wish to load when
     *                   the igb refreshes based on $_RefreshRate.
    */
    function RefreshIGB($_RefreshRate, $_RefreshURL) {
        if (strtolower($_RefreshRate)=='sessionchange'){
            header("refresh:sessionchange;URL=".$_RefreshURL);
            return true;
        } else {
            if (is_numeric($_RefreshRate)) {
                if ($_RefreshRate >=0){
                    header("refresh:".$_RefreshRate.";URL=".$_RefreshURL);
                    return true;
                }
            } else {
                return false;
            }
        }
    }

    /**
     * IGB::UserID()
     *  Function to return the visitor's active character id.  This header
     *  Uses for this ID are varied, such as using the showinfo, and portrait
     *  functions built into the IGB, or for pulling the image from ccp's forum
     *  image server.
     *    *See igbdemo.php for examples of how to use these functions.
    */
    function UserID() {
        return $this->UserID;
    }

    /**
     * IGB::UserName()
     *  Function to return the name of the visitor's active character.
    */
    function UserName() {
        return $this->UserName;
    }

    /**
     * IGB::UserCorp()
     *  Function to return the name of the visitor's active character's
     *  corporation
    */
    function UserCorp() {
        return $this->UserCorp;
    }

    /**
     * IGB::UserCorpID()
     *  Function to return the corporation id of the visitor's active character.
     *  This ID can be used similar to the character ID for showing info and
     *  displaying the corporations logo.
     *  *See igbdemo.php for examples.
    */
    function UserCorpID() {
        return $this->UserCorpID;
    }

    /**
     * IGB::UserAlliance()
     *  Function to return the alliance name of the visitor's active character.
     *  If this character is not currently in an alliance, it will return the
     *  string value 'None' as set by the eve server.
    */
    function UserAlliance() {
        return $this->UserAlliance;
    }

    /**
     * IGB::UserAllianceID()
     *  Function to return the alliance ID of the visitor's active character.
     *  Just like the UserAlliance function this will return the string value
     *  'None' if the character is not in an In game alliance.
    */
    function UserAllianceID() {
        return $this->UserAllianceID;
    }

    /**
     * IGB::UserRole()
     *  Function to return the bit-mapped corporation roles set for the visitor's
     *  active character.  This is his/her roles as set by his/her CEO in their
     *  corporation.  Not all roles are encoded, some granted roles are not sent
     *  by the IGB, and currently none of the "Grantable" roles are encoded and
     *  sent.  *See the Role Defines, and array at the top of this file for a
     *  complete list of roles sent.  Also you may examine igbdemo.php to see
     *  but one method of using this data.
    */
    function UserRole() {
        return $this->UserRole;
    }

    /**
     * IGB::UserStation()
     *  Function to return station name of the visitor's active character if they
     *  are currently docked inside a space station.  If the visitor is not
     *  docked but rather in space this function returns the string value 'None'.
     *  You can use IGB::IsDocked() to test if the visitor is in space or in
     *  station.
    */
    function UserStation() {
        return $this->UserStation;
    }

    /**
     * IGB::UserSystem()
     *  Function to return the Solarsystem Name of the visitor's current location
     *  in space.
    */
    function UserSystem() {
        return $this->UserSystem;
    }

    /**
     * IGB::UserConstellation()
     *  Function to return the Constellation name of the visitor's current location
     *  in space.
    */
    function UserConstellation() {
        return $this->UserConstellation;
    }

    /**
     * IGB::UserRegion()
     *  Function to return the Region name of the visitor's current location in
     *  space.
    */
    function UserRegion() {
        return $this->UserRegion;
    }

    /**
     * IGB::BrowserAgent()
     *  Function that returns the visiting browser's HTTP_USER_AGENT string.
     *  The same data can be obtained by using the $_SERVER['HTTP_USER_AGENT']
     *  variable but it is included in the class for conveniance.
    */
    function BrowserAgent() {
        return $this->BrowserAgent;
    }

    /**
     * IGB::UserIPAddress()
     *  Function to return the visitors IP address as a string.  This data is
     *  also availiable via the $_SERVER['REMOTE_ADDR'] variable, but included
     *  here for conveniance.
    */
    function UserIPAddress() {
        return $this->UserIPAddress;
    }

    /**
     * IGB::UserServerIP()
     *  Return IP address and port, of the EVE-Online server from where the
     *  visitor is browsing.
     *
     *  Browsing from Tranquility will return.
     *  '87.237.38.200:26000'
     *  Browsing from Singularity will return.
     *  '212.187.162.10:26000'
     *
     *  This can also be used to limit access to your pages based on where the
     *  end user is visiting from.
    */
    function UserServerIP() {
        return $this->UserServerIP;
    }

    /**
     * IGB::IsMiniBrowser([$_BypassCheck = False], [$_BogusHeaderCheck = False])
     *
     *  Return True if Browser is EVE-minibrowser or false for all other browsers.
     *  A word of caution, this is by far not 100% effective, for checking against
     *  fake browsers.  Http headers are trivial to spoof, and baseing any sort
     *  of security on these headers is just begging for trouble.  Always use
     *  some sort of user account system that requires log in to allow access to
     *  your 'private' content.
     *
     *  Also of note is the fact that using $_BogusHeaderCheck set to true might
     *  cause some issues with norty isp's that add the http_keep_alive header
     *  on all out going http traffic.  I have been informed that using this
     *  might cause some issues with some UK users and a certain ISP.  As always
     *  use with caution, and keep notes of users not able to pass the IGB check.
     *
     *  If you need to debug something and need an easy way around this check just
     *  call the function like so to have it return True and skip the check
     *  $IGBUser->IsMiniBrowser(True);
     *  $IGBUser->IsMiniBrowser();  // for normal behavior
     *
     *  This function also supports the isEmulated status when opperating the class
     *  with passed emulation headers. (see IGB::IGB constructor code docs)
     *
    */
    function IsMiniBrowser($_BypassCheck = False, $_BogusHeaderCheck = False) {

        // First see if the caller wishes to bypass the check.
        if($_BypassCheck) {
            return true;
        } else {
            // Parse agent string by spliting on the '/'
            $parts = explode("/", $this->BrowserAgent());
            // Test for Eve Minibrowser also test against broken Shiva IGB Agent
            if (($parts[0] == GOOD_IGB) or ($parts[0] == BROKE_IGB)) {

                if ($_BogusHeaderCheck) {
                    // NOTE! Some isp's send http_keep_alive either because of proxy,
                    // or net accelerators, so if your users have an isp like this
                    // they will fail the IsMiniBrowser check with BogusHeaderCheck
                    // enabled.
                    if (isset($_SERVER['HTTP_ACCEPT']) ||
                        isset($_SERVER['HTTP_ACCEPT_LANGUAGE']) ||
                        isset($_SERVER['HTTP_ACCEPT_ENCODING']) ||
                        isset($_SERVER['HTTP_ACCEPT_CHARSET']) ||
                        isset($_SERVER['HTTP_CONNECTION']) ||
                        isset($_SERVER['HTTP_KEEP_ALIVE'])) {
                            // If Extra Headers, return false (not IGB)
                            return false;
                        }
                }
                // IGB always sends this set to yes, or no,
                // so if it is missing, we smell something.
                if (!isset($_SERVER['HTTP_EVE_TRUSTED'])) {
                    return false;
                }
                // return true at this point, User Agent matches,
                // and no phishy headers
                return true;
            } else {
                // User Agent, does not match required.
                return false;
            }
        }
    }

    /**
     * IGB::IsDocked([$_BypassCheck = False])
     *  Return True if docked, false if not.
     *  call IsDocked() for normal test.
     *  call IsDocked(True) to bypass normal check and test as true regardless
    */
    function IsDocked($_BypassCheck = False) {
        // bypass check if caller wishes.
        if($_BypassCheck) {
            return true;
        } else {
            // Check to see if station name is 'none'
            if (strtolower($this->UserStation()) == "none") {
                // If Station name is set to 'none' the visitor is not docked.
                return false;
            } else {
                // If not 'none' then must be docked.
                return true;
            }
        }
    }

    /**
     * IGB::IsTrusted([$_BypassCheck = False])
     *  !!!DEPRECATED!!!
     *  Future versions of igbclass may not support this function
     *  Use IGB::IsTrustEnabled() instead.  This function just wraps to the
     *  new version to maintain compatibility with older implementations.
    */
    function IsTrusted($_BypassCheck = False) {
        // bypass check if caller wishes.
        return $this->IsTrustEnabled($_BypassCheck);
    }

    /**
     * IGB::IsTrustEnabled([$_BypassCheck = False])
     *  Return True if the current visitor has chosen to enable trust headers
     *  for your website.  If they do have trust enabled you will be able to use
     *  the functions above like UserID and such for improved interaction with
     *  your visitors.
     *  call IsTrustEnabled() for normal test.
     *  call IsTrustEnabled(True) to bypass normal check and test as true regardless
    */
    function IsTrustEnabled($_BypassCheck = False) {
        // bypass check if caller wishes.
        if($_BypassCheck) {
            return true;
        } else {
            if(strtolower($this->EVETrusted)=='yes') {
                // Trusted.
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * IGB::IsInAlliance()
     *  Returns True if user is in an in game alliance, or False if they are not.
    */
    function IsInAlliance(){

        if (strtolower($this->UserAlliance) == 'none') {
            return false;
        } else {
            return true;
        }
    }

    /**
     * IGB::HasRole($_RoleMask [, $_BypassCheck = False])
     *  Return True if Visitor has the specified role set. See the top of this
     *  file for a list of all supported Roles.
     *
     *  Calling this function with a true value in the bypass parameter will
     *  cause the function to return true regardless of the actual role.
     *  f.ex:
     *      $IGBUser->HasRole(DIRECTOR, True) to force true.
     *      $IGBUser->HasRole(DIRECTOR) for normal role check.
    */
    /*
    function HasRole($_RoleMask, $_BypassCheck = False) {
        // bypass check, if caller wishes
        if($_BypassCheck) {
            return true;
        } else {
            // Here we pass the Role Integer and assign it to a variable
            $RoleArray = $this->dec2bin($this->UserRole());

            // We can reference the String var as if it was an array
            // and use the $RoleMask to pull a single character from the 64
            // character string of 1's and 0's
            if ($RoleArray[$_RoleMask]=='1')    {
                return true;
            } else {
                return false;
            }
        }
    }*/

    /**
     * GetHash()
     *  Returns the MD5 Hash for the serialized user data variables.
     *  use this function for whatever you feel you need to use it for, it just
     *  gives you a handy way to fetch the hash of this object.  Use it to sort
     *  or lookup, or whatever. Left to the user to decide what it is good for.
     *  (:
     *
     *  you can customize the data that is hashed by commenting out each line you
     *  wish to exclude.  UserIPAddress,is one that would be rather dynamic in nature
     *  and not that good for use if you wanted UID's for a DB. Also any of the
     *  region/system/constellation strings would be bad since they would change too.
    */
    function GetHash() {

        $this->catstring .= $this->UserID;
        $this->catstring .= $this->UserName;
        $this->catstring .= $this->UserCorp;
        $this->catstring .= $this->UserAlliance;
        $this->catstring .= $this->UserRole;
        $this->catstring .= $this->UserStation;
        $this->catstring .= $this->UserSystem;
        $this->catstring .= $this->UserConstellation;
        $this->catstring .= $this->UserRegion;
        $this->catstring .= $this->BrowserAgent;
        $this->catstring .= $this->UserIPAddress;
        $this->catstring .= $this->UserServerIP;

        return md5($this->catstring);
    }

    function GetUserVars($name = '')
    {

        $this->uservars['userid']             = $this->UserID;
        $this->uservars['username']           = $this->UserName;
        $this->uservars['usercorp']           = $this->UserCorp;
        $this->uservars['useralliance']       = $this->UserAlliance;
        $this->uservars['userrole']           = $this->UserRole;
        $this->uservars['userstation']        = $this->UserStation;
        $this->uservars['usersystem']         = $this->UserSystem;
        $this->uservars['userconstellation']  = $this->UserConstellation;
        $this->uservars['userregion']         = $this->UserRegion;
        $this->uservars['browseragent']       = $this->BrowserAgent;
        $this->uservars['useripaddress']      = $this->UserIPAddress;
        $this->uservars['userserverip']       = $this->UserServerIP;

        return $this->uservars;
    }
    /**
     * dec2bin -- v2.0
     *  A total overhaul of the old dec2bin in previous versions of the
     *  EveUserClass.  This version utilizes BCMATH functions built into
     *  PHP 4.0.4 or newer to handle any arbitrary precision Integer values.
     *
     *  This is needed to handle the new higher bits added in the corp roles mask
     *  by ccp.  The old float hack will not function properly anymore due to the
     *  way float precision is handled. The total number of encoded roles uses
     *  more bits than the floating point number can handle with proper precision
     *  and as such, it has been removed.
     *
     *  NOTE:
     *  BCMATH is enabled automatically on Win32 platforms, but may need to be
     *  enabled manually on *nix platforms. BCMath documentation can be found
     *  at: http://www.php.net/manual/en/ref.bc.php
     *
     *  For those of you that admin your own *nix servers this should be trivial
     *  to setup.  On the other hand, those of you that only have limited access
     *  from some 3rd party web hosting provider, may be, as they say...  SOL.
     *
     *  I suggest you petition CCP to split the roles into multiple headers that
     *  stay under the (2^31)-1 integer limit for signed 32 bit integers on php.
     *  Until php supports 64bit integers, or until ccp split them down to
     *  multiple headers you will never be able to use the more simple bit
     *  shifting features of php.
     *
     * USAGE:
     *  $retval - dec2bin($_indec [, $_pad=64][, $_bitorder=1]);
     *
     *  $_indec  - String representation of any decimal base 10 integer, you can
     *             pass a float with a fractional portion but it will be trun-
     *             cated to the whole integer portion on the left of the decimal
     *             point.
     *
     *  [optional parameters]
     *  $_pad     - number of 0's to pad the returned binary number string with.
     *              Default is 64 characters left side padded.
     *
     *  $_bitorder - Sets the order of the returned string of bits,
     *              0..63 default. Any other value returns the bit order in
     *              reverse [63..0].
    */
    function dec2bin($_indec, $_pad=64, $_bitorder=1) {
        $digits="01";
        $retval="";

        bcscale(0);

        while($_indec>1) {
            $rmod=bcmod($_indec,2);
            $_indec=bcdiv($_indec,2);
            $retval=$digits[$rmod].$retval;
        }

        $retval=$digits[intval($_indec)].$retval;

        if ($_bitorder==1) {
            $retval=strrev(str_pad($retval, $_pad, "0", STR_PAD_LEFT));
        } else {
            $retval=str_pad($retval, $_pad, "0", STR_PAD_LEFT);
        }
        return (string)$retval;
    }

    /**
    * clean user input
    * <br />
    * Gets a global variable, cleaning it up to try to ensure that
    * hack attacks don't work
    *
    * @param var $ name of variable to get
    * @param  $ ...
    * @return mixed prepared variable if only one variable passed
    * in, otherwise an array of prepared variables
    */
    function VarCleanFromInput()
    {
        // Create an array of bad objects to clean out of input variables
        $search = array('|</?\s*SCRIPT.*?>|si',
                        '|</?\s*FRAME.*?>|si',
                        '|</?\s*OBJECT.*?>|si',
                        '|</?\s*META.*?>|si',
                        '|</?\s*APPLET.*?>|si',
                        '|</?\s*LINK.*?>|si',
                        '|</?\s*IFRAME.*?>|si',
                        '|STYLE\s*=\s*"[^"]*"|si');

        // Create an empty array that will be used to replace any malacious code
        $replace = array('');

        // Create an array to store cleaned variables
        $resarray = array();

        // Loop through the function arguments
        // these arguments are input variables to be cleaned
        foreach (func_get_args() as $var) {

            // If the var is empty return void
            if (empty($var)) {
                return;
            }

            // Identify the correct place to get our variable from
            // and if we should attempt to cleanse the variable
            // content from the $_FILES array is left untouched
            $cleanse = false;
            switch (true) {
                case (isset($_REQUEST[$var]) && !isset($_FILES[$var])):
                    // Set $ourvar from the $_REQUEST superglobal
                    // but only if it's not also present in the $_FILES array
                    // since php < 4.30 includes $_FILES in $_REQUEST
                    $ourvar = $_REQUEST[$var];
                    $cleanse = true;
                    break;
                case isset($_GET[$var]):
                    // Set $ourvar from the $_GET superglobal
                    $ourvar = $_GET[$var];
                    $cleanse = true;
                    break;
                case isset($_POST[$var]):
                    // Set $ourvar from the $_POST superglobal
                    $ourvar = $_POST[$var];
                    $cleanse = true;
                    break;
                case isset($_COOKIE[$var]):
                    // Set $ourvar from the $_COOKIE superglobal
                    $ourvar = $_COOKIE[$var];
                    $cleanse = true;
                    break;
                case isset($_FILES[$var]):
                    // Set $ourvar from the $_FILES superglobal
                    $ourvar = $_FILES[$var];
                    break;
                default:
                    $ourvar = null;
                    break;
            }

            $alwaysclean = array('name', 'module', 'type', 'file', 'authid');
            if (in_array($var, $alwaysclean)) {
                $cleanse = true;
            }

            if ($cleanse) {
                // If magic_quotes_gpc is on strip out the slashes
                if (get_magic_quotes_gpc()) {
                    EveStripslashes($ourvar);
                }

                $ourvar = preg_replace($search, $replace, $ourvar);
            }

            // Add the cleaned var to the return array
            array_push($resarray, $ourvar);
        }

        // If there was only one parameter passed return a variable
        if (func_num_args() == 1) {
            return $resarray[0];
        // Else return an array
        } else {
            return $resarray;
        }
    }

    /**
    * ready user output
    * <br />
    * Gets a variable, cleaning it up such that the text is
    * shown exactly as expected
    *
    * @param var $ variable to prepare
    * @param  $ ...
    * @return mixed prepared variable if only one variable passed
    * in, otherwise an array of prepared variables
    */
    function VarPrepForDisplay()
    {
        // This search and replace finds the text 'x@y' and replaces
        // it with HTML entities, this provides protection against
        // email harvesters
        static $search = array('/(.)@(.)/se');

        static $replace = array('"&#" .
                                sprintf("%03d", ord("\\1")) .
                                ";&#064;&#" .
                                sprintf("%03d", ord("\\2")) . ";";');

        $resarray = array();
        foreach (func_get_args() as $ourvar) {
            // If magic_quotes_gpc is on strip out the slashes
            if (get_magic_quotes_gpc()) {
                EveStripslashes($ourvar);
            }
            // Prepare var
            $ourvar = htmlspecialchars($ourvar);
            $ourvar = preg_replace($search, $replace, $ourvar);
            // Add to array
            array_push($resarray, $ourvar);
        }
        // Return vars
        if (func_num_args() == 1) {
            return $resarray[0];
        } else {
            return $resarray;
        }
    }

    /**
    * ready database output
    * <br />
    * Gets a variable, cleaning it up such that the text is
    * stored in a database exactly as expected
    *
    * @param var $ variable to prepare
    * @param  $ ...
    * @return mixed prepared variable if only one variable passed
    * in, otherwise an array of prepared variables
    */
    function VarPrepForStore()
    {
        $resarray = array();
        foreach (func_get_args() as $ourvar) {
            if (!get_magic_quotes_runtime() && !is_array($ourvar)) {
                $ourvar = addslashes($ourvar);
            }
            // Add to array
            array_push($resarray, $ourvar);
        }
        // Return vars
        if (func_num_args() == 1) {
            return $resarray[0];
        } else {
            return $resarray;
        }
    }

    function VarPrepHTMLDisplay()
    {
        // This search and replace finds the text 'x@y' and replaces
        // it with HTML entities, this provides protection against
        // email harvesters
        //
        // Note that the use of \024 and \022 are needed to ensure that
        // this does not break HTML tags that might be around either
        // the username or the domain name
        static $search = array('/([^\024])@([^\022])/se');

        static $replace = array('"&#" .
                                sprintf("%03d", ord("\\1")) .
                                ";&#064;&#" .
                                sprintf("%03d", ord("\\2")) . ";";');

        static $allowedtags = NULL;

        //$stuff = 'a:83:{s:3:"!--";s:1:"2";s:1:"a";s:1:"2";s:4:"abbr";i:0;s:7:"acronym";i:0;s:7:"address";i:0;s:6:"applet";i:0;s:4:"area";i:0;s:1:"b";s:1:"1";s:4:"base";i:0;s:8:"basefont";i:0;s:3:"bdo";i:0;s:3:"big";i:0;s:10:"blockquote";i:0;s:2:"br";s:1:"1";s:6:"button";i:0;s:7:"caption";i:0;s:6:"center";i:0;s:4:"cite";i:0;s:4:"code";i:0;s:3:"col";i:0;s:8:"colgroup";i:0;s:3:"del";i:0;s:3:"dfn";i:0;s:3:"dir";i:0;s:3:"div";i:0;s:2:"dl";i:0;s:2:"dd";i:0;s:2:"dt";i:0;s:2:"em";s:1:"1";s:5:"embed";i:0;s:8:"fieldset";s:1:"2";s:4:"font";i:0;s:4:"form";i:0;s:2:"h1";i:0;s:2:"h2";i:0;s:2:"h3";i:0;s:2:"h4";i:0;s:2:"h5";i:0;s:2:"h6";i:0;s:2:"hr";s:1:"1";s:1:"i";s:1:"1";s:6:"iframe";i:0;s:3:"img";s:1:"2";s:5:"input";i:0;s:3:"ins";i:0;s:3:"kbd";i:0;s:5:"label";i:0;s:6:"legend";s:1:"2";s:2:"li";s:1:"1";s:3:"map";i:0;s:7:"marquee";i:0;s:4:"menu";i:0;s:4:"nobr";i:0;s:6:"object";i:0;s:2:"ol";s:1:"1";s:8:"optgroup";i:0;s:6:"option";i:0;s:1:"p";s:1:"1";s:5:"param";i:0;s:3:"pre";s:1:"1";s:1:"q";i:0;s:1:"s";i:0;s:4:"samp";i:0;s:6:"script";i:0;s:6:"select";i:0;s:5:"small";i:0;s:4:"span";s:1:"2";s:6:"strike";i:0;s:6:"strong";s:1:"1";s:3:"sub";i:0;s:3:"sup";i:0;s:5:"table";s:1:"2";s:5:"tbody";i:0;s:2:"td";s:1:"2";s:8:"textarea";i:0;s:5:"tfoot";i:0;s:2:"th";s:1:"2";s:5:"thead";i:0;s:2:"tr";s:1:"2";s:2:"tt";s:1:"1";s:1:"u";i:0;s:2:"ul";s:1:"1";s:3:"var";i:0;}';
        $stuff = array('a' => '2', 'br' => '2', 'strong' => '1', 'ul' => '1', 'li' => '1');
        $allowedstuff = $stuff;//unserialize($stuff);
        if (!isset($allowedtags)) {
            $allowedhtml = array();
            //foreach(pnConfigGetVar('AllowableHTML') as $k=>$v) {
            foreach($allowedstuff as $k=>$v) {
                if ($k == '!--') {
                    if ($v <> 0) {
                        $allowedhtml[] = "$k.*?--";
                    }
                } else {
                    switch($v) {
                        case 0:
                            break;
                        case 1:
                            $allowedhtml[] = "/?$k\s*/?";
                            break;
                        case 2:
                            // intelligent regex to deal with > in parameters, bug #1782
                            // credits to jln
                            $allowedhtml[] = "/?\s*$k" . "(\s+[\w:]+\s*=\s*(\"[^\"]*\"|'[^']*'))*" . '\s*/?';
                           // original version
                            // $allowedhtml[] = "/?$k(\s+[^>]*)?/?";
                            break;
                    }
                }
            }
            if (count($allowedhtml) > 0) {
                // 2nd part of bugfix #1782
                $allowedtags = '~<\s*(' . join('|',$allowedhtml) . ')\s*>~is';
            } else {
                $allowedtags = '';
            }
        }

        $resarray = array();
        foreach (func_get_args() as $var) {
            if (get_magic_quotes_gpc()) {
                EveStripslashes($var);
            }
            // Preparse var to mark the HTML that we want
            if (!empty($allowedtags))
                $var = preg_replace($allowedtags, "\022\\1\024", $var);

            // Prepare var
            $var = htmlspecialchars($var);

            // scramble mailadress
            $var = preg_replace($search, $replace, $var);

            // Fix the HTML that we want
            $var = preg_replace_callback('/\022([^\024]*)\024/',
                                         'VarPrepHTMLDisplay__callback',
                                         $var);

            // Fix entities if required
            //if (pnConfigGetVar('htmlentities')) {
            //    $var = preg_replace('/&amp;([a-z#0-9]+);/i', "&\\1;", $var);
            //}

            // Add to array
            array_push($resarray, $var);
        }

        // Return vars
        if (func_num_args() == 1) {
            return $resarray[0];
        } else {
            return $resarray;
        }
    }

    /**
    * Gets the host name
    *
    * Returns the server host name fetched from HTTP headers when possible.
    * The host name is in the canonical form (host + : + port) when the port is different than 80.
    *
    * @author Marco Canini <marco@xaraya.com>
    * @access public
    * @return string HTTP host name
    */
    function GetHost()
    {
        $server = $this->ServerGetVar('HTTP_HOST');
        if (empty($server)) {
            // HTTP_HOST is reliable only for HTTP 1.1
            $server = $this->ServerGetVar('SERVER_NAME');
            $port = $this->ServerGetVar('SERVER_PORT');
            if ($port != '80') $server .= ":$port";
        }
        return $server;
    }

    /**
    * Get current URI (and optionally add/replace some parameters)
    *
    * @access public
    * @param args array additional parameters to be added to/replaced in the URI (e.g. theme, ...)
    * @return string current URI
    */
    function GetCurrentURI($args = array())
    {
        // get current URI
        $request = $this->ServerGetVar('REQUEST_URI');

        if (empty($request)) {
            // adapted patch from Chris van de Steeg for IIS
            // TODO: please test this :)
            $scriptname = $this->ServerGetVar('SCRIPT_NAME');
            $pathinfo = $this->ServerGetVar('PATH_INFO');
            if ($pathinfo == $scriptname) {
                $pathinfo = '';
            }
            if (!empty($scriptname)) {
                $request = $scriptname . $pathinfo;
                $querystring = $this->ServerGetVar('QUERY_STRING');
                if (!empty($querystring)) $request .= '?'.$querystring;
            } else {
                $request = '/';
            }
        }

        // add optional parameters
        if (count($args) > 0) {
            if (strpos($request,'?') === false) $request .= '?';
            else $request .= '&';

            foreach ($args as $k=>$v) {
                if (is_array($v)) {
                    foreach($v as $l=>$w) {
                    // TODO: replace in-line here too ?
                        if (!empty($w)) $request .= $k . "[$l]=$w&";
                    }
                } else {
                    // if this parameter is already in the query string...
                    if (preg_match("/(&|\?)($k=[^&]*)/",$request,$matches)) {
                        $find = $matches[2];
                        // ... replace it in-line if it's not empty
                        if (!empty($v)) {
                            $request = preg_replace("/(&|\?)$find/","$1$k=$v",$request);

                        // ... or remove it otherwise
                        } elseif ($matches[1] == '?') {
                            $request = preg_replace("/\?$find(&|)/",'?',$request);
                        } else {
                            $request = preg_replace("/&$find/",'',$request);
                        }
                    } elseif (!empty($v)) {
                        $request .= "$k=$v&";
                    }
                }
            }

            $request = substr($request, 0, -1);
        }

        return $request;
    }

    /**
    * Gets the host name
    *
    * Returns the server host name fetched from HTTP headers when possible.
    * The host name is in the canonical form (host + : + port) when the port is different than 80.
    *
    * @author Marco Canini <marco@xaraya.com>
    * @access public
    * @return string HTTP host name
    */
    function ServerGetHost()
    {
        $server = $this->ServerGetVar('HTTP_HOST');
        if (empty($server)) {
            // HTTP_HOST is reliable only for HTTP 1.1
            $server = $this->ServerGetVar('SERVER_NAME');
            $port = $this->ServerGetVar('SERVER_PORT');
            if ($port != '80') $server .= ":$port";
        }
        return $server;
    }

    /**
    * Gets the current protocol
    *
    * Returns the HTTP protocol used by current connection, it could be 'http' or 'https'.
    *
    * @author Marco Canini <marco@xaraya.com>
    * @access public
    * @return string current HTTP protocol
    */
    function ServerGetProtocol()
    {
        if (preg_match('/^http:/', $this->ServerGetVar['REQUEST_URI'])) {
            return 'http';
        }
        $HTTPS = $this->ServerGetVar('HTTPS');
        // IIS seems to set HTTPS = off for some reason
        return (!empty($HTTPS) && $HTTPS != 'off') ? 'https' : 'http';
    }

    /**
    * Get current URL
    *
    * @access public
    * @param args array additional parameters to be added to/replaced in the URL (e.g. theme, ...)
    * @return string current URL
    * @todo cfr. BaseURI() for other possible ways, or try PHP_SELF
    */
    function GetCurrentURL()
    {
        $server = ServerGetHost();
        $protocol = ServerGetProtocol();
        $baseurl = "$protocol://$server";

        // get current URI
        $request = $this->ServerGetVar('REQUEST_URI');

        if (empty($request)) {
            // adapted patch from Chris van de Steeg for IIS
            // TODO: please test this :)
            $scriptname = $this->ServerGetVar('SCRIPT_NAME');
            $pathinfo = $this->ServerGetVar('PATH_INFO');
            if ($pathinfo == $scriptname) {
                $pathinfo = '';
            }
            if (!empty($scriptname)) {
                $request = $scriptname . $pathinfo;
                $querystring = $this->ServerGetVar('QUERY_STRING');
                if (!empty($querystring)) $request .= '?'.$querystring;
            } else {
                $request = '/';
            }
        }

        return $baseurl . $request;
    }

}

/**
* strip slashes
*
* stripslashes on multidimensional arrays.
* Used in conjunction with pnVarCleanFromInput
*
* @access private
* @param any $ variables or arrays to be stripslashed
*/
function EveStripslashes (&$value)
{
    if(empty($value))
        return;

    if (!is_array($value)) {
        $value = stripslashes($value);
    } else {
        array_walk($value, 'EveStripslashes');
    }
}

/**
* Callback function for pnVarPrepHTMLDisplay
*
* @author Xaraya development team
* @access private
*/
function VarPrepHTMLDisplay__callback($matches)
{
  if(empty($matches))
    return;

    return '<' . strtr($matches[1],
                       array('&gt;' => '>',
                             '&lt;' => '<',
                             '&quot;' => '"'/*,
                             '&amp;' => '&'*/))
           . '>';
}

?>