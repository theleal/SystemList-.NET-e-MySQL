using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Excel;
using DevExpress.DataAccess.Sql;
using System;

using System.Web.Hosting;

namespace DXWebApplication1 {

    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            


        }

        protected void SqlPessoa_Init(object sender, EventArgs e)
        {

            string strConsulta = $@"select 
	                                    id as ID,
	                                    nome as NOME,
	                                    cpf as CPF,
	                                    email as EMAIL,
	                                    data_nascimento as DATANASCIMENTO,
	                                    genero as GENERO,
	                                    celular as CELULAR,
	                                    senha as SENHA 

                                from iPortCrud.dbo.usuarios
                                where id is not null ";

            if (!string.IsNullOrEmpty(PesquisaNomeCliente.Text))            
                strConsulta += $@"and nome like '%{PesquisaNomeCliente.Text}%'";            

            if (!string.IsNullOrEmpty(PesquisaCPFCliente.Text))
                strConsulta += $@"and cpf like '%{PesquisaCPFCliente.Text}%'";


            if (!string.IsNullOrEmpty(PesquisaDataInicio.Text) && (!string.IsNullOrEmpty(PesquisaDataFim.Text)))
            {
                strConsulta += $@"and data_nascimento BETWEEN '{PesquisaDataInicio.Text}' AND '{PesquisaDataFim.Text}' ";
            } 
            
            else if (!string.IsNullOrEmpty(PesquisaDataInicio.Text) && (string.IsNullOrEmpty(PesquisaDataFim.Text)))
            {
                strConsulta += $@"and data_nascimento >= '{PesquisaDataInicio.Text}' ";
            } 




            SqlPessoa.SelectCommand = strConsulta;
            
        }

        protected void SqlPessoa_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {
            //e.Command.Parameters["@NomeUsuario"].Value = !string.IsNullOrEmpty(PesquisaNomeCliente.Text) ? PesquisaNomeCliente.Text.ToString(): " ";
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            SqlPessoa_Init(null, null);

            //Função DataBind é utilizada para DAR UM REFRESH NO GRID
            ASPxGridView1.DataBind(); 
        }

        protected void delete_Fields(object sender, EventArgs e)
        {
            PesquisaNomeCliente.Text = "";
            PesquisaDataInicio.Text = "";
            PesquisaDataFim.Text = "";
            PesquisaCPFCliente.Text = "";

            ASPxGridView1.DataBind();
        }

        protected void search_CPF(object sender, EventArgs e)
        {

            SqlPessoa_Init(null, null);
            ASPxGridView1.DataBind();
        }

        protected void CallbackPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

        }
    }
}