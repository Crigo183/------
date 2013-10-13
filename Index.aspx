<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication.Index" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="WebApplication" %>
<% DbManager.Server = Server;
   var possuiSessao = ViewState["Sessao"] != null;
   btnSalvar.Enabled = possuiSessao;
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Diagrama V de Gowin - Aplicação Web</title>
    <link rel="stylesheet" href="css.css"/>
    <link rel="shortcut icon" href="img/icon.ico" type="image/x-icon">
    <style type="text/css">
        .auto-style1 {
            width: 33%;
        }
        .auto-style2 {
            background-image: url('img/TM.png');
            background-size: 100% 100%;
            min-height: 80px;
            height: 80px;
            padding: 15px;
            text-align: center;
            width: 33%;
        }
        .auto-style3 {
            background-image: url('img/BM.png');
            background-size: 100% 100%;
            max-height: 55px;
            height: 55px;
            padding: 15px;
            text-align: center;
            width: 33%;
        }
        .auto-style4 {
            background-image: url('img/TM.png');
            background-size: 100% 100%;
            min-height: 100px;
            height: 100px;
            padding: 15px;
            text-align: center;
            width: 33%;
        }
    </style>
</head>
    <body>
        <form id="frmMain" runat="server">
            <table class="midTable">
                <tr>
                    <td class="top">
                        <div id="titleApp"><img src="img/icon.ico" id="logoImg" alt="Erro"/>   V de Gowin</div>
                    </td>
                    <td class="top">
                        <nav>
                            <ul id="menu">
                                <li><a href="#">Arquivo</a>
                                    <ul>
                                        <li><asp:LinkButton CssClass="menuLink" runat="server" OnClick="BtnClick__">Novo diagrama</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="btnSalvar" CssClass="menuLink" runat="server" >Salvar</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="btnExportarPDF" CssClass="menuLink" runat="server" OnClick="btnExportarPDF_OnClick">Exportar para PDF</asp:LinkButton></li>
                                    </ul>
                                </li>
                                <li><a href="#">Sessão</a>
                                    <ul>
                                        <li><asp:LinkButton CssClass="menuLink" runat="server" href="#">Trocar usuário</asp:LinkButton></li>
                                        <li><asp:LinkButton CssClass="menuLink" runat="server" href="#">Sair</asp:LinkButton></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </td>
                </tr>
                <tr>
                    <td class="menu">
                        <% if (ViewState["Sessao"] == null)
                           { %>
                        <font id="titleMenu">Menu</font>
                        <asp:ListBox ID="ltbProjetos" runat="server">
                            
                        </asp:ListBox>
                        <% }
                           else
                           { %>
                            
                            <label> Você não está logado!!!<br/>
                                Realize o log-in ou registre-se.
                            </label>

                        <% } %>
                    </td>
                    <td class="diag">
                        <center>
                            <% switch (ViewState["PAGINA_ATUAL"] != null ? ViewState["PAGINA_ATUAL"].ToString() : "")
                               {
                                   case "diagrama":
                                       {
                                           %>
                                                <table id="tblDiag">
                                                    <tr>
                                                        <td id="tblDiagTopL">Domínio conceitual</td>
                                                        <td id="tblDiagTopM" class="auto-style1"></td>
                                                        <td id="tblDiagTopR">Domínio metodológico</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagMidL">Filosofia<br />
                                                            <asp:TextBox ID="tbxFilosofia" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style2" rowspan="2">Questões básicas<br/>
                                                            <asp:TextBox ID="tbxQuestoesBasicas" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="tblDiagMidR">Asserções de valor<br/>
                                                            <asp:TextBox ID="tbxAssercoesDeValor" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagMidL">Teoria<br />
                                                            <asp:TextBox ID="tbxTeoria" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="tblDiagMidR">Asserções de conhecimento<br/>
                                                            <asp:TextBox ID="tbxAssercoesDeConhecimento" CssClass="textBox" OnTextChanged="tbx_OnTextChanged" runat="server" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagMidL">Princípios<br />
                                                            <asp:TextBox ID="tbxPrincipios" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style2"></td>
                                                        <td class="tblDiagMidR">Transformações<br/>
                                                            <asp:TextBox ID="tbxTransformacoes" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagMidL">Sistemas conceituais<br />
                                                            <asp:TextBox ID="tbxSistemasConceituais" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style2"></td>
                                                        <td class="tblDiagMidR">Registros<br/>
                                                            <asp:TextBox ID="tbxRegistros" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagMidL">Conceitos<br />
                                                            <asp:TextBox ID="tbxConceitos" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style2"></td>
                                                        <td class="tblDiagMidR"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagBotL"></td>
                                                        <td class="auto-style3"></td>
                                                        <td class="tblDiagBotR"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tblDiagBot"></td>
                                                        <td class="auto-style4">Eventos<br />
                                                            <asp:TextBox ID="tbxEventos" CssClass="textBox" runat="server" OnTextChanged="tbx_OnTextChanged" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                                        </td>
                                                        <td class="tblDiagBot"></td>
                                                    </tr>
                                                </table>
                                           <%
                                           break;
                                       }
                               } %>
                        </center>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
