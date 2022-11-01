/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Models;

import java.sql.Date;

/**
 *
 * @author vhqua
 */
public class Employee {

    private String Emp_ID;
    private String Emp_name;
    private Date Emp_birthday;
    private String Emp_gender;
    private String Emp_phone;
    private String Emp_address;
    private String Emp_role;
    private String Username;
    private String Password;

    public Employee(String Emp_ID, String Emp_name, Date Emp_birthday, String Emp_gender, String Emp_phone, String Emp_address, String Emp_role, String Username, String Password) {
        this.Emp_ID = Emp_ID;
        this.Emp_name = Emp_name;
        this.Emp_birthday = Emp_birthday;
        this.Emp_gender = Emp_gender;
        this.Emp_phone = Emp_phone;
        this.Emp_address = Emp_address;
        this.Emp_role = Emp_role;
        this.Username = Username;
        this.Password = Password;
    }

    public String getEmp_ID() {
        return Emp_ID;
    }

    public void setEmp_ID(String Emp_ID) {
        this.Emp_ID = Emp_ID;
    }

    public String getEmp_name() {
        return Emp_name;
    }

    public void setEmp_name(String Emp_name) {
        this.Emp_name = Emp_name;
    }

    public Date getEmp_birthday() {
        return Emp_birthday;
    }

    public void setEmp_birthday(Date Emp_birthday) {
        this.Emp_birthday = Emp_birthday;
    }

    public String getEmp_address() {
        return Emp_address;
    }

    public void setEmp_address(String Emp_address) {
        this.Emp_address = Emp_address;
    }

    public String getEmp_role() {
        return Emp_role;
    }

    public void setEmp_role(String Emp_role) {
        this.Emp_role = Emp_role;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    @Override
    public String toString() {
        return "Employee{" + "Emp_ID=" + Emp_ID + ", Emp_name=" + Emp_name + ", Emp_birthday=" + Emp_birthday + ", Emp_address=" + Emp_address + ", Emp_role=" + Emp_role + ", Username=" + Username + ", Password=" + Password + '}';
    }

    public String getEmp_gender() {
        return Emp_gender;
    }

    public void setEmp_gender(String Emp_gender) {
        this.Emp_gender = Emp_gender;
    }

    public String getEmp_phone() {
        return Emp_phone;
    }

    public void setEmp_phone(String Emp_phone) {
        this.Emp_phone = Emp_phone;
    }

}
