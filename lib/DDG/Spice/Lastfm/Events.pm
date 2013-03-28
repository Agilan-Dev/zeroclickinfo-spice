package DDG::Spice::Lastfm::Events;
# ABSTRACT: Search for music shows near the user location.

use DDG::Spice;

spice to => 'http://ws.audioscrobbler.com/2.0/?format=json&method=geo.getevents&lat=$1&long=$2&api_key=d26f0dc7944e0282b4ea1bbfb7521064&callback={{callback}}';

spice from => '(\-?\d+\.\d+?)\/(\-?\d+\.\d+?)';

triggers query_lc => qr/^(?:concerts?|music shows?|shows?|gigs)\s+(?:near?|near me)/;

primary_example_queries "concerts near";
secondary_example_queries "shows near", "music shows near me", "gigs near";
description "Music show information";
name "LastfmEvents";
icon_url "/i/www.last.fm.ico";
source "Last.fm";
code_url "https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Lastfm/Events.pm";
topics "entertainment", "music";
category "entertainment";
attribution github => ['https://github.com/frncscgmz','frncscgmz'];

handle query_lc => sub {
   return ($loc->latitude,$loc->longitude);
};

1;
