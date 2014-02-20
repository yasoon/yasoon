<?php

$path = 'frontend_src/templates/';
$iterator = new DirectoryIterator($path);
foreach ($iterator as $file) {
    touch($path.$file);
}