/* Debugging in PHP requires composer
1. Install composer globally or locally (https://getcomposer.org/download/)
2. `php composer.phar require psy/psysh:@stable`
3. Debug statement is eval(\Psy\sh()); */

<?php
  require('vendor/autoload.php');

  function add($x, $y) {
    $total = $x + $y;
    eval(\Psy\sh());
  }

  add(2,3);
?>
