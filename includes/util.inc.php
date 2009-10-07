<?php

function get(&$value, $default = '') {
	if(!isset($value)) {
		$value = $default;
	}
	return $value;
}

function makekey() {
	return substr(sha1(uniqid(rand(), true)), 0, 8);
}

function hidemail($email) {
	$encoded = '';
	for($i = 0; $i < strlen($email); $i++) {
		$encoded .= '&#' . ord($email[$i]) . ';';
	}
	return '<a href="mailto:' . $encoded . '">' . $encoded . '</a>';
}
