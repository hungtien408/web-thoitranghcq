using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TLLib
{
    public class Manufacturer
    {
        #region Class Member Declaration
        private string m_ManufacturerID;
        #endregion

        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;

        public string ManufacturerInsert(
            string ImageName,
            string ConvertedManufacturerName,
            string ManufacturerName,
            string ManufacturerNameEn,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_Insert", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ImageName", string.IsNullOrEmpty(ImageName) ? dbNULL : (object)ImageName);
                cmd.Parameters.AddWithValue("@ConvertedManufacturerName", string.IsNullOrEmpty(ConvertedManufacturerName) ? dbNULL : (object)ConvertedManufacturerName);
                cmd.Parameters.AddWithValue("@ManufacturerName", string.IsNullOrEmpty(ManufacturerName) ? dbNULL : (object)ManufacturerName);
                cmd.Parameters.AddWithValue("@ManufacturerNameEn", string.IsNullOrEmpty(ManufacturerNameEn) ? dbNULL : (object)ManufacturerNameEn);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);

                SqlParameter imageNameParam = new SqlParameter("@OutImageName", null);
                SqlParameter manufacturerIDParam = new SqlParameter("@OutManufacturerID", null);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                imageNameParam.Size = 100;
                errorCodeParam.Size = manufacturerIDParam.Size = 4;
                errorCodeParam.Direction = imageNameParam.Direction = manufacturerIDParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(imageNameParam);
                cmd.Parameters.Add(manufacturerIDParam);
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_Manufacturer_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                m_ManufacturerID = manufacturerIDParam.Value.ToString();

                return imageNameParam.Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ManufacturerUpdate(
            string ManufacturerID,
            string ImageName,
            string ConvertedManufacturerName,
            string ManufacturerName,
            string ManufacturerNameEn,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_Update", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ManufacturerID", string.IsNullOrEmpty(ManufacturerID) ? dbNULL : (object)ManufacturerID);
                cmd.Parameters.AddWithValue("@ImageName", string.IsNullOrEmpty(ImageName) ? dbNULL : (object)ImageName);
                cmd.Parameters.AddWithValue("@ConvertedManufacturerName", string.IsNullOrEmpty(ConvertedManufacturerName) ? dbNULL : (object)ConvertedManufacturerName);
                cmd.Parameters.AddWithValue("@ManufacturerName", string.IsNullOrEmpty(ManufacturerName) ? dbNULL : (object)ManufacturerName);
                cmd.Parameters.AddWithValue("@ManufacturerNameEn", string.IsNullOrEmpty(ManufacturerNameEn) ? dbNULL : (object)ManufacturerNameEn);
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
                    throw new Exception("Stored Procedure 'usp_Manufacturer_Update' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ManufacturerQuickUpdate(
            string ManufacturerID,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_QuickUpdate", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ManufacturerID", string.IsNullOrEmpty(ManufacturerID) ? dbNULL : (object)ManufacturerID);
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
                    throw new Exception("Stored Procedure 'usp_Manufacturer_QuickUpdate' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ManufacturerDelete(
            string ManufacturerID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ManufacturerID", string.IsNullOrEmpty(ManufacturerID) ? dbNULL : (object)ManufacturerID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_Manufacturer_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ManufacturerSelectAll(
            string ManufacturerName,
            string IsAvailable,
            string Priority,
            string SortByPriority
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_SelectAll", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ManufacturerName", string.IsNullOrEmpty(ManufacturerName) ? dbNULL : (object)ManufacturerName);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@SortByPriority", string.IsNullOrEmpty(SortByPriority) ? dbNULL : (object)SortByPriority);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_Manufacturer_SelectAll' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ManufacturerSelectOne(
            string ManufacturerID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_SelectOne", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ManufacturerID", string.IsNullOrEmpty(ManufacturerID) ? dbNULL : (object)ManufacturerID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_Manufacturer_SelectOne' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ManufacturerImageDelete(
            string ManufacturerID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_Manufacturer_DeleteImage", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ManufacturerID", string.IsNullOrEmpty(ManufacturerID) ? dbNULL : (object)ManufacturerID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_Manufacturer_DeleteImage' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        #region Properties

        public string ManufacturerID
        {
            get { return m_ManufacturerID; }
            set { m_ManufacturerID = value; }
        }

        #endregion
    }
}

