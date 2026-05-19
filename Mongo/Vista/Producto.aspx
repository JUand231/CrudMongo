<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Producto.aspx.cs"
    Inherits="Mongo.Vista.Producto" %>

<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Productos</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: #f0f4f8;
            min-height: 100vh;
            color: #1a202c;
        }

        .header {
            background: white;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            gap: 14px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.08);
        }

        .header-icon {
            width: 42px;
            height: 42px;
            background: linear-gradient(135deg, #00684A, #00ED64);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .header h1 {
            font-size: 20px;
            font-weight: 700;
            color: #1a202c;
        }

        .header p {
            font-size: 13px;
            color: #718096;
        }

        .main {
            max-width: 1100px;
            margin: 0 auto;
            padding: 32px 24px;
        }

        .card {
            background: white;
            border-radius: 20px;
            padding: 32px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            margin-bottom: 28px;
        }

        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

            .card-title::before {
                content: '';
                width: 4px;
                height: 18px;
                background: linear-gradient(135deg, #00684A, #00ED64);
                border-radius: 4px;
                display: inline-block;
            }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

            .form-group label {
                font-size: 13px;
                font-weight: 600;
                color: #4a5568;
            }

            .form-group input[type="text"] {
                padding: 11px 16px;
                border: 1.5px solid #e2e8f0;
                border-radius: 10px;
                font-size: 14px;
                font-family: 'Plus Jakarta Sans', sans-serif;
                color: #2d3748;
                background: #f8fafc;
                transition: all 0.2s ease;
                outline: none;
                width: 100%;
            }

                .form-group input[type="text"]:focus {
                    border-color: #00684A;
                    background: white;
                    box-shadow: 0 0 0 3px rgba(0, 104, 74, 0.08);
                }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 24px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 11px 24px;
            border: none;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            font-family: 'Plus Jakarta Sans', sans-serif;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #00684A, #00ED64);
            color: white;
        }

            .btn-primary:hover {
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(0, 104, 74, 0.3);
            }

        .btn-warning {
            background: #FFF8E7;
            color: #B7791F;
            border: 1.5px solid #F6E05E;
        }

            .btn-warning:hover {
                background: #F6E05E;
            }

        .btn-danger {
            background: #FFF5F5;
            color: #C53030;
            border: 1.5px solid #FEB2B2;
        }

            .btn-danger:hover {
                background: #FEB2B2;
            }

        .btn-secondary {
            background: #F7FAFC;
            color: #4a5568;
            border: 1.5px solid #e2e8f0;
        }

            .btn-secondary:hover {
                background: #EDF2F7;
            }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .badge {
            background: #E6FAF1;
            color: #00684A;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

            table th {
                background: #f8fafc;
                padding: 12px 16px;
                text-align: left;
                font-size: 12px;
                font-weight: 700;
                color: #718096;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                border-bottom: 2px solid #e2e8f0;
            }

            table td {
                padding: 14px 16px;
                font-size: 14px;
                color: #2d3748;
                border-bottom: 1px solid #f0f4f8;
            }

            table tr:hover td {
                background: #f8fafc;
            }

            table tr:last-child td {
                border-bottom: none;
            }

            table td:first-child {
                font-family: monospace;
                font-size: 11px;
                color: #a0aec0;
                max-width: 120px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

        .btn-select {
            padding: 6px 14px;
            background: #EBF8FF;
            color: #2B6CB0;
            border: 1.5px solid #BEE3F8;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            font-family: 'Plus Jakarta Sans', sans-serif;
            cursor: pointer;
            transition: all 0.2s;
        }

            .btn-select:hover {
                background: #BEE3F8;
            }
    </style>
</head>
<body>

    <div class="header">
        <div class="header-icon">🍃</div>
        <div>
            <h1>Gestión de Productos</h1>
            <p>MongoDB Atlas — PruebasMongo</p>
        </div>
    </div>

    <div class="main">
        <form runat="server">

            <asp:TextBox ID="txtId" runat="server" Visible="false" />

            <div class="card">
                <div class="card-title">Datos del Producto</div>
                <div class="form-grid">
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Descripción</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Precio</label>
                        <asp:TextBox ID="txtPrecio" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Stock</label>
                        <asp:TextBox ID="txtStock" runat="server" />
                    </div>
                </div>

                <div class="btn-group">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary" OnClick="btnLimpiar_Click" />
                </div>
            </div>

            <div class="card">
                <div class="table-header">
                    <div class="card-title" style="margin-bottom: 0">Lista de Productos</div>
                    <span class="badge">MongoDB</span>
                </div>
                <asp:GridView ID="gvProductos" runat="server"
                    AutoGenerateColumns="false"
                    OnRowCommand="gvProductos_RowCommand"
                    GridLines="None"
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                        <asp:BoundField DataField="Stock" HeaderText="Stock" />
                        <asp:ButtonField ButtonType="Button" CommandName="seleccionar"
                            Text="Seleccionar" ControlStyle-CssClass="btn-select" />
                    </Columns>
                </asp:GridView>
            </div>

        </form>
    </div>

</body>
</html>
