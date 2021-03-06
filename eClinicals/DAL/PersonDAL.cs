﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;
using eClinicals.Model;

namespace eClinicals.DAL
{
    class PersonDAL
    {

        public static int createContactInfo(string lName, string fName, DateTime dob, string streetAddress, string city, string state, string zip, string phone, string gender, string ssn, int userType)
        {
            int contactID = 0;
            try
            {
                using (SqlConnection connect = DBConnection.GetConnection())
                {
                    connect.Open();
                    string insertStmt = "INSERT INTO contact (lName, fName, dob, mailingAddressStreet, mailingAddressCity, mailingAddressState, mailingAddressZip, phoneNumber, gender, SSN, userType) " +
                        "VALUES (@last, @first, @dob, @street, @city, @state, @zip, @phone, @gender, @ssn, @userType)";
                    using (SqlCommand cmd = new SqlCommand(insertStmt, connect))
                    {
                        cmd.Parameters.AddWithValue("@last", lName);
                        cmd.Parameters.AddWithValue("@first", fName);
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@street", streetAddress);
                        cmd.Parameters.AddWithValue("@city", city);
                        cmd.Parameters.AddWithValue("@state", state);
                        cmd.Parameters.AddWithValue("@zip", zip);
                        cmd.Parameters.AddWithValue("@phone", phone);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@ssn", ssn);
                        cmd.Parameters.AddWithValue("@userType", userType);
                        cmd.ExecuteNonQuery();
                        SqlCommand getContactCmd = new SqlCommand();
                        getContactCmd.Connection = connect;
                        getContactCmd.CommandText = "SELECT MAX(contactID) AS maxContact FROM contact";
                        using (SqlDataReader reader = getContactCmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                contactID = (int)reader["maxContact"];
                            }
                        }
                        connect.Close();
                        return contactID;
                    }
                }
            }
            catch
            {
                return 0;
            }

        }


        public static bool checkPassword(string username, string enteredPassword)
        {
            bool isMatch = false;
            try
            {
                using (SqlConnection connect = DBConnection.GetConnection())
                {

                    string selectStmt = "SELECT password FROM logins WHERE userName = @username";
                    connect.Open();

                    using (SqlCommand cmd = new SqlCommand(selectStmt, connect))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string storedPassword = reader["password"].ToString();                             

                                if (enteredPassword == storedPassword)  
                                {
                                    isMatch = true;
                                }
                                else
                                {
                                    isMatch = false;
                                }
                            }
                            reader.Close();
                        }
                    }
                    connect.Close();
                }
            }
            catch
            {
                isMatch = false;
                return isMatch;
            }
            return isMatch;
        }


        public static Person GetLoggedInUserDetails (string username, string password)
        {
            Person user = new Person();
            string selectStatement = "SELECT userName, logins.contactID, lName, fName, phoneNumber, mailingAddressStreet, "
                + "mailingAddressCity, mailingAddressState, mailingAddressZip, userType "
                + "FROM logins LEFT JOIN contact ON logins.contactID = contact.contactID "
                + "WHERE userName = @username AND password = @password";
            try
            {
                using (SqlConnection connection = DBConnection.GetConnection())
                {
                    connection.Open();
                    using (SqlCommand selectCommand = new SqlCommand(selectStatement, connection))
                    {
                        selectCommand.Parameters.AddWithValue("@username", username);
                        selectCommand.Parameters.AddWithValue("@password", password);
                        using (SqlDataReader reader = selectCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                user.UserName = reader["userName"].ToString();
                                user.ContactID = (int)reader["contactID"];
                                user.LastName = reader["lName"].ToString();
                                user.FirstName = reader["fName"].ToString();
                                user.Phone = reader["phoneNumber"].ToString();
                                user.Address = reader["mailingAddressStreet"].ToString();
                                user.City = reader["mailingAddressCity"].ToString();
                                user.State = reader["mailingAddressState"].ToString();
                                user.Zip = reader["mailingAddressZip"].ToString();
                                user.UserType = (int)reader["userType"];
                            }
                            reader.Close();
                        }
                    }
                    connection.Close();
                }
            }
            catch (SqlException ex)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw;
            }
            return user;
        }



    }
}
