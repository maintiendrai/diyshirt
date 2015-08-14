package com.diyshirt.model.encryption;

import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import org.bouncycastle.jce.provider.*;
import org.bouncycastle.util.encoders.*;
import sun.misc.*;
import java.util.*;

/**
 *
 * <p>Title: </p>
 * JAVAͨ�ü�����
 * <p>Description: </p>
 *
 * �ṩ�����㷨�ͱ���ת�����ܣ�����3DES���ܽ����㷨��MD5�����㷨��SHA1ժҪ�㷨��BASE64�������ȡ�
 * <p>Copyright: Copyright (c) 2006</p>
 *
 * <p>Company: �������</p>
 *
 * @author ���b
 * @version 1.0
 */
public class Encrypter {
  //���� �����㷨,���� DES,DESede,Blowfish
  private static final String Algorithm = "DESede";

  static {
    Security.addProvider(new com.sun.crypto.provider.SunJCE());
    Security.addProvider(new BouncyCastleProvider());
  }

  public Encrypter() {
  }
  
  public static void main (String[] args) throws Exception{
	  Encrypter en = new Encrypter();
	  System.out.println(en.MD5("350702198006260039"));
	  System.out.println(en.MD5("jamy"));
  }

  /**
   * MD5����
   * @param str String ����
   * @return String    ����
   */
  public String MD5(String str) {
    Md5encrypter md5 = new Md5encrypter();
    return md5.getMD5ofStr(str);
  }

  /**
   * ���ݲ����������3DES KEY
   * @param strKey
   */
  public Key getKey(String strKey) {
    Key key = null;
    try {
      KeyGenerator _generator = KeyGenerator.getInstance(Algorithm);
      _generator.init(new SecureRandom(strKey.getBytes()));
      key = _generator.generateKey();
      _generator = null;

    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return key;
  }

  /**
   * 3DES���ܺ���
   * @param keybyte byte[]  ������Կ������Ϊ24�ֽ�
   * @param src byte[] ����
   * @return byte[]    ����
   */
  public byte[] DESEncrypt(byte[] keybyte, byte[] src) {
    try {

      Cipher cEnc = Cipher.getInstance("DESede/CBC/PKCS7Padding", "BC");
      cEnc.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(keybyte, Algorithm),
                new IvParameterSpec(Hex.decode("0102030405060708")));
      return cEnc.doFinal(src);

    }
    catch (java.security.NoSuchAlgorithmException e1) {
      e1.printStackTrace();
    }
    catch (javax.crypto.NoSuchPaddingException e2) {
      e2.printStackTrace();
    }
    catch (java.lang.Exception e3) {
      e3.printStackTrace();
    }
    return null;

  }

  /**
   * 3DES���ܺ���
   * @param keystr String ������Կ������Ϊ48λ�ַ�����16��������
   * @param src byte[] ����
   * @return byte[] ����
   */
  public byte[] DESEncrypt(String keystr, byte[] src) {

    byte[] bytesKey = Hex.decode(keystr);
    return DESEncrypt(bytesKey, src);
  }

  /**
   * ����SHA1ժҪ
   * @param strTobeDigest String ԭ��
   * @return String  ժҪ�ַ���
   * @throws Exception
   */
  public String generateDigest(String strTobeDigest) throws Exception {
    byte input[] = strTobeDigest.getBytes("UTF-8");
    byte output[] = null;
    MessageDigest DigestGenerator = MessageDigest.getInstance("SHA1");
    DigestGenerator.update(input);
    output = DigestGenerator.digest();
    return new String(BASE64Encode(output));
  }

  /**
   * У��ժҪ��Ϣ
   * @param source String ԭ��
   * @param digest byte[]  ժҪ
   * @return boolean  ժҪ�Ƿ�ƥ��
   * @throws Exception
   */
  public boolean checkDigest(String source, byte[] digest) throws
      Exception {
    java.security.MessageDigest algb = java.security.MessageDigest.
        getInstance("SHA-1");
    algb.update(source.getBytes("UTF-8"));
    if (algb.isEqual(digest, algb.digest())) {
      return true;
    }
    else {
      return false;
    }
  }

  /**
   * 3DES���ܺ���
   * @param keybyte byte[] ��Կ������Ϊ24�ֽ�
   * @param src byte[]   ����
   * @return byte[]  ����
   */
  public byte[] DESDecrypt(byte[] keybyte, byte[] src) {
    try {
      SecretKeySpec spec = new SecretKeySpec(keybyte, Algorithm);
      Cipher cipher = Cipher.getInstance("DESede/CBC/PKCS7Padding", "BC");
      cipher.init(Cipher.DECRYPT_MODE, spec,
                  new IvParameterSpec(Hex.decode("0102030405060708")));
      byte[] decrypt = cipher.doFinal(src);
      return decrypt;

    }
    catch (java.security.NoSuchAlgorithmException e1) {
      e1.printStackTrace();
    }
    catch (javax.crypto.NoSuchPaddingException e2) {
      e2.printStackTrace();
    }
    catch (java.lang.Exception e3) {
      e3.printStackTrace();
    }
    return null;

  }

  /**
   * 3DES���ܺ���
   * @param keystr String ��Կ������Ϊ48λ�ַ�����16��������
   * @param src byte[]   ����
   * @return byte[]  ����
   */
  public byte[] DESDecrypt(String keystr, byte[] src) {
    byte[] bytesKey = Hex.decode(keystr);
    return DESDecrypt(bytesKey, src);
  }

  /**
   * BASE64����
   * @param byteStr byte[] �ֽ���
   * @return String  BASE64�ַ���
   */
  public String BASE64Encode(byte[] byteStr) {
    BASE64Encoder base64en = new BASE64Encoder();
    return base64en.encode(byteStr);
  }

  /**
   * BASE64����
   * @param str String �����ַ���
   * @return byte[]  �ֽ���
   * @throws Exception
   */
  public byte[] BASE64Decode(String str) throws Exception {
    BASE64Decoder base64de = new BASE64Decoder();
    byte[] b = base64de.decodeBuffer(str);
    return b;
  }

  /**
   * ��ȡSHA1�㷨ժҪ
   * @param instr String �ַ���
   * @return byte[] ժҪ
   * @throws Exception
   */
  public byte[] SHA1(String instr) throws Exception {
    java.security.MessageDigest alga = java.security.MessageDigest.getInstance(
        "SHA-1");
    alga.update(instr.getBytes("UTF-8"));
    byte[] digesta = alga.digest();
    return digesta;
  }

  /**
   * ���ֽ���ת��Ϊ�ַ�����16���ƣ�
   * @param b byte[]
   * @return String
   */
  public static String byte2hex(byte[] b) { //������ת�ַ���
    String hs = "";
    String stmp = "";
    for (int n = 0; n < b.length; n++) {
      stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
      if (stmp.length() == 1) {
        hs = hs + "0" + stmp;
      }
      else {
        hs = hs + stmp;
      }
      if (n < b.length - 1) {
        hs = hs; //+ ":";
      }
    }
    return hs.toUpperCase();
  }

}
