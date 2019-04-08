﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grammy_New3
{
    public partial class AAS2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (DDL4.SelectedValue == "Artist")
            {
                DropDownList3.DataTextField = "artist_name";
                DropDownList3.DataValueField = "artist_name";
            }
            else
            {
                if (DDL4.SelectedValue == "Album")
                {
                    DropDownList3.DataTextField = "album_name";
                    DropDownList3.DataValueField = "album_name";
                }
                else
                {
                    if (DDL4.SelectedValue == "Song")
                    {
                        DropDownList3.DataTextField = "song_name";
                        DropDownList3.DataValueField = "song_name";
                    }
                    else
                    {
                        if (DDL4.SelectedValue == "Songwriter")
                        {
                            DropDownList3.DataTextField = "composer_name";
                            DropDownList3.DataValueField = "composer_name";
                        }
                        else
                        {

                        }
                    }
                }
            }


        }
 
    }
}