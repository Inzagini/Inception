<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'docker-php' );

/** Database username */
define( 'DB_USER', 'user' );

/** Database password */
define( 'DB_PASSWORD', 'secret' );

/** Database hostname */
define( 'DB_HOST', 'db' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         'LR!9[y4/8G8v@^ZTAO &}Kv=@]L/DxvY>DP*It58fI#S$2,1ET^cav*y,{p4^oU[' );
define( 'SECURE_AUTH_KEY',  '}!:PC:1c8VY^n:g5<tO_0EkZF*+LJ&38Kz&G.LNHlzv6t%6-Y9]RgQ8+{vhK<7Tp' );
define( 'LOGGED_IN_KEY',    'Ng;V;nhqc;E+)[zu5s,/GI~-&nk)9xhGgJr9g+25`uvTqpK%VS%Q:zNt/%y*1hur' );
define( 'NONCE_KEY',        '}(EgNs2G6=Sw?)JcJL_ mt aqHJ#$y682<as+fb<6pr/Lx$tXi`TN$B]%%C7#QxB' );
define( 'AUTH_SALT',        'i{te28.3+sG/HI=2woL(p)-_TJT4jvjBu5,=mTg<)R($t2`~P_u%8+`Lp7x4%9V6' );
define( 'SECURE_AUTH_SALT', 'K2 O5I3n.VQB2to4 $}A+AICc5$cgM -A6zq1fuj7NC)1_&4b,VZ?;hiQ/E<y-PT' );
define( 'LOGGED_IN_SALT',   'AAW$7o:&`X<fKKg{o~Z]mRoHce1x*ekG|H*c79iAm@o30RIffxTWiDyi%F`Rno4D' );
define( 'NONCE_SALT',       'SN=B0|s5r<,?jp4t|4<a.Sp[d$.d^#iL3+c].cd9VIgyx|3IcH=yM8iJ:(+!AhnQ' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
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
