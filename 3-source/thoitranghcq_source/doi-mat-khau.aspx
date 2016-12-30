<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="doi-mat-khau.aspx.cs" Inherits="doi_mat_khau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Đổi mật khẩu</title>
    <meta name="description" content="Đổi mật khẩu" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="resiterwrap" class="wrap-register" style="display: block">
        <h2>
            Đổi mật khẩu</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ChangePassword ID="ChangePassword1" runat="server" OnContinueButtonClick="ChangePassword1_ContinueButtonClick"
                    ChangePasswordFailureText="Mật khẩu không chính xác hoặc Mật khẩu mới không hợp lệ. Mật độ dài tối thiểu mới: {0}. Ký tự chữ số yêu cầu: {1}." CssClass="form-changepass">
                    <ChangePasswordTemplate>
                        <asp:Panel ID="Panel3" DefaultButton="ChangePasswordPushButton" runat="server">
                            <fieldset class="addres-info">
                                <div class="info-input">
                                    <label class="info-lb info-l16">
                                        <span class="error-lb">*</span>Mật khẩu cũ</label>
                                    <div class="info-text-a">
                                        <asp:TextBox ID="CurrentPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                            Display="Dynamic" ValidationGroup="ChangePassword" ControlToValidate="CurrentPassword"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb info-l16">
                                        <span class="error-lb">*</span>Mật khẩu mới</label>
                                    <div class="info-text-a">
                                        <asp:TextBox ID="NewPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                            Display="Dynamic" ValidationGroup="ChangePassword" ControlToValidate="NewPassword"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb info-l16">
                                        <span class="error-lb">*</span>Nhập lại mật khẩu mới</label>
                                    <div class="info-text-a">
                                        <asp:TextBox ID="ConfirmNewPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                            Display="Dynamic" ValidationGroup="ChangePassword" ControlToValidate="ConfirmNewPassword"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                            ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Vui lòng nhập lại mật khẩu mới."
                                            ValidationGroup="ChangePassword"></asp:CompareValidator>
                                        <asp:Literal ID="Literal1" runat="server" EnableViewState="False"></asp:Literal>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <div class="info-text check-text">
                                        <asp:Button ID="ChangePasswordPushButton" CommandName="ChangePassword" runat="server"
                                            CssClass="btn-button" ValidationGroup="ChangePassword" Text="Cập nhật" />
                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Hủy" CssClass="btn-button" />
                                    </div>
                                </div>
                            </fieldset>
                        </asp:Panel>
                    </ChangePasswordTemplate>
                    <SuccessTemplate>
                        <asp:Panel ID="Panel4" DefaultButton="ContinuePushButton" runat="server">
                            <fieldset class="addres-info">
                                <p style="font-size: 14px;">
                                    Bạn đã thay đổi mật khẩu thành công.</p>
                                <br />
                                <p>
                                    <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue"
                                        Text="Tiếp tục" CssClass="btn-button" /></p>
                            </fieldset>
                        </asp:Panel>
                    </SuccessTemplate>
                </asp:ChangePassword>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

