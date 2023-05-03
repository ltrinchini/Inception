<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '${MYSQL_DB_NAME}' );

/** Database username */
define( 'DB_USER', '${MYSQL_USER}' );

/** Database password */
define( 'DB_PASSWORD', '${MYSQL_USER_PASSWORD}' );

/** Database hostname */
define( 'DB_HOST', '${MYSQL_DB_HOST}' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '^L8-Ms.a`d[S0*Rf2pCud[Vj3&R~xlL$naa,SQZ|0dIWO|DT3)c>xezBj{0_vKhe');
define('SECURE_AUTH_KEY',  '>mcsQ|kAK43dkT@OVsLzj(lb!O=v^pfxN[,+x<4a-vE]MQr|jEmfRME6[BQD0Q8]');
define('LOGGED_IN_KEY',    'IdX-KBsV[bO{z|/sY[wcCtU`x}e4y6bbEw@aI8V0}-&Pwa*,op+sRjm*NYzmGbk6');
define('NONCE_KEY',        '-s2<@*I+WM)!!}qGkHLDotK)fQb~V^Jak%N%t$$q,rwS9cf-LOj=c4&B!p-^ Oaq');
define('AUTH_SALT',        'l{vcG46^u |PFpr;7bo>7AO`T*]:PQ,^&ZijQ>TT9si_%23Ed l%Hb<shG<%C4Ic');
define('SECURE_AUTH_SALT', '>v85m*?:-OH+~oe]isj}cLXF3W_9-7-<XEJ3C:l+d6,zK9=+*gJ9L*rE5Mx(soAx');
define('LOGGED_IN_SALT',   '/b+Du_;MBMUG!h}?T4nh>ml$xb@KGb!aDbkc85cI_Q}&U,]j4CzXc}-xJE+a7H@z');
define('NONCE_SALT',       'm|w Ujfk[+i0Wh_&<~t<Z%lBL8,Qz]FeDhC7A5LhhIb&/y4?DMH-nyh{t]8|L=<d');
	
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 * $table_prefix='_wp';
 */

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
