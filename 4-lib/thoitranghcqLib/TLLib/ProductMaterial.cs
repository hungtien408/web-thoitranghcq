using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace TLLib
{
    public class ProductMaterial
    {
        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;

        public string ProductMaterialInsert(
            string ProductMaterialName,
            string ProductMaterialNameEn,
            string ConvertedProductMaterialName,
            string ProductMaterialImage,
            string IsAvailable,
            string Priority,
            string ProductID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductMaterial_Insert", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialName", string.IsNullOrEmpty(ProductMaterialName) ? dbNULL : (object)ProductMaterialName);
                cmd.Parameters.AddWithValue("@ProductMaterialNameEn", string.IsNullOrEmpty(ProductMaterialNameEn) ? dbNULL : (object)ProductMaterialNameEn);
                cmd.Parameters.AddWithValue("@ConvertedProductMaterialName", string.IsNullOrEmpty(ConvertedProductMaterialName) ? dbNULL : (object)ConvertedProductMaterialName);
                cmd.Parameters.AddWithValue("@ProductMaterialImage", string.IsNullOrEmpty(ProductMaterialImage) ? dbNULL : (object)ProductMaterialImage);
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
                    throw new Exception("Stored Procedure 'usp_ProductMaterial_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return imageNameParam.Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductMaterialUpdate(
            string ProductMaterialID,
            string ProductMaterialName,
            string ProductMaterialNameEn,
            string ConvertedProductMaterialName,
            string ProductMaterialImage,
            string IsAvailable,
            string Priority,
            string ProductID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductMaterial_Update", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialID", string.IsNullOrEmpty(ProductMaterialID) ? dbNULL : (object)ProductMaterialID);
                cmd.Parameters.AddWithValue("@ProductMaterialName", string.IsNullOrEmpty(ProductMaterialName) ? dbNULL : (object)ProductMaterialName);
                cmd.Parameters.AddWithValue("@ProductMaterialNameEn", string.IsNullOrEmpty(ProductMaterialNameEn) ? dbNULL : (object)ProductMaterialNameEn);
                cmd.Parameters.AddWithValue("@ConvertedProductMaterialName", string.IsNullOrEmpty(ConvertedProductMaterialName) ? dbNULL : (object)ConvertedProductMaterialName);
                cmd.Parameters.AddWithValue("@ProductMaterialImage", string.IsNullOrEmpty(ProductMaterialImage) ? dbNULL : (object)ProductMaterialImage);
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
                    throw new Exception("Stored Procedure 'usp_ProductMaterial_Update' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductMaterialQuickUpdate(
            string ProductMaterialID,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductMaterial_QuickUpdate", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialID", string.IsNullOrEmpty(ProductMaterialID) ? dbNULL : (object)ProductMaterialID);
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
                    throw new Exception("Stored Procedure 'usp_ProductMaterial_QuickUpdate' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductMaterialDelete(
            string ProductMaterialID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductMaterial_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialID", string.IsNullOrEmpty(ProductMaterialID) ? dbNULL : (object)ProductMaterialID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductMaterial_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductMaterialSelectAll(
            string ProductMaterialName,
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
                var cmd = new SqlCommand("usp_ProductMaterial_SelectAll", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialName", string.IsNullOrEmpty(ProductMaterialName) ? dbNULL : (object)ProductMaterialName);
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
                    throw new Exception("Stored Procedure 'usp_ProductMaterial_SelectAll' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductMaterialSelectOne(
            string ProductMaterialID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductMaterial_SelectOne", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialID", string.IsNullOrEmpty(ProductMaterialID) ? dbNULL : (object)ProductMaterialID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductMaterial_SelectOne' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductMaterialImageDelete(
            string ProductMaterialID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductMaterialImage_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductMaterialID", string.IsNullOrEmpty(ProductMaterialID) ? dbNULL : (object)ProductMaterialID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductMaterialImage_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
