#
# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gtk2/t/GtkActionGroup.t,v 1.4 2004/03/17 03:52:24 muppetman Exp $
#

use Gtk2::TestHelper
	at_least_version => [2, 4, 0, "Action-based menus are new in 2.4"],
#	tests => 9, noinit => 1;
	tests => 11;

my $action_group = Gtk2::ActionGroup->new ("Fred");

isa_ok ($action_group, "Gtk2::ActionGroup");
is ($action_group->get_name, "Fred");

$action_group->set_sensitive (1);
is ($action_group->get_sensitive, 1);

$action_group->set_visible (1);
is ($action_group->get_visible, 1);

my $action = Gtk2::Action->new (name => 'Barney');

$action_group->add_action ($action);

my @list = $action_group->list_actions;
is (@list, 1);
is ($list[0], $action);
is ($action_group->get_action ('Barney'), $action);
$action_group->remove_action ($action);
@list = $action_group->list_actions;
is (@list, 0);

$action_group->add_action_with_accel ($action, undef);
$action_group->add_action_with_accel ($action, "<shift>a");

$action_group->remove_action ($action);
$action_group->remove_action ($action);

my @action_entries = (
  {
    name        => 'open',
    stock_id    => 'gtk-open',
    label       => 'Open',
    accelerator => '<control>o',
    tooltip     => 'Open something',
    callback    => sub { ok (TRUE) },
  },
  {
    name        => 'new',
    stock_id    => 'gtk-new',
  },
  {
    name        => 'old',
    label       => 'Old',
  },
  [ 'close', 'gtk-close', 'Close', '<control>w', 'Close something', sub { ok (TRUE) } ],
  [ 'quit', 'gtk-quit', undef, '<control>q', ],
  [ 'sep',  undef, 'blank', ],
);

my @toggle_entries = (
  [ "Bold", 'gtk-bold', "_Bold",               # name, stock id, label
     "<control>B", "Bold",                     # accelerator, tooltip 
    \&activate_action, TRUE ],                 # is_active 
);

use constant COLOR_RED   => 0;
use constant COLOR_GREEN => 1;
use constant COLOR_BLUE  => 2;

my @color_entries = (
  # name,    stock id, label,    accelerator,  tooltip, value 
  [ "Red",   undef,    "_Red",   "<control>R", "Blood", COLOR_RED   ],
  [ "Green", undef,    "_Green", "<control>G", "Grass", COLOR_GREEN ],
  [ "Blue",  undef,    "_Blue",  "<control>B", "Sky",   COLOR_BLUE  ],
);

#$action_group->add_actions (\@action_entries, 42)
$action_group->add_actions (\@action_entries);
@list = $action_group->list_actions;
is (@list, 6);

$action_group->add_toggle_actions (\@toggle_entries, 42);
#$action_group->add_toggle_actions (\@toggle_entries);
@list = $action_group->list_actions;
is (@list, 7);


#$action_group->add_radio_actions (\@color_entries, COLOR_BLUE, \&on_change, 42);
$action_group->add_radio_actions (\@color_entries, COLOR_GREEN, \&on_change);
@list = $action_group->list_actions;
is (@list, 10);

__END__

Copyright (C) 2003 by the gtk2-perl team (see the file AUTHORS for the
full list).  See LICENSE for more information.
