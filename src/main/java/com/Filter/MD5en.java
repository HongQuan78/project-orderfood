/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Filter;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author vhqua
 */
public class MD5en {
      /*
     * Encryption password
     *
     * @param input it is a password used to encrypt
     * @return password after encrypt
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public String encrypt(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance("MD5");//create new object to encrypt
        byte[] srcByte = input.getBytes("UTF-8");//get byte of src string
        byte[] enByte = md.digest(srcByte);//encrypt
        String enString = new BigInteger(1, enByte).toString(16);//convert array byte to hex
        return enString;
    }
}
