#!/usr/bin/perl -w
use strict;
use Gtk2::TestHelper tests => 1;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gtk2/t/GtkGC.t,v 1.1 2004/04/19 19:20:52 kaffeetisch Exp $

my $black = Gtk2::Gdk::Color -> new(0, 0, 0);
my $colormap = Gtk2::Gdk::Colormap -> get_system();

my $values = {
  foreground => $black,
  background => $black,
  function => "copy",
  fill => "tiled",
  subwindow_mode => "clip-by-children",
  ts_x_origin => 0,
  ts_y_origin => 0,
  clip_x_origin => 0,
  clip_y_origin => 0,
  graphics_exposures => 1,
  line_width => 5,
  line_style => "solid",
  cap_style => "butt",
  join_style => "round"
};

my $gc = Gtk2::GC -> get(16, $colormap, $values);
isa_ok($gc, "Gtk2::Gdk::GC");

Gtk2::GC -> release($gc);

__END__

Copyright (C) 2003 by the gtk2-perl team (see the file AUTHORS for the
full list).  See LICENSE for more information.
