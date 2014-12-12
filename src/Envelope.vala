/* Copyright 2014 Nicolas Laplante
*
* This file is part of envelope.
*
* envelope is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* envelope is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with envelope. If not, see http://www.gnu.org/licenses/.
*/

public class Envelope.App : Granite.Application {

    public const string PROGRAM_NAME = "Envelope";

    construct {
        // This allows opening files. See the open() method below.
        flags |= ApplicationFlags.HANDLES_OPEN;

        // App info
        build_data_dir = Build.DATADIR;
        build_pkg_data_dir = Build.PKG_DATADIR;
        build_release_name = Build.RELEASE_NAME;
        build_version = Build.VERSION;
        build_version_info = Build.VERSION_INFO;

        program_name = PROGRAM_NAME;
        exec_name = "envelope";

        app_copyright = "2014";
        application_id = "net.launchpad.envelope";
        app_icon = "multimedia-audio-player";
        app_launcher = "envelope.desktop";
        app_years = "2014";

        main_url = "https://launchpad.net/envelope";
        bug_url = "https://bugs.launchpad.net/envelope";
        help_url = "http://answers.launchpad.net/envelope";
        translate_url = "https://translations.launchpad.net/envelope";

        about_authors = {"Nicolas Laplante <nicolas.laplante@gmail.com>"};
        about_comments = "";
        about_license_type = Gtk.License.GPL_3_0;
    }

    public static MainWindow? main_window = null;

    protected override void activate () {

        //if (DEBUG)
            Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.DEBUG;
        //else
        //  Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.INFO;

        if (main_window == null) {
            main_window = new MainWindow ();
            main_window.set_application (this);
            main_window.build_ui ();
        }

        main_window.show ();
    }

    public string get_id () {
        return "net.launchpad.envelope";
    }

    public string get_name () {
        return PROGRAM_NAME;
    }
}