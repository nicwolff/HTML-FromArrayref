#!perl -T

use Test::More tests => 6;

BEGIN { use_ok('HTML::FromArrayref'); }

is(
	HTML( [ p => 'foo' ] ),
	'<p>foo</p>',
	'prints an HTML element'
);

is(
	HTML( [ p => { attrib => 'this&that' }, 'foo' ] ),
	'<p attrib="this&amp;that">foo</p>',
	'encodes attribute values'
);

is(
	HTML( [ p => [ b => 'bold' ], 'foo' ] ),
	'<p><b>bold</b>foo</p>',
	'prints nested HTML elements'
);

is(
	HTML( [ p => [ 0 && b => 'notbold' ], 'foo' ] ),
	'<p>notboldfoo</p>',
	'skips HTML elements with false tag names'
);

is(
	HTML( [ p => 'foo', [[ '<i>italics</i>' ]] ] ),
	'<p>foo<i>italics</i></p>',
	'leaves already-escaped text alone'
);