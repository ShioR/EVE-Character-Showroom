<?php
// $Id$
/**
 *
 * * eveRender *
 *
 * Eve wrapper class for Smarty adapted from PostNuke
 *
 * * License *
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License (GPL)
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * @author      PostNuke development team
 * @version     .7/.8
 * @link        http://www.post-nuke.net              PostNuke home page
 * @link        http://smarty.php.net                 Smarty home page
 * @license     http://www.gnu.org/copyleft/gpl.html  GNU General Public License
 * @package     Xanthia_Templating_Environment
 * @subpackage  eveRender
 */

// keeping track if Smarty is loaded somewhere else!
if (!class_exists('Smarty')) {
    /**
     * The directory of Smarty
     */
    define('SMARTY_DIR', 'includes/Smarty/');
    require_once (SMARTY_DIR . 'Smarty.class.php');
}


/**
 * Our class
 *
 * @package     Xanthia_Templating_Environment
 * @subpackage  eveRender
 */
class eveRender extends Smarty {

    /**
     * The cache ID of the object
     */
    var $cache_id;

    /**
     * The class constructor.
     */
    function eveRender($config = array(), $caching = null)
    {
        // first, get a native Smarty object
        $this->Smarty();

        // begin holder tag (be nice to others)
        $this->left_delimiter = '<!--[';
        // end holder tag
        $this->right_delimiter = ']-->';

        //---- Plugins handling -----------------------------------------------
        if (is_dir('includes/plugins')) {
            array_push($this->plugins_dir, 'includes/plugins');
        }

        if (is_dir('themes/'.$config['theme'].'/plugins')) {
            array_push($this->plugins_dir, 'themes/'.$config['theme'].'/plugins');
        }

        //---- Cache handling -------------------------------------------------
        // use HTML cache system?
        //$this->caching = pnModGetVar('pnrender', 'cache');
        //$this->cache_lifetime = pnModGetVar('pnrender', 'lifetime');

        // HTML cache directory
        //$this->cache_dir = $config['filepath'] . '/eveRender_cache';

        //---- Compilation handling -------------------------------------------
        // check for updated templates?
        $this->compile_check = true;

        // force compile template always?
        $this->force_compile = false;

        // don't use subdirectories when creating compiled/cached templates
        // this works better in a hosted environment
        $this->use_sub_dirs = false;
        //$this->use_sub_dirs = !((bool)$safe_mode ||
        //                      (bool)$safe_mode_gid ||
        //                      !empty($open_basedir));

        // cache directory (compiled templates)
        $this->compile_dir = $config['filepath'];

        // compile id
        $this->compile_id = $config['characterID']; //'';//$this -> module . '|' . $theme . '|' . pnUserGetLang();

        // initialize the cache ID
        $this->cache_id = '';

        // expose templates
        $this->expose_template = false;

        $this->register_block('nocache', 'eveRender_block_nocache', false);

        $this->theme = $config['theme'];

        if (defined('_SHORTURLS') && _SHORTURLS == true) {
            $this->load_filter('output', 'shorturls');
        }
    }

    /**
     * Checks whether requested template exists.
     *
     * @param string $template
     */
    function template_exists($template)
    {
        return (bool)$this->get_template_path($template);
    }

    /**
     * Checks which path to use for required template
     *
     * @param string $template
     */
    function get_template_path($template)
    {
        $path = 'themes/'.$this->theme;
        return $path;
    }

    /**
     * executes & returns the template results
     *
     * This returns the template output instead of displaying it.
     * Supply a valid template name.
     * As an optional second parameter, you can pass a cache id.
     * As an optional third parameter, you can pass a compile id.
     *
     * @param   string   $template    the name of the template
     * @param   string   $cache_id    (optional) the cache ID
     * @param   string   $compile_id  (optional) the compile ID
     * @param   boolean  $display
     * @return  string   the template output
     */
    function fetch($template, $cache_id=null, $compile_id=null, $display = false)
    {
        $this->_setup_template($template);

        if (!is_null($cache_id)) {
            $cache_id = $this->module . '|' . $cache_id;
        } else {
            $cache_id = $this->module . '|' . $this->cache_id;
        }

        $output = parent::fetch($template, $cache_id, $compile_id, $display);

        if($this->expose_template == true) {
            $output = "\n<!-- begin of ".$this->template_dir."/$template -->\n"
                      . $output
                      . "\n<!-- end of ".$this->template_dir."/$template -->\n";
        }

        return $output;
    }

    /**
     * executes & displays the template results
     *
     * This displays the template.
     * Supply a valid template name.
     * As an optional second parameter, you can pass a cache id.
     * As an optional third parameter, you can pass a compile id.
     *
     * @param   string   $template    the name of the template
     * @param   string   $cache_id    (optional) the cache ID
     * @param   string   $compile_id  (optional) the compile ID
     * @return  void
     */
    function display($template, $cache_id=null, $compile_id=null)
    {
        echo $this->fetch($template, $cache_id, $compile_id);
    }

    /**
     * finds out if a template is already cached
     *
     * This returns true if there is a valid cache for this template.
     * Right now, we are just passing it to the original Smarty function.
     * We might introduce a function to decide if the cache is in need
     * to be refreshed...
     *
     * @param   string   $template    the name of the template
     * @param   string   $cache_id    (optional) the cache ID
     * @return  boolean
     */
    function is_cached($template, $cache_id=null, $compile_id=null)
    {
        // insert the condition to check the cache here!
        // if (functioncheckdb($this -> module)) {
        //        return parent :: clear_cache($template, $this -> cache_id);
        //}
        $this->_setup_template($template);

        if ($cache_id) {
            $cache_id = $this->module . '|' . $cache_id;
        } else {
            $cache_id = $this->module . '|' . $this->cache_id;
        }

        if (!isset($compile_id)) {
            $compile_id = $this->compile_id;
        }

        return parent::is_cached($template, $cache_id, $compile_id);
    }

    /**
     * clears the cache for a specific template
     *
     * This returns true if there is a valid cache for this template.
     * Right now, we are just passing it to the original Smarty function.
     * We might introduce a function to decide if the cache is in need
     * to be refreshed...
     *
     * @param   string   $template    the name of the template
     * @param   string   $cache_id    (optional) the cache ID
     * @param   string   $compile_id  (optional) the compile ID
     * @param   string   $expire      (optional) minimum age in sec. the cache file must be before it will get cleared.
     * @return  boolean
     */
    function clear_cache($template=null, $cache_id=null, $compile_id=null, $expire=null)
    {
        if ($cache_id) {
            $cache_id = $this->module . '|' . $cache_id;
        } else {
            $cache_id = $this->module . '|' . $this->cache_id;
        }
        // the cache ID must not end on a |
        $cache_id = preg_replace('/\|$/', '', $cache_id);

        return parent::clear_cache($template, $cache_id, $compile_id, $expire);
    }

    /**
     * clear the entire contents of cache (all templates)
     *
     * Smarty's original clear_all_cache function calls the subclasse's
     * clear_cache function. As we always prepend the module name, this
     * doesn't work here...
     *
     * @param string $exp_time expire time
     * @return boolean results of {@link smarty_core_rm_auto()}
     */
    function clear_all_cache($exp_time = null)
    {
        return parent::clear_cache(null, null, null, $exp_time);
    }

    /**
     * set up paths for the template
     *
     * This function sets the template path
     *
     * @param   string   $template   the template name
     * @access  private
     */
    function _setup_template($template)
    {
        // default directory for templates
        $this->template_dir = $this->get_template_path($template);
    }

}

?>