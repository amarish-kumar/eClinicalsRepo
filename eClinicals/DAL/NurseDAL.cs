﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.IO;
using eClinicals.Model;


namespace eClinicals.DAL
{
    class NurseDAL
    {
        public static bool CreateNurse(int contactID)
        {

           try
            {
                using (SqlConnection connect = DBConnection.GetConnection())
               {
                   connect.Open();
                   string insertStmt = "INSERT INTO nurse (contactID) VALUES (@contact);";
                    using (SqlCommand cmd = new SqlCommand(insertStmt, connect))
                    {
                       cmd.Parameters.AddWithValue("@contact", contactID);
                       cmd.ExecuteNonQuery();
                       connect.Close();
                        return true;
                    }
                }
            }
            catch
            {
                return false;
            }

        }

        public static Nurse GetNurseByID(int contactID)
        {
            Nurse nurse = new Nurse();
            try
            {
                using (SqlConnection connect = DBConnection.GetConnection())
                {
                    connect.Open();
                    string selStmt = "SELECT * FROM contact INNER JOIN nurse ON contact.contactID = nurse.contactID WHERE nurse.contactID = @contactID";
                    using (SqlCommand cmd = new SqlCommand(selStmt, connect))
                    {
                        cmd.Parameters.AddWithValue("@contactID", contactID);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                nurse.NurseID = (int)reader["nurseID"];
                                nurse.ContactID = (int)reader["contactID"];
                                nurse.LastName = reader["lName"].ToString();
                                nurse.FirstName = reader["fName"].ToString();
                                nurse.Dob = (DateTime)reader["dob"];
                                nurse.Address = reader["mailingAddressStreet"].ToString();
                                nurse.City = reader["mailingAddressCity"].ToString();
                                nurse.State = reader["mailingAddressState"].ToString();
                                nurse.Zip = reader["mailingAddressZip"].ToString();
                                nurse.Phone = reader["phoneNumber"].ToString();
                                nurse.Gender = reader["gender"].ToString();
                                nurse.Ssn = reader["ssn"].ToString();
                            }
                            reader.Close();
                        }
                    }
                    connect.Close();
                }
            }
            catch (SqlException sqlex)
            {
                throw sqlex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return nurse;
        }





    }
}
