/*
 * Copyright (c) 2003 by the gtk2-perl team (see the file AUTHORS)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the 
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330, 
 * Boston, MA  02111-1307  USA.
 *
 * $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gtk2/xs/GtkVButtonBox.xs,v 1.4 2003/05/22 14:23:24 muppetman Exp $
 */

#include "gtk2perl.h"

MODULE = Gtk2::VButtonBox	PACKAGE = Gtk2::VButtonBox	PREFIX = gtk_vbutton_box_

## GtkWidget* gtk_vbutton_box_new (void)
GtkWidget *
gtk_vbutton_box_new (class)
	SV * class
    C_ARGS:

## void gtk_vbutton_box_set_spacing_default (gint spacing)
void
gtk_vbutton_box_set_spacing_default (spacing)
	gint spacing

## GtkButtonBoxStyle gtk_vbutton_box_get_layout_default (void)
GtkButtonBoxStyle
gtk_vbutton_box_get_layout_default ()

## void gtk_vbutton_box_set_layout_default (GtkButtonBoxStyle layout)
void
gtk_vbutton_box_set_layout_default (layout)
	GtkButtonBoxStyle layout

##gint gtk_vbutton_box_get_spacing_default (void)
gint
gtk_vbutton_box_get_spacing_default (class)
	SV * class
    C_ARGS:

