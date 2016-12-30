using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace TLLib
{
    public class ProductColor
    {
        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;
        public int ProductColorDelete(string ProductColorID)
        {
            int num2;
            try
            {
                SqlConnection connection = new SqlConnection(this.connectionString);
                SqlCommand command = new SqlCommand("usp_ProductColor_Delete", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@ProductColorID", string.IsNullOrEmpty(ProductColorID) ? ((object)this.dbNULL) : ((object)ProductColorID));
                SqlParameter parameter = new SqlParameter("@ErrorCode", null)
                {
                    Size = 4,
                    Direction = ParameterDirection.Output
                };
                command.Parameters.Add(parameter);
                connection.Open();
                int num = command.ExecuteNonQuery();
                connection.Close();
                if (parameter.Value.ToString() != "0")
                {
                    throw new Exception("Stored Procedure 'usp_ProductColor_Delete' reported the ErrorCode : " + parameter.Value.ToString());
                }
                num2 = num;
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }
            return num2;
        }

        public string ProductColorInsert(string ProductColorName, string ProductColorImages, string ConvertedProductColorName, string ProductColorDescription, string IsAvailable)
        {
            string str;
            try
            {
                SqlConnection connection = new SqlConnection(this.connectionString);
                SqlCommand command = new SqlCommand("usp_ProductColor_Insert", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@ProductColorName", string.IsNullOrEmpty(ProductColorName) ? ((object)this.dbNULL) : ((object)ProductColorName));
                command.Parameters.AddWithValue("@ProductColorImages", string.IsNullOrEmpty(ProductColorImages) ? ((object)this.dbNULL) : ((object)ProductColorImages));
                command.Parameters.AddWithValue("@ConvertedProductColorName", string.IsNullOrEmpty(ConvertedProductColorName) ? ((object)this.dbNULL) : ((object)ConvertedProductColorName));
                command.Parameters.AddWithValue("@ProductColorDescription", string.IsNullOrEmpty(ProductColorDescription) ? ((object)this.dbNULL) : ((object)ProductColorDescription));
                command.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? ((object)this.dbNULL) : ((object)IsAvailable));
                SqlParameter parameter = new SqlParameter("@OutImageName", null);
                SqlParameter parameter2 = new SqlParameter("@ErrorCode", null);
                parameter.Size = 100;
                parameter2.Size = 4;
                parameter2.Direction = parameter.Direction = ParameterDirection.Output;
                command.Parameters.Add(parameter);
                command.Parameters.Add(parameter2);
                connection.Open();
                int num = command.ExecuteNonQuery();
                connection.Close();
                if (parameter2.Value.ToString() != "0")
                {
                    throw new Exception("Stored Procedure 'usp_ProductColor_Insert' reported the ErrorCode : " + parameter2.Value.ToString());
                }
                str = parameter.Value.ToString();
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }
            return str;
        }

        public int ProductColorUpdate(string ProductColorID, string ProductColorName, string ProductColorImages, string ConvertedProductColorName, string ProductColorDescription, string IsAvailable)
        {
            int num2;
            try
            {
                SqlConnection connection = new SqlConnection(this.connectionString);
                SqlCommand command = new SqlCommand("usp_ProductColor_Update", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@ProductColorID", string.IsNullOrEmpty(ProductColorID) ? ((object)this.dbNULL) : ((object)ProductColorID));
                command.Parameters.AddWithValue("@ProductColorName", string.IsNullOrEmpty(ProductColorName) ? ((object)this.dbNULL) : ((object)ProductColorName));
                command.Parameters.AddWithValue("@ProductColorImages", string.IsNullOrEmpty(ProductColorImages) ? ((object)this.dbNULL) : ((object)ProductColorImages));
                command.Parameters.AddWithValue("@ConvertedProductColorName", string.IsNullOrEmpty(ConvertedProductColorName) ? ((object)this.dbNULL) : ((object)ConvertedProductColorName));
                command.Parameters.AddWithValue("@ProductColorDescription", string.IsNullOrEmpty(ProductColorDescription) ? ((object)this.dbNULL) : ((object)ProductColorDescription));
                command.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? ((object)this.dbNULL) : ((object)IsAvailable));
                SqlParameter parameter = new SqlParameter("@ErrorCode", null)
                {
                    Size = 4,
                    Direction = ParameterDirection.Output
                };
                command.Parameters.Add(parameter);
                connection.Open();
                int num = command.ExecuteNonQuery();
                connection.Close();
                if (parameter.Value.ToString() != "0")
                {
                    throw new Exception("Stored Procedure 'usp_ProductColor_Update' reported the ErrorCode : " + parameter.Value.ToString());
                }
                num2 = num;
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }
            return num2;
        }

        public DataTable ProductColorSelectAll(string ProductColorName, string IsAvailable)
        {
            DataTable table2;
            try
            {
                DataTable dataTable = new DataTable();
                SqlConnection connection = new SqlConnection(this.connectionString);
                SqlCommand selectCommand = new SqlCommand("usp_ProductColor_SelectAll", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                selectCommand.Parameters.AddWithValue("@ProductColorName", string.IsNullOrEmpty(ProductColorName) ? ((object)this.dbNULL) : ((object)ProductColorName));
                selectCommand.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? ((object)this.dbNULL) : ((object)IsAvailable));
                SqlParameter parameter = new SqlParameter("@ErrorCode", null)
                {
                    Size = 4,
                    Direction = ParameterDirection.Output
                };
                selectCommand.Parameters.Add(parameter);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                if (parameter.Value.ToString() != "0")
                {
                    throw new Exception("Stored Procedure 'usp_ProductColor_SelectAll' reported the ErrorCode : " + parameter.Value.ToString());
                }
                table2 = dataTable;
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }
            return table2;
        }


    }
}
