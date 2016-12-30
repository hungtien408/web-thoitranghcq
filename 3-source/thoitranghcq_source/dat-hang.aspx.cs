using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class dat_hang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                //pnlInformationNoLogin.Visible = false;
                //btnOrder.Visible = false;
                //OdsAddressBook.SelectParameters["UserName"].DefaultValue = User.Identity.Name;
                //if (Session["ShippingID"] == null)
                //    OdsAddressBook.SelectParameters["IsPrimary"].DefaultValue = "True";
                //if (!User.Identity.IsAuthenticated)
                //    Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);
                txtEmail.Text = Session["UserName"].ToString();
                txtFullName.Text = Session["FullNameUser"].ToString();
            }
            else if (Session["IsBookNonLogin"] == null || Session["IsBookNonLogin"] == "False")
            {
                //Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);
                Response.Redirect("~/login.aspx");
            }
        }
    }

    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            //var lblTotalPrice = ListView1.FindControl("lblTotalPrice") as Label;
            //var hdnTotalPrice = ListView1.FindControl("hdnTotalPrice") as HiddenField;

            //var lblSumTotalPrice = ListView1.FindControl("lblSumTotalPrice") as Label;
            //var hdnSumTotalPrice = ListView1.FindControl("hdnSumTotalPrice") as HiddenField;

            //var lblShippingPrice = ListView1.FindControl("lblShippingPrice") as Label;
            //var hdnShippingPrice = ListView1.FindControl("hdnShippingPrice") as HiddenField;
            //var odsProvince = ListView1.FindControl("odsProvince") as ObjectDataSource;
            //var dv = (DataView)odsProvince.Select();
            var iShippingPrice = "0";// Convert.ToDouble(string.IsNullOrEmpty(dv[0]["ShippingPrice"].ToString()) ? "0" : dv[0]["ShippingPrice"].ToString());
            double TotalPrice = 0;
            double SumTotalPrice = 0;
            double ShippingPrice = 0;
            double VoucherPrice = 0;
            var productVoucher = new ProductVoucher();

            if (lblTotalPrice != null)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    TotalPrice += Quantity * Price;
                }

                ShippingPrice = Convert.ToDouble(iShippingPrice);
                //ShippingPrice = 20000;
                if (Session["SavePrice"] != null)
                {
                    //if (productVoucher.ProductVoucherSelectAll("", txtInputVoucher.Text, "", "", "", "", "", "", "", "1", "0").DefaultView.Count > 0)
                    //{
                    VoucherPrice = Convert.ToDouble(Session["SavePrice"].ToString());
                    SumTotalPrice = TotalPrice + ShippingPrice - VoucherPrice;
                    //}
                }
                else
                {
                    SumTotalPrice = TotalPrice + ShippingPrice;
                }

                hdnTotalPrice.Value = TotalPrice.ToString();
                hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                lblTotalPrice.Text = string.IsNullOrEmpty(TotalPrice.ToString()) ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                lblShippingPrice.Text = iShippingPrice.ToString() == "0" ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                hdnShippingPrice.Value = ShippingPrice.ToString();
                lblSavePrice.Text = VoucherPrice.ToString() == "0" ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", VoucherPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                hdnSavePrice.Value = VoucherPrice.ToString();
            }
        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        if (cmd == "Remove")
        {
            var ProductID = (item.FindControl("hdnCartProductID") as HiddenField).Value;
            var ProductOptionCategoryID = (item.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
            var ProductLengthID = (item.FindControl("hdnCartProductLengthID") as HiddenField).Value;

            var oShoppingCart = new ShoppingCart2();
            oShoppingCart.DeleteItem(ProductID, ProductOptionCategoryID, ProductLengthID);
            ListView1.DataBind();
        }
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        //var item = e.Item;
        //if (item.ItemType == ListViewItemType.DataItem)
        //{
        //    int iQuantity = 10;
        //    var ddlCartQuantity = (DropDownList)item.FindControl("ddlCartQuantity");
        //    var ddlCartProductLength = (DropDownList)item.FindControl("ddlCartProductLength");
        //    //string QuantityList = ((HiddenField)item.FindControl("hdnQuantityList")).Value.ToString();
        //    string Quantity = ((HiddenField)item.FindControl("hdnQuantity")).Value.ToString();
        //    var CartProductLengthID = ((HiddenField)item.FindControl("hdnCartProductLengthID")).Value.ToString();
        //    //var Arr = QuantityList.Split(',').ToArray();
        //    for (int i = 1; i <= iQuantity; i++)
        //        ddlCartQuantity.Items.Add(new ListItem(i.ToString()));
        //    //ddlCartQuantity.DataSource = Arr;
        //    //ddlCartQuantity.DataBind();
        //    if (!string.IsNullOrEmpty(Quantity))
        //        ddlCartQuantity.SelectedValue = Quantity;
        //    if (!string.IsNullOrEmpty(CartProductLengthID))
        //        ddlCartProductLength.SelectedValue = CartProductLengthID;
        //}
    }
    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        var textbox = (TextBox)sender;
        var parent = textbox.NamingContainer;
        var oShoppingCart = new ShoppingCart();
        var Quantity = (parent.FindControl("txtQuantity") as TextBox).Text.Trim();
        var ProductID = (parent.FindControl("hdnCartProductID") as HiddenField).Value;
        int Quantity1 = Int32.Parse(Quantity);
        if (Quantity1 > 0 && Quantity1 < 1000)
        {
            oShoppingCart.UpdateQuantity(ProductID, Quantity);
            ListView1.DataBind();
        }
        else
        {
            Quantity = "1";
            ScriptManager.RegisterClientScriptBlock((TextBox)sender, sender.GetType(), "runtime", "alert('Bạn nhập quá số lượng cho phép (1 - 12)')", true);
        }
    }
    protected void btnGui_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {

            var dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                Session["HoanThanh"] = "true";
                string CreateBy = "admin";
                string OrderNumber = DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);
                //Session["OrderNumber"] = OrderNumber;
                string Email = "";
                string FirstName = "";
                string Address = "";
                string PhoneNumber = "";
                double TotalPrice = 0;
                double SumTotalPrice = 0;
                string PaymentMethods = "";
                string OrderQuantity = "0";
                string OrderStatusID = "";
                Session["OrderNumber"] = OrderNumber;

                Email = txtEmail.Text.Trim().ToString();
                FirstName = txtFullName.Text.Trim().ToString();
                Address = txtAddress.Text.Trim().ToString();
                // City = txtTinh.Text.Trim().ToString();
                PhoneNumber = txtPhone.Text.Trim().ToString();

                //TotalPrice = Session["tongtien"].ToString();
                //OrderQuantity = Session["Quantity"].ToString();
                OrderStatusID = "1";
                PaymentMethods = "Thanh Toán Trực Tiếp";

                string Price = "0";
                // them don hang
                var oOrders = new Orders2();
                oOrders.Orders2Insert(
                    OrderNumber,
                    CreateBy,
                    DateTime.Now.ToString("MM/dd/yyyy"),
                    PaymentMethods,
                    FirstName,
                    Address,
                    PhoneNumber,
                    "",
                    Email,
                    OrderStatusID);

                // don hang chi tiet
                var oOrderDetail = new OrderDetail2();
                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductID = dr["ProductID"].ToString();
                    var Quantity = Convert.ToInt32(dr["Quantity"]);
                    if (dr["Price"] != null)
                    {
                        Price = (Convert.ToInt32(dr["Quantity"]) * (Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]))).ToString();
                    }
                    if (Session["UserName"] != null)
                    {
                        CreateBy = Session["UserName"].ToString();
                    }

                    oOrderDetail.OrderDetail2Insert(
                       OrderNumber,
                       ProductID,
                       Quantity.ToString(),
                       Price,
                       CreateBy
                    );
                }

                // hinh thuc thanh toan
                if (rbtMoney.Checked == true)
                {
                    string FullName = FirstName;
                    Session["FullName"] = FullName;
                    Session["Address"] = Address;
                    PaymentMethods = "Thanh Toán Trực Tiếp";

                    // noi dung mail xac nhan
                    string Body = "<div style='width: 100%; font-size: 14px; font-family: Arial;'>";
                    Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";
                    Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                    Body += "<p>Mã số đơn hàng của bạn là <b>" + Session["OrderNumber"] + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. </p>";
                    Body += "</div>";
                    Body += "<p><b>Người nhận</b></p>";
                    Body += "<p>Họ và tên: " + txtFullName.Text + "</p>";
                    Body += "<p>Email: " + txtEmail.Text + "</p>";
                    Body += "<p>Điện thoại: " + txtPhone.Text + "</p>";
                    Body += "<p>Địa chỉ: " + txtAddress.Text + "</p>";
                    //Body += "<p>Loại địa chỉ: " + dropLoaiDiaChi.SelectedItem.Text + "</p>";
                    Body += "<p>Tỉnh/Thành phố: " + ddlProvince.SelectedItem.Text + "</p>";
                    Body += "<p>Quận/Huyện: " + ddlDistrict.SelectedItem.Text + "</p>";
                    Body += "<p>Ghi chú: " + txtNote.Text + "</p>";
                    Body += "</div>";
                    Body += "<p><b>* Phương thức thanh toán</b>: " + PaymentMethods + "</p>";
                    Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                    //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                    Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Mã sản phẩm/Product Code</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Size</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Màu/Color</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductCode = dr["Tag"].ToString();
                        string ProductID = dr["ProductID"].ToString();
                        string ProductName = dr["ProductName"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        Price = dr["Price"].ToString();
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                        var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                        var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                        //Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                        Body += "<tr>";
                        Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductCode + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductLengthName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><div style='background: " + ProductOptionCategoryName + "; width: 30px; height: 30px;'></div></td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                        Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                        Body += "</tr>";
                        TotalPrice += tPrice;
                    }

                    if (!string.IsNullOrEmpty(hdnSavePrice.Value))
                    {
                        SumTotalPrice = TotalPrice - Convert.ToDouble(hdnSavePrice.Value);
                    }
                    else
                    {
                        SumTotalPrice = TotalPrice;
                    }

                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    Body += "<table style='font-size: 13px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                    Body += "<tr><td style='width:85%;'>Thành tiền:</td><td style='width:15%;'>" + string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td>Giảm:</td><td>" + string.Format("{0:##,###.##}", Convert.ToDouble(hdnSavePrice.Value)).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td><b>Tổng tiền:</b></td><td><b>" + string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</b></td></tr>";
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";

                    Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", txtEmail.Text, "hungtien408@gmail.com", "Đặt Hàng LADY fashion", Body, true);
                    /////////////////////////////////////////////////////////////////////////////////
                    txtFullName.Text = "";
                    txtPhone.Text = "";
                    txtEmail.Text = "";
                    txtAddress.Text = "";
                    txtNote.Text = "";
                    lblSavePrice.Text = "";
                    hdnSavePrice.Value = "";
                    var oShoppingCart = new ShoppingCart2();
                    oShoppingCart.DeleteAllItem();
                    Session["Cart"] = null;
                    Session["SavePrice"] = null;
                    ListView1.DataBind();
                    Response.Redirect("hoan-thanh-dat-hang.aspx");

                }
                else if (rbtEmail.Checked == true)
                {
                    string FullName = FirstName;
                    Session["FullName"] = FullName;
                    Session["Address"] = Address;
                    PaymentMethods = "Thanh Toán Chuyển Khoản";
                    oOrders.Orders2Update(
                        OrderNumber,
                        CreateBy,
                        DateTime.Now.ToString("MM/dd/yyyy"),
                        PaymentMethods,
                        FirstName,
                        Address,
                        PhoneNumber,
                        "",
                        Email,
                        OrderStatusID);

                    // noi dung mail xac nhan
                    string Body = "<div style='width: 100%; font-size: 14px; font-family: Arial;'>";
                    Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";
                    Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                    Body += "<p>Mã số đơn hàng của bạn là <b>" + Session["OrderNumber"] + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. </p>";
                    Body += "</div>";
                    Body += "<p><b>Người nhận</b></p>";
                    Body += "<p>Họ và tên: " + txtFullName.Text + "</p>";
                    Body += "<p>Email: " + txtEmail.Text + "</p>";
                    Body += "<p>Điện thoại: " + txtPhone.Text + "</p>";
                    Body += "<p>Địa chỉ: " + txtAddress.Text + "</p>";
                    //Body += "<p>Loại địa chỉ: " + dropLoaiDiaChi.SelectedItem.Text + "</p>";
                    Body += "<p>Tỉnh/Thành phố: " + ddlProvince.SelectedItem.Text + "</p>";
                    Body += "<p>Quận/Huyện: " + ddlDistrict.SelectedItem.Text + "</p>";
                    Body += "<p>Ghi chú: " + txtNote.Text + "</p>";
                    Body += "</div>";
                    Body += "<p><b>* Phương thức thanh toán</b>: " + PaymentMethods + "</p>";
                    Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                    //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                    Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Mã sản phẩm/Product Code</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Size</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Màu/Color</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductCode = dr["Tag"].ToString();
                        string ProductID = dr["ProductID"].ToString();
                        string ProductName = dr["ProductName"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        Price = dr["Price"].ToString();
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                        var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        //Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                        Body += "<tr>";
                        Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductCode + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductLengthName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><div style='background: " + ProductOptionCategoryName + "; width: 30px; height: 30px;'></div></td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                        Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                        Body += "</tr>";
                        TotalPrice += tPrice;
                    }

                    if (!string.IsNullOrEmpty(hdnSavePrice.Value))
                    {
                        SumTotalPrice = TotalPrice - Convert.ToDouble(hdnSavePrice.Value);
                    }
                    else
                    {
                        SumTotalPrice = TotalPrice;
                    }

                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    Body += "<table style='font-size: 13px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                    Body += "<tr><td style='width:85%;'>Thành tiền:</td><td style='width:15%;'>" + string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td>Giảm:</td><td>" + string.Format("{0:##,###.##}", Convert.ToDouble(hdnSavePrice.Value)).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td><b>Tổng tiền:</b></td><td><b>" + string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</b></td></tr>";
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";

                    Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", txtEmail.Text, "hungtien408@gmail.com", "Đặt Hàng LADY fashion", Body, true);
                    /////////////////////////////////////////////////////////////////////////////////
                    txtFullName.Text = "";
                    txtPhone.Text = "";
                    txtEmail.Text = "";
                    txtAddress.Text = "";
                    lblSavePrice.Text = "";
                    hdnSavePrice.Value = "";
                    txtNote.Text = "";
                    var oShoppingCart = new ShoppingCart2();
                    oShoppingCart.DeleteAllItem();
                    Session["Cart"] = null;
                    Session["SavePrice"] = null;
                    ListView1.DataBind();
                    Response.Redirect("hoan-thanh-dat-hang.aspx");

                }
            }

        }
    }
    protected void txtInputVoucher_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtInputVoucher.Text))
        {
            var productVoucher = new ProductVoucher();

            if (productVoucher.ProductVoucherSelectAll("", txtInputVoucher.Text, "", "", "", "", "", "", "", "1", "1").DefaultView.Count > 0)
            {
                validateVoucher.ErrorMessage = "Voucher <b>\"" + txtInputVoucher.Text + "\"</b> đã sử dụng!";
                validateVoucher.IsValid = false;
                txtInputVoucher.Text = "";
            }
            else if (productVoucher.ProductVoucherSelectAll("", txtInputVoucher.Text, "", "", "", "", "", "", "", "1", "0").DefaultView.Count > 0)
            {
                validateVoucher.IsValid = true;
                double ShippingPrice = 0;
                double VoucherPrice = 120000;
                double TotalPrice = 0;
                double SumTotalPrice = 0;
                var dtCart = Session["Cart"] as DataTable;
                if (dtCart != null)
                {
                    foreach (DataRow dr in dtCart.Rows)
                    {
                        var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                        var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                        TotalPrice += Quantity * Price;
                    }
                    SumTotalPrice = TotalPrice + ShippingPrice - VoucherPrice;
                    lblSavePrice.Text = VoucherPrice.ToString() == "0" ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", VoucherPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                    hdnSavePrice.Value = VoucherPrice.ToString();
                    hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                    lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                }
                Session["SavePrice"] = 120000;
                productVoucher.ProductVoucherQuickUpdate(txtInputVoucher.Text, Session["UserName"].ToString(), "1", "1");
                //ListView1.DataBind();
            }
            else
            {
                validateVoucher.ErrorMessage = "Mã Voucher <b>\"" + txtInputVoucher.Text + "\"</b> không đúng!";
                validateVoucher.IsValid = false;
                txtInputVoucher.Text = "";
            }
        }
        //ListView1.DataBind();
    }
}