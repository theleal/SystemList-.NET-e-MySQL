<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Default.aspx.cs" Inherits="DXWebApplication1.Default" %>

<%@ Register Assembly="DevExpress.Dashboard.v19.1.Web.WebForms, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <dx:ASPxCallbackPanel
        runat="server"
        ID="CallbackPanel"
        ClientInstanceName="CallbackPanel"
        RenderMode="Div"
        OnCallback="CallbackPanel_Callback">
        <SettingsLoadingPanel Text="Carregando&amp;hellip;" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxRoundPanel
                    runat="server"
                    ID="pnlFiltro"
                    ClientInstanceName="pnlFiltro"
                    HeaderText=""
                    HeaderContent-BackColor="Transparent"
                    Width="100%"
                    BackColor="Transparent"
                    ShowHeader="false"
                    EnableViewState="false">
                    <Border BorderColor="Transparent" BorderStyle="None" />
                    <ContentPaddings Padding="0px" PaddingBottom="0px" PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout runat="server" ID="layoutFormulario" RequiredMarkDisplayMode="RequiredOnly"
                                EnableViewState="false" EncodeHtml="false" UseDefaultPaddings="false" Width="100%" AllowCollapsingByHeaderClick="true">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800" />
                                <Items>
                                    <dx:LayoutGroup Caption="" ColCount="2" SettingsItemHelpTexts-Position="Bottom" GroupBoxDecoration="None" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="Nome Usuário" Width="50%">
                                                <CaptionStyle Font-Bold="true" />
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>

                                                        <dx:ASPxTextBox
                                                            class="inputs"
                                                            runat="server"
                                                            ID="PesquisaNomeCliente"
                                                            ClientInstanceName="PesquisaNomeCliente">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption="CPF:" Width="50%">
                                                <CaptionStyle Font-Bold="true" />
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>
                                                        <%--ClienteIntanceName= Utilizado para a página via JavaScript Encontrar o elemento da pagina --%>

                                                        <dx:ASPxTextBox
                                                            runat="server"
                                                            ID="PesquisaCPFCliente"
                                                            ClientInstanceName="PesquisaCPFCliente">
                                                        </dx:ASPxTextBox>

                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption="De:" Width="50%">
                                                <CaptionStyle Font-Bold="true" />
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>

                                                        <dx:ASPxDateEdit
                                                            runat="server"
                                                            ID="PesquisaDataInicio"
                                                            type="date"
                                                            ClientInstanceName="PesquisaDataInicio">
                                                        </dx:ASPxDateEdit>

                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption="Até:" Width="50%">
                                                <CaptionStyle Font-Bold="true" />
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>

                                                        <dx:ASPxDateEdit
                                                            runat="server"
                                                            ID="PesquisaDataFim"
                                                            type="date"
                                                            ClientInstanceName="PesquisaDataFim">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:ASPxFormLayout>


                            <br />


                            <dx:ASPxButton
                                runat="server"
                                ID="btnFiltro"
                                OnClick="btnFiltro_Click"
                                Text="Buscar">
                            </dx:ASPxButton>

                            <dx:ASPxButton
                                runat="server"
                                ID="btn_delete_Fields"
                                OnClick="delete_Fields"
                                Text="Limpar">
                            </dx:ASPxButton>
                        </dx:PanelContent>
                    </PanelCollection>


                </dx:ASPxRoundPanel>


                <dx:ASPxGridView
                    ID="ASPxGridView1"
                    ClientInstanceName="ASPxGridView1"
                    DataSourceID="SqlPessoa"
                    runat="server"
                    Theme="Office2010Blue"
                    Width="100%"
                    KeyFieldName="ID">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ID" Visible="false"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nome" FieldName="NOME"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="CPF" FieldName="CPF"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="E-mail" FieldName="EMAIL"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Data Nascimento" FieldName="DATANASCIMENTO"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Genero" FieldName="GENERO"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Celular" FieldName="CELULAR"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Senha" FieldName="SENHA"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>


    <asp:SqlDataSource
        runat="server"
        ID="SqlPessoa"
        OnInit="SqlPessoa_Init"
        ProviderName="System.Data.SqlClient"
        OnSelecting="SqlPessoa_Selecting"
        ConnectionString="<%$ ConnectionStrings:iPortSolutionsSqlServerContext %>"></asp:SqlDataSource>

</asp:Content>
