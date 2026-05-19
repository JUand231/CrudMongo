using Mongo.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mongo.Vista
{
    public partial class Producto : System.Web.UI.Page
    {
        public ProductoL logica = new ProductoL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTabla();
            }
        }

        private void CargarTabla()
        {
            gvProductos.DataSource = logica.MtListar();
            gvProductos.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();
            producto.Nombre = txtNombre.Text;
            producto.Descripcion = txtDescripcion.Text;
            producto.Precio = double.Parse(txtPrecio.Text);
            producto.Stock = int.Parse(txtStock.Text);

            logica.MtAgregar(producto);
            CargarTabla();
            Limpiar();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();
            producto.Id = txtId.Text;
            producto.Nombre = txtNombre.Text;
            producto.Descripcion = txtDescripcion.Text;
            producto.Precio = double.Parse(txtPrecio.Text);
            producto.Stock = int.Parse(txtStock.Text);

            logica.MtModificar(producto);
            CargarTabla();
            Limpiar();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            logica.MtBorrar(txtId.Text);
            CargarTabla();
            Limpiar();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        private void Limpiar()
        {
            txtId.Text = "";
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
        }

        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "seleccionar")
            {
                int fila = int.Parse(e.CommandArgument.ToString());
                txtId.Text = gvProductos.Rows[fila].Cells[0].Text;
                txtNombre.Text = gvProductos.Rows[fila].Cells[1].Text;
                txtDescripcion.Text = gvProductos.Rows[fila].Cells[2].Text;
                txtPrecio.Text = gvProductos.Rows[fila].Cells[3].Text;
                txtStock.Text = gvProductos.Rows[fila].Cells[4].Text;
            }
        }
    }
}
