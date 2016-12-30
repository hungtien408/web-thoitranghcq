using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace TLLib
{
    public class ProductStyle
    {
        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;

        public string ProductStyleInsert(
            string ProductStyleName,
            string ProductStyleNameEn,
            string ConvertedProductStyleName,
            string ProductStyleImage,
            string IsAvailable,
            string Priority,
            string ProductID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyle_Insert", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleName", string.IsNullOrEmpty(ProductStyleName) ? dbNULL : (object)ProductStyleName);
                cmd.Parameters.AddWithValue("@ProductStyleNameEn", string.IsNullOrEmpty(ProductStyleNameEn) ? dbNULL : (object)ProductStyleNameEn);
                cmd.Parameters.AddWithValue("@ConvertedProductStyleName", string.IsNullOrEmpty(ConvertedProductStyleName) ? dbNULL : (object)ConvertedProductStyleName);
                cmd.Parameters.AddWithValue("@ProductStyleImage", string.IsNullOrEmpty(ProductStyleImage) ? dbNULL : (object)ProductStyleImage);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@ProductID", string.IsNullOrEmpty(ProductID) ? dbNULL : (object)ProductID);

                SqlParameter imageNameParam = new SqlParameter("@OutImageName", null);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                imageNameParam.Size = 100;
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = imageNameParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(imageNameParam);
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyle_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return imageNameParam.Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductStyleUpdate(
            string ProductStyleID,
            string ProductStyleName,
            string ProductStyleNameEn,
            string ConvertedProductStyleName,
            string ProductStyleImage,
            string IsAvailable,
            string Priority,
            string ProductID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyle_Update", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleID", string.IsNullOrEmpty(ProductStyleID) ? dbNULL : (object)ProductStyleID);
                cmd.Parameters.AddWithValue("@ProductStyleName", string.IsNullOrEmpty(ProductStyleName) ? dbNULL : (object)ProductStyleName);
                cmd.Parameters.AddWithValue("@ProductStyleNameEn", string.IsNullOrEmpty(ProductStyleNameEn) ? dbNULL : (object)ProductStyleNameEn);
                cmd.Parameters.AddWithValue("@ConvertedProductStyleName", string.IsNullOrEmpty(ConvertedProductStyleName) ? dbNULL : (object)ConvertedProductStyleName);
                cmd.Parameters.AddWithValue("@ProductStyleImage", string.IsNullOrEmpty(ProductStyleImage) ? dbNULL : (object)ProductStyleImage);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@ProductID", string.IsNullOrEmpty(ProductID) ? dbNULL : (object)ProductID);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyle_Update' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductStyleQuickUpdate(
            string ProductStyleID,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyle_QuickUpdate", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleID", string.IsNullOrEmpty(ProductStyleID) ? dbNULL : (object)ProductStyleID);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyle_QuickUpdate' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductStyleDelete(
            string ProductStyleID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyle_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleID", string.IsNullOrEmpty(ProductStyleID) ? dbNULL : (object)ProductStyleID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyle_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductStyleSelectAll(
            string ProductStyleName,
            string IsAvailable,
            string Priority,
            string SortByPriority,
            string ProductID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyle_SelectAll", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleName", string.IsNullOrEmpty(ProductStyleName) ? dbNULL : (object)ProductStyleName);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@SortByPriority", string.IsNullOrEmpty(SortByPriority) ? dbNULL : (object)SortByPriority);
                cmd.Parameters.AddWithValue("@ProductID", string.IsNullOrEmpty(ProductID) ? dbNULL : (object)ProductID);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyle_SelectAll' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductStyleSelectOne(
            string ProductStyleID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyle_SelectOne", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleID", string.IsNullOrEmpty(ProductStyleID) ? dbNULL : (object)ProductStyleID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyle_SelectOne' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductStyleImageDelete(
            string ProductStyleID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductStyleImage_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductStyleID", string.IsNullOrEmpty(ProductStyleID) ? dbNULL : (object)ProductStyleID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductStyleImage_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
