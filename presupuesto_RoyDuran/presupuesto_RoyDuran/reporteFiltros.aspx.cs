﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presupuesto_RoyDuran
{
    public partial class reporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int tipoTrans;
            lblTipoT.Text = drdTipoT.SelectedValue;
            tipoTrans = int.Parse(lblTipoT.Text);
        }

    }
}