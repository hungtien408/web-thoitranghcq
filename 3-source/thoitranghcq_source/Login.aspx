<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Login </title>
    <link href="assets/styles/login.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        fieldset {
            margin: 1em 0px;
            padding: 1em;
            border: 2px solid #1464a4;
            color: #1464a4;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

            fieldset p {
                margin: 2px 12px 10px 10px;
            }

            fieldset.login label, fieldset.register label, fieldset.changePassword label {
                display: block;
            }

            fieldset label.inline {
                display: inline;
            }

        legend {
            font-size: 1.1em;
            font-weight: 600;
            padding: 2px 4px 8px 4px;
            color: #1464a4;
        }

        input.textEntry {
            width: 320px;
            border: 1px solid #ccc;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            height: 25px;
            padding-left: 10px;
        }

        input.passwordEntry {
            width: 320px;
            border: 1px solid #ccc;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            height: 25px;
            padding-left: 10px;
        }

        div.accountInfo {
            width: 376px;
            background-color: #FFF;
            margin: 0 auto;
        }

        .failureNotification {
            color: Red;
            margin-left: 280px;
        }

        .submitButton {
            float: right;
        }

        .button {
            width: 5em;
            padding: 0.2em;
            line-height: 1.4;
            background-color: #1464a4;
            border: none;
            color: #fff;
            text-align: center;
            text-decoration: none;
            display: block;
        }

        .login-form {
            margin: 0 auto;
        }
        .inline input {
            float: left;
            margin-right: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="login-forms">
        <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn" CssClass="login-form">
            <LayoutTemplate>
                <asp:Panel ID="Panel1" runat="server" DefaultButton="LoginButton">
                    <div class="accountInfo">
                        <fieldset class="login">
                            <div class="input-f">
                                <asp:Label ID="UserNameLabel" CssClass="login-lb" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                <asp:TextBox ID="UserName" CssClass="textEntry" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" CssClass="login-error" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="input-f">
                                <asp:Label ID="PasswordLabel" CssClass="login-lb" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                <asp:TextBox ID="Password" CssClass="passwordEntry" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" CssClass="login-error" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="input-f">
                                <asp:CheckBox ID="RememberMe" CssClass="inline" runat="server" Text="Remember me next time." />
                            </div>
                            <div class="input-f">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" CssClass="button" />
                                <a href="recoverypassword.aspx" style="float: right;">Forgot Your Password?</a>
                            </div>
                        </fieldset>
                    </div>
                </asp:Panel>
            </LayoutTemplate>
        </asp:Login>
    </div>
    <div class="clr">
    </div>
</asp:Content>
